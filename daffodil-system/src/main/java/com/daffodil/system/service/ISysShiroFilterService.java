package com.daffodil.system.service;

import java.util.List;

import com.daffodil.core.entity.Query;
import com.daffodil.system.entity.SysShiroFilter;

/**
 * 系统过滤约束配置 服务
 * @author yweijian
 * @date 2020年2月15日
 * @version 1.0
 */
public interface ISysShiroFilterService {

	/**
	 * 查询约束列表
	 * @param query
	 * @return
	 */
	public List<SysShiroFilter> selectShiroFilterList(Query<SysShiroFilter> query);
	
	/**
	 * 查询约束信息
	 * @param filterId
	 * @return
	 */
	public SysShiroFilter selectShiroFilterById(String filterId);

	/**
	 * 新增约束
	 * @param filter
	 */
	public void insertShiroFilter(SysShiroFilter filter);

	/**
	 * 修改约束
	 * @param filter
	 */
	public void updateShiroFilter(SysShiroFilter filter);

	/**
	 * 删除约束信息
	 * @param ids
	 */
	public void deleteShiroFilterByIds(String[] ids);
}
