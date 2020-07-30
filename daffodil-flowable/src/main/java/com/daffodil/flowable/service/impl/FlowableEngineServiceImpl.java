package com.daffodil.flowable.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.flowable.engine.ProcessEngine;
import org.flowable.engine.repository.Deployment;
import org.flowable.engine.repository.DeploymentQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daffodil.core.dao.JpaDao;
import com.daffodil.core.exception.BaseException;
import com.daffodil.flowable.entity.ActCnDeployment;
import com.daffodil.flowable.entity.ActCnFlowUser;
import com.daffodil.flowable.service.IFlowableEngineService;
import com.daffodil.framework.shiro.util.ShiroUtils;
import com.daffodil.util.StringUtils;

/**
 * 
 * @author yweijian
 * @date 2020年7月8日
 * @version 1.0
 * @description
 */
@Service
public class FlowableEngineServiceImpl implements IFlowableEngineService {

	@Autowired
	private JpaDao jpaDao;
	
	@Autowired
	private ProcessEngine processEngine;
	
	@Override
	public List<ActCnDeployment> selectFlowableInfoListByFlowTypeId(String flowTypeId) {
		String hql = "from ActCnFlowUser where userId = ? and flowTypeId in (select t.id from ActCnFlowType t where t.id = ? or t.ancestors like ?)";
		List<Object> paras = new ArrayList<Object>();
		paras.add(ShiroUtils.getUserId());
		paras.add(flowTypeId);
		paras.add("%" + flowTypeId + "%");
		List<ActCnFlowUser> flows = jpaDao.search(hql, paras, ActCnFlowUser.class);
		if(StringUtils.isEmpty(flows)){
			throw new BaseException("您尚未绑定该功能模块的流程，请联系管理员");
		}
		List<String> deploymentIds = new ArrayList<String>();
		for(int i = 0; i < flows.size(); i++) {
			deploymentIds.add(flows.get(i).getDeployId());
		}
		DeploymentQuery deploymentQuery = processEngine.getRepositoryService().createDeploymentQuery();
		deploymentQuery.deploymentIds(deploymentIds);
		List<Deployment> list = deploymentQuery.orderByDeploymenTime().desc().list();
		
		List<ActCnDeployment> datas = new ArrayList<ActCnDeployment>();
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
	public ActCnDeployment selectFlowableInfoByDeployId(String deployId) {
		if(StringUtils.isEmpty(deployId)) {
			return null;
		}
		DeploymentQuery deploymentQuery = processEngine.getRepositoryService().createDeploymentQuery();
		Deployment deployment = deploymentQuery.deploymentId(deployId).singleResult();
		return deployment == null ? null : new ActCnDeployment(deployment);
	}

}
