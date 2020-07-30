package com.daffodil.flowable.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.flowable.engine.ProcessEngine;
import org.flowable.engine.repository.Deployment;
import org.flowable.engine.repository.DeploymentQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.daffodil.core.constant.Constants;
import com.daffodil.core.dao.JpaDao;
import com.daffodil.core.entity.Page;
import com.daffodil.core.entity.Query;
import com.daffodil.core.exception.BaseException;
import com.daffodil.flowable.entity.ActCnDeployment;
import com.daffodil.flowable.entity.ActCnFlowUser;
import com.daffodil.flowable.service.IFlowableUserBindingService;
import com.daffodil.util.StringUtils;

/**
 * 
 * @author yweijian
 * @date 2020年2月11日
 * @version 1.0
 */
@Service
public class FlowableUserBindingServiceImpl implements IFlowableUserBindingService {

	@Autowired
	private JpaDao jpaDao;
	
	@Autowired
	private ProcessEngine processEngine;
	
	@Override
	@Transactional
	public void bingdingByDeployId(String deployId, String userId) {
		
		Deployment deployment = processEngine.getRepositoryService().createDeploymentQuery().deploymentId(deployId).singleResult();
		if(null == deployment){
			throw new BaseException("流程绑定失败，流程实例不存在");
		}
		String hql = "from ActCnFlowUser where status = ? and flowTypeId = ? and userId = ?";
		List<Object> paras = new ArrayList<Object>();
		paras.add(Constants.NORMAL);
		paras.add(deployment.getTenantId());
		paras.add(userId);
		ActCnFlowUser checkFlowUser = jpaDao.find(hql, paras, ActCnFlowUser.class);
		//同类型只能绑定一个
		if(null != checkFlowUser && checkFlowUser.getDeployId().equals(deployId)){
			return;
		}
		
		ActCnFlowUser modelUser = new ActCnFlowUser();
		modelUser.setDeployId(deployment.getId());
		modelUser.setFlowTypeId(deployment.getTenantId());
		modelUser.setModelKey(deployment.getKey());
		modelUser.setUserId(userId);
		modelUser.setStatus(Constants.NORMAL);
		jpaDao.save(modelUser);
	}

	@Override
	public List<ActCnDeployment> selectModelBindedList(Query<ActCnDeployment> query, String userId) {
		List<Deployment> list = null;
		List<ActCnDeployment> datas = new ArrayList<ActCnDeployment>();
		DeploymentQuery deploymentQuery = processEngine.getRepositoryService().createDeploymentQuery();
		ActCnDeployment actCnDeployment = query.getEntity();
		
		if(StringUtils.isNotEmpty(actCnDeployment.getName())){
			deploymentQuery.deploymentNameLike("%" + actCnDeployment.getName() + "%");
		}
		if(StringUtils.isNotEmpty(actCnDeployment.getModelKey())){
			deploymentQuery.deploymentKeyLike("%" + actCnDeployment.getModelKey() + "%");
		}
		if(StringUtils.isNotEmpty(actCnDeployment.getCategory())){
			deploymentQuery.deploymentCategoryLike("%" + actCnDeployment.getCategory() + "%");
		}
		if(StringUtils.isNotEmpty(actCnDeployment.getTenantId())){
			deploymentQuery.deploymentTenantId(actCnDeployment.getTenantId());
		}
		if(StringUtils.isEmpty(userId)) {
			return datas;
		}
		String hql = "from ActCnFlowUser where status = ? and userId = ?";
		List<Object> paras = new ArrayList<Object>();
		paras.add(Constants.NORMAL);
		paras.add(userId);
		List<ActCnFlowUser> flowUsers = jpaDao.search(hql, paras, ActCnFlowUser.class, query.getPage());
		List<String> deployIds = new ArrayList<String>();
		if(StringUtils.isNotEmpty(flowUsers)) {
			for(int i = 0; i < flowUsers.size(); i++) {
				deployIds.add(flowUsers.get(i).getDeployId());
			}
		}
		if(StringUtils.isEmpty(deployIds)) {
			return datas;
		}
		deploymentQuery.deploymentIds(deployIds);
		if (StringUtils.isNotNull(query.getPage())) {
			Page page = query.getPage();
			page.setTotalRow((int) deploymentQuery.count());
			list = deploymentQuery.orderByDeploymenTime().desc().listPage(page.getFromIndex(), page.getPageSize());
		}else{
			list = deploymentQuery.orderByDeploymenTime().desc().list();
		}
		
		if (StringUtils.isNotEmpty(list)) {
			for (int i = 0; i < list.size(); i++) {
				Deployment deployment = list.get(i);
				ActCnDeployment d = new ActCnDeployment(deployment);
				datas.add(d);
			}
		}
		return datas;
	}

	@Override
	@Transactional
	public void unbindedByDeployId(String deployId, String userId) {
		String hql = "from ActCnFlowUser where status = ? and deployId = ? and userId = ?";
		List<Object> paras = new ArrayList<Object>();
		paras.add(Constants.NORMAL);
		paras.add(deployId);
		paras.add(userId);
		ActCnFlowUser flowUser = jpaDao.find(hql, paras, ActCnFlowUser.class);
		if(null != flowUser) {
			flowUser.setStatus(Constants.DELETED);
			jpaDao.update(flowUser);
		}
	}

}
