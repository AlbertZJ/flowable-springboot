package com.daffodil.flowable.service;

import java.io.InputStream;
import java.util.List;

import com.daffodil.core.entity.Query;
import com.daffodil.flowable.entity.ActCnDeployment;
import com.daffodil.flowable.entity.ActCnModel;

/**
 * 流程模型关系接口
 * @author yweijian
 * @date 2020年1月13日
 * @version 1.0
 */
public interface IFlowableModelService {
	
	/**
	 * 部署（发布）
	 * @param modelId
	 * @param typeId
	 */
	public void deployModeler(String modelId, String typeId);
	
	/**
	 * 取消发布
	 * @param deployId
	 */
	public void removeDeployment(String[] ids);
	
	/**
	 * 查看流程图
	 * @param modelKey
	 * @return
	 */
	public InputStream getModelerDiagramByModelKey(String modelKey);

	/**
	 * 查询待发布流程
	 * @param query
	 * @return
	 */
	public List<ActCnModel> selectModelUndeployList(Query<ActCnModel> query);

	/**
	 * 查询已发布流程
	 * @param query
	 * @return
	 */
	public List<ActCnDeployment> selectModelDeployList(Query<ActCnDeployment> query);
}
