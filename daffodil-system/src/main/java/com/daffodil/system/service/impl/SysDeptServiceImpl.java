package com.daffodil.system.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daffodil.core.annotation.DataScope;
import com.daffodil.core.constant.Constants;
import com.daffodil.core.dao.JpaDao;
import com.daffodil.core.entity.Query;
import com.daffodil.core.entity.Ztree;
import com.daffodil.core.exception.BaseException;
import com.daffodil.framework.shiro.util.ShiroUtils;
import com.daffodil.system.entity.SysDept;
import com.daffodil.system.service.ISysDeptService;
import com.daffodil.util.HqlUtils;
import com.daffodil.util.StringUtils;

/**
 * 部门管理
 * @author yweijian
 * @date 2019年12月18日
 * @version 1.0
 */
@Service
public class SysDeptServiceImpl implements ISysDeptService {
	
	@Autowired
	private JpaDao jpaDao;

	@Override
	@DataScope(deptAlias = "d")
	public List<SysDept> selectDeptList(Query<SysDept> query) {
		List<Object> paras = new ArrayList<Object>();
		StringBuffer hql = new StringBuffer("from SysDept d where 1=1 ");
		HqlUtils.createHql(hql, paras, query, "d");
		hql.append("order by d.orderNum asc,d.parentId desc");
		return jpaDao.search(hql.toString(), paras, SysDept.class, query.getPage());
	}

	@Override
	@DataScope(deptAlias = "d")
	public List<Ztree> deptTreeData(Query<SysDept> query) {
		List<SysDept> deptList = this.selectDeptList(query);
		List<Ztree> ztrees = this.initZtree(deptList, null);
		return ztrees;
	}

	@Override
	public List<Ztree> roleDeptTreeData(String roleId) {
		List<Ztree> ztrees = new ArrayList<Ztree>();
		Query<SysDept> query = new Query<SysDept>();
		query.setEntity(new SysDept());
		List<SysDept> depts = this.selectDeptList(query);
		if (StringUtils.isNotNull(roleId)) {
			String hql = "select d from SysDept d, SysRoleDept rd where d.id = rd.deptId and rd.roleId = ? ";
			List<SysDept> roleDepts = jpaDao.search(hql, roleId, SysDept.class);
			List<String> perms = new ArrayList<String>();
			if(StringUtils.isNotEmpty(roleDepts)){
				for(SysDept dept : roleDepts){
					perms.add(dept.getId() + " " + dept.getDeptName());
				}
			}
			ztrees = this.initZtree(depts, perms);
		} else {
			ztrees = this.initZtree(depts, null);
		}
		return ztrees;
	}
	
	/**
	 * 初始化zTree
	 * @param depts 部门列表
	 * @param perms 角色已存在权限的部门列表
	 * @return 树结构列表
	 */
	public List<Ztree> initZtree(List<SysDept> depts, List<String> perms) {

		List<Ztree> ztrees = new ArrayList<Ztree>();
		boolean isCheck = StringUtils.isNotNull(perms);
		for (SysDept dept : depts) {
			if (Constants.NORMAL.equals(dept.getStatus())) {
				Ztree ztree = new Ztree();
				ztree.setId(dept.getId());
				ztree.setpId(dept.getParentId());
				ztree.setName(dept.getDeptName());
				ztree.setTitle(dept.getDeptName());
				if (isCheck) {
					ztree.setChecked(perms.contains(dept.getId() + " " + dept.getDeptName()));
				}
				ztrees.add(ztree);
			}
		}
		return ztrees;
	}

	@Override
	@Transactional
	public void deleteDeptById(String deptId) {
		int count = jpaDao.count("from SysDept where parentId = ?", deptId);
		if(count > 0){
			throw new BaseException("删除部门失败，存在下级部门，不允许删除");
		}
		int count2 = jpaDao.count("from SysUser where deptId = ?", deptId);
		if(count2 > 0){
			throw new BaseException("删除部门失败，部门已分配，不允许删除");
		}
		jpaDao.delete(SysDept.class, deptId);
	}

	@Override
	@Transactional
	public void insertDept(SysDept dept) {
		if (this.checkDeptNameUnique(dept)) {
			throw new BaseException("新增部门【" + dept.getDeptName() + "】失败，部门名称已存在");
		}
		SysDept parentDept = this.selectDeptById(dept.getParentId());
		if(StringUtils.isNotEmpty(parentDept.getAncestors())){
			dept.setAncestors(parentDept.getAncestors() + "," + dept.getParentId());
		}else{
			dept.setAncestors(dept.getParentId());
		}
		dept.setCreateBy(ShiroUtils.getLoginName());
		dept.setCreateTime(new Date());
		jpaDao.save(dept);
	}

	@Override
	@Transactional
	public void updateDept(SysDept dept) {
		if (this.checkDeptNameUnique(dept)) {
			throw new BaseException("修改部门【" + dept.getDeptName() + "】失败，部门名称已存在");
		}
		if (checkDeptIsSelfOrChildren(dept)) {
			throw new BaseException("修改部门【" + dept.getDeptName() + "】失败，上级部门不能是自己或自己的子部门");
		}
		SysDept sysDept = this.selectDeptById(dept.getId());
		SysDept parent= this.selectDeptById(dept.getParentId());
		if (StringUtils.isNotNull(parent) && StringUtils.isNotNull(sysDept)) {
			String newAncestors = parent.getAncestors() + "," + parent.getId();
			String oldAncestors = sysDept.getAncestors();
			dept.setAncestors(newAncestors);
			this.updateChildrenDept(dept, newAncestors, oldAncestors);
		}
		dept.setUpdateBy(ShiroUtils.getLoginName());
		dept.setUpdateTime(new Date());
		jpaDao.update(dept);
	}
	
	public boolean checkDeptIsSelfOrChildren(SysDept dept){
		List<Object> paras = new ArrayList<Object>();
		String hql = "from SysDept where id = ? or ancestors like ?";
		paras.add(dept.getId());
		paras.add("%" + dept.getId() + "%");
		List<SysDept> depts = jpaDao.search(hql, paras, SysDept.class);
		for(SysDept sysDept : depts){
			if(dept.getParentId().equals(sysDept.getId())){
				return true;
			}
		}
		return false;
	}

	@Transactional
	public void updateChildrenDept(SysDept dept, String newAncestors, String oldAncestors) {
		//查询旧的前缀的所有子组织机构
		List<SysDept> childrens = jpaDao.search("from SysDept where ancestors like ?", "%" + dept.getId() + "%", SysDept.class);
		for (SysDept child : childrens) {
			//替换掉所有子组织机构的前缀
			child.setAncestors(child.getAncestors().replace(oldAncestors, newAncestors));
			//父组织状态改变，子组织机构也变更
			child.setStatus(dept.getStatus());
			jpaDao.update(child);
		}
	}

	@Override
	public SysDept selectDeptById(String deptId) {
		if(Constants.ROOT.equals(deptId)){
			SysDept dept = new SysDept();
			dept.setId(Constants.ROOT);
			dept.setDeptName("组织机构");
			dept.setAncestors("");
			return dept;
		}
		return jpaDao.find(SysDept.class, deptId);
	}

	@Override
	public boolean checkDeptNameUnique(SysDept dept) {
		List<Object> paras = new ArrayList<Object>();
		String hql = "from SysDept where deptName=? and parentId=? ";
		paras.add(dept.getDeptName());
		paras.add(dept.getParentId());
		if(StringUtils.isNotEmpty(dept.getId())){
			hql += "and id != ?";
			paras.add(dept.getId());
		}
		SysDept sysDept = jpaDao.find(hql, paras, SysDept.class);
		if (StringUtils.isNotNull(sysDept)) {
			return Constants.NOT_UNIQUE;
		}
		return Constants.IS_UNIQUE;
	}
}
