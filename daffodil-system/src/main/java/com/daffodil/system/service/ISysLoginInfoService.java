package com.daffodil.system.service;

import java.util.List;

import com.daffodil.core.entity.Query;
import com.daffodil.system.entity.SysLoginInfo;

/**
 * 系统访问日志服务
 * @author yweijian
 * @date 2019年8月23日
 * @version 1.0
 */
public interface ISysLoginInfoService {

	/**
	 * 新增系统登录日志
	 * @param loginInfo
	 */
	public void insertLoginInfo(SysLoginInfo loginInfo);

	/**
	 * 分页查询系统登录日志集合
	 * @param query
	 * @return
	 */
	public List<SysLoginInfo> selectLoginInfoList(Query<SysLoginInfo> query);
	
	/**
	 * 批量删除系统登录日志
	 * @param ids
	 */
	public void deleteLoginInfoByIds(String[] ids);

	/**
	 * 清空系统登录日志
	 */
	public void cleanLoginInfo();
}
