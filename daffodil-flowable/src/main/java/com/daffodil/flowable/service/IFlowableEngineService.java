package com.daffodil.flowable.service;

import java.util.List;

import com.daffodil.flowable.entity.ActCnDeployment;

/**
 * 流程引擎实例接口
 * @author yweijian
 * @date 2020年7月8日
 * @version 1.0
 * @description
 */
public interface IFlowableEngineService {

	/**
	 * 根据流程类型获取当前用户下的所有绑定的流程
	 * @param flowTypeId
	 * @return
	 */
	public List<ActCnDeployment> selectFlowableInfoListByFlowTypeId(String flowTypeId);

	/**
	 * 根据流程部署的ID获取流程信息
	 * @param deployId
	 * @return
	 */
	public ActCnDeployment selectFlowableInfoByDeployId(String deployId);

}
