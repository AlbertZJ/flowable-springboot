package com.daffodil.system.service;

import java.util.List;

import com.daffodil.core.entity.Query;
import com.daffodil.system.entity.SysOperLog;

/**
 * 操作日志 服务
 * 
 * @author yweijian
 * @date 2019年8月16日
 * @version 1.0
 */
public interface ISysOperLogService {
	/**
	 * 新增操作日志
	 * @param operLog
	 */
	public void insertOperlog(SysOperLog operLog);

	/**
	 * 分页查询系统操作日志集合
	 * @param query
	 * @return
	 */
	public List<SysOperLog> selectOperLogList(Query<SysOperLog> query);
	
	/**
	 * 批量删除系统操作日志
	 * @param ids
	 */
	public void deleteOperLogByIds(String[] ids);

	/**
	 * 查询操作日志详细
	 * @param operId
	 * @return
	 */
	public SysOperLog selectOperLogById(String operId);

	/**
	 * 清空操作日志
	 */
	public void cleanOperLog();
}
