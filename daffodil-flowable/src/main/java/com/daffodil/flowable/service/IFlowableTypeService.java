package com.daffodil.flowable.service;

import java.util.List;

import com.daffodil.core.entity.Query;
import com.daffodil.core.entity.Ztree;
import com.daffodil.flowable.entity.ActCnFlowType;

/**
 * 流程类型接口
 * @author yweijian
 * @date 2020年2月11日
 * @version 1.0
 */
public interface IFlowableTypeService {
	/**
	 * 根据查询条件查询流程类型
	 * @param query
	 * @return
	 */
	public List<ActCnFlowType> selectFlowTypeList(Query<ActCnFlowType> query);

	/**
	 * 按树结构查询流程类型
	 * @param query
	 * @return
	 */
	public List<Ztree> selectFlowTypeTree(Query<ActCnFlowType> query);

	/**
	 * 删除流程类型管理信息
	 * @param flowTypeId
	 */
	public void deleteFlowTypeById(String flowTypeId);

	/**
	 * 新增保存流程类型信息
	 * @param flowType
	 */
	public void insertFlowType(ActCnFlowType flowType);

	/**
	 * 修改保存流程类型信息
	 * @param flowType
	 */
	public void updateFlowType(ActCnFlowType flowType);

	/**
	 * 根据流程类型ID查询信息
	 * @param flowTypeId
	 * @return
	 */
	public ActCnFlowType selectFlowTypeById(String flowTypeId);

	/**
	 * 校验流程类型名称是否唯一
	 * @param flowType
	 * @return
	 */
	public boolean checkFlowTypeNameUnique(ActCnFlowType flowType);
}
