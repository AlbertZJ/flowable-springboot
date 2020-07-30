package com.daffodil.flowable.service;

import java.util.List;

import com.daffodil.core.entity.Query;
import com.daffodil.flowable.entity.ActCnDeployment;

/**
 * 流程用户绑定接口
 * @author yweijian
 * @date 2020年2月11日
 * @version 1.0
 */
public interface IFlowableUserBindingService {

	/**
	 * 用户绑定流程
	 * @param deployId
	 * @param userId
	 */
	public void bingdingByDeployId(String deployId, String userId);

	/**
	 * 用户已绑定的数据列表
	 * @param query
	 * @return
	 */
	public List<ActCnDeployment> selectModelBindedList(Query<ActCnDeployment> query, String userId);

	/**
	 * 取消流程绑定
	 * @param deployId
	 * @param userId
	 */
	public void unbindedByDeployId(String deployId, String userId);
}
