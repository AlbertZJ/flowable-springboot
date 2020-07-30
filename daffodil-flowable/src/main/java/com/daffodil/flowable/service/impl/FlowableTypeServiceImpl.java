package com.daffodil.flowable.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.daffodil.core.constant.Constants;
import com.daffodil.core.dao.JpaDao;
import com.daffodil.core.entity.Query;
import com.daffodil.core.entity.Ztree;
import com.daffodil.core.exception.BaseException;
import com.daffodil.flowable.entity.ActCnFlowType;
import com.daffodil.flowable.service.IFlowableTypeService;
import com.daffodil.framework.shiro.util.ShiroUtils;
import com.daffodil.util.HqlUtils;
import com.daffodil.util.StringUtils;

/**
 * 
 * @author yweijian
 * @date 2020年2月11日
 * @version 1.0
 */
@Service
public class FlowableTypeServiceImpl implements IFlowableTypeService {

	@Autowired
	private JpaDao jpaDao;
	
	@Override
	public List<ActCnFlowType> selectFlowTypeList(Query<ActCnFlowType> query) {
		StringBuffer hql  = new StringBuffer("from ActCnFlowType where 1=1 ");
		List<Object> paras = new ArrayList<Object>();
		HqlUtils.createHql(hql, paras, query);
		return jpaDao.search(hql.toString(), paras, ActCnFlowType.class, query.getPage());
	}

	@Override
	public List<Ztree> selectFlowTypeTree(Query<ActCnFlowType> query) {
		List<ActCnFlowType> typeList = this.selectFlowTypeList(query);
		List<Ztree> ztrees = this.initZtree(typeList);
		return ztrees;
	}

	@Override
	@Transactional
	public void deleteFlowTypeById(String flowTypeId) {
		int count = jpaDao.count("from ActCnFlowType where parentId = ?", flowTypeId);
		if(count > 0){
			throw new BaseException("删除流程类型失败，存在下级流程类型，不允许删除");
		}
		jpaDao.delete(ActCnFlowType.class, flowTypeId);
	}

	@Override
	@Transactional
	public void insertFlowType(ActCnFlowType flowType) {
		if (this.checkFlowTypeNameUnique(flowType)) {
			throw new BaseException("新增流程类型【" + flowType.getTypeName() + "】失败，流程类型名称已存在");
		}
		ActCnFlowType parentType = this.selectFlowTypeById(flowType.getParentId());
		if(StringUtils.isNotEmpty(parentType.getAncestors())){
			flowType.setAncestors(parentType.getAncestors() + "," + flowType.getParentId());
		}else{
			flowType.setAncestors(flowType.getParentId());
		}
		flowType.setCreateBy(ShiroUtils.getLoginName());
		flowType.setCreateTime(new Date());
		jpaDao.save(flowType);
	}

	@Override
	@Transactional
	public void updateFlowType(ActCnFlowType flowType) {
		if (this.checkFlowTypeNameUnique(flowType)) {
			throw new BaseException("修改流程类型【" + flowType.getTypeName() + "】失败，流程类型名称已存在");
		}
		if (checkFlowTypeIsSelfOrChildren(flowType)) {
			throw new BaseException("修改流程类型【" + flowType.getTypeName() + "】失败，上级流程类型不能是自己或自己的子流程类型");
		}
		ActCnFlowType ActCnFlowType = this.selectFlowTypeById(flowType.getId());
		ActCnFlowType parent= this.selectFlowTypeById(flowType.getParentId());
		if (StringUtils.isNotNull(parent) && StringUtils.isNotNull(ActCnFlowType)) {
			String newAncestors = parent.getAncestors() + "," + parent.getId();
			String oldAncestors = ActCnFlowType.getAncestors();
			flowType.setAncestors(newAncestors);
			this.updateChildrenFlowType(flowType, newAncestors, oldAncestors);
		}
		flowType.setUpdateBy(ShiroUtils.getLoginName());
		flowType.setUpdateTime(new Date());
		jpaDao.update(flowType);
	}
	
	@Override
	public ActCnFlowType selectFlowTypeById(String flowTypeId) {
		if(Constants.ROOT.equals(flowTypeId)){
			ActCnFlowType flowType = new ActCnFlowType();
			flowType.setId(Constants.ROOT);
			flowType.setTypeName("流程类型");
			flowType.setAncestors("");
			return flowType;
		}
		return jpaDao.find(ActCnFlowType.class, flowTypeId);
	}

	@Override
	public boolean checkFlowTypeNameUnique(ActCnFlowType flowType) {
		List<Object> paras = new ArrayList<Object>();
		String hql = "from ActCnFlowType where typeName=? and parentId=? ";
		paras.add(flowType.getTypeName());
		paras.add(flowType.getParentId());
		if(StringUtils.isNotEmpty(flowType.getId())){
			hql += "and id != ?";
			paras.add(flowType.getId());
		}
		ActCnFlowType ActCnFlowType = jpaDao.find(hql, paras, ActCnFlowType.class);
		if (StringUtils.isNotNull(ActCnFlowType)) {
			return Constants.NOT_UNIQUE;
		}
		return Constants.IS_UNIQUE;
	}
	
	/**
	 * 初始化zTree
	 * @param types 流程类型列表
	 * @return 树结构列表
	 */
	public List<Ztree> initZtree(List<ActCnFlowType> types) {
		List<Ztree> ztrees = new ArrayList<Ztree>();
		for (ActCnFlowType modelType : types) {
			if (Constants.NORMAL.equals(modelType.getStatus())) {
				Ztree ztree = new Ztree();
				ztree.setId(modelType.getId());
				ztree.setpId(modelType.getParentId());
				ztree.setName(modelType.getTypeName());
				ztree.setTitle(modelType.getTypeName());
				ztrees.add(ztree);
			}
		}
		return ztrees;
	}
	
	/**
	 * 检查是否是自己或者自己的子流程类型
	 * @param modelType
	 * @return
	 */
	public boolean checkFlowTypeIsSelfOrChildren(ActCnFlowType flowType){
		List<Object> paras = new ArrayList<Object>();
		String hql = "from ActCnFlowType where id = ? or ancestors like ?";
		paras.add(flowType.getId());
		paras.add("%" + flowType.getId() + "%");
		List<ActCnFlowType> types = jpaDao.search(hql, paras, ActCnFlowType.class);
		for(ActCnFlowType ActCnFlowType : types){
			if(flowType.getParentId().equals(ActCnFlowType.getId())){
				return true;
			}
		}
		return false;
	}
	
	/**
	 * 更新子流程类型
	 * @param dept
	 * @param newAncestors
	 * @param oldAncestors
	 */
	@Transactional
	public void updateChildrenFlowType(ActCnFlowType flowType, String newAncestors, String oldAncestors) {
		//查询旧的前缀的所有子流程类型
		List<ActCnFlowType> childrens = jpaDao.search("from ActCnFlowType where ancestors like ?", "%" + flowType.getId() + "%", ActCnFlowType.class);
		for (ActCnFlowType child : childrens) {
			//替换掉所有子流程类型的前缀
			child.setAncestors(child.getAncestors().replace(oldAncestors, newAncestors));
			//父组织状态改变，子流程类型也变更
			child.setStatus(flowType.getStatus());
			jpaDao.update(child);
		}
	}

}
