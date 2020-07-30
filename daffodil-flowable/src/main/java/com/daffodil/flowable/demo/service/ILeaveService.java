package com.daffodil.flowable.demo.service;

import java.util.List;

import com.daffodil.core.entity.Query;
import com.daffodil.flowable.demo.entity.Leave;

/**
 * 请假服务
 * @author yweijian
 * @date 2020年1月10日
 * @version 1.0
 */
public interface ILeaveService {

	/**
	 * 查询请假列表
	 * @param query
	 * @return
	 */
	public List<Leave> selectLeaveList(Query<Leave> query);
	
	/**
	 * 查询请假信息
	 * @param leaveId
	 * @return
	 */
	public Leave selectLeaveById(String leaveId);

	/**
	 * 新增请假
	 * @param leave
	 */
	public void insertLeave(Leave leave);

	/**
	 * 修改请假
	 * @param leave
	 */
	public void updateLeave(Leave leave);

	/**
	 * 删除请假信息
	 * @param ids
	 */
	public void deleteLeaveByIds(String[] ids);
}
