package com.daffodil.core.dao;

import java.util.List;
import java.util.Map;

import com.daffodil.core.entity.Page;
import com.daffodil.core.exception.BusinessException;

/**
 * 
 * @author yweijian
 * @date 2020年7月16日
 * @version 1.0
 * @description
 */
public abstract interface JdbcDao {

	/**
	 * 执行预编译SQL
	 * @param sql
	 * @throws BusinessException
	 */
	public abstract void execute(String sql) throws BusinessException;

	/**
	 * 执行预编译SQL
	 * @param sql
	 * @param paras
	 * @throws BusinessException
	 */
	public abstract void execute(String sql, List<Object> paras) throws BusinessException;

	/**
	 * 根据SQL查询数据对象
	 * @param sql
	 * @return
	 * @throws BusinessException
	 */
	public abstract List<Map<String, String>> search(String sql) throws BusinessException;

	/**
	 * 根据SQL分页查询数据对象
	 * @param sql
	 * @param page
	 * @return
	 * @throws BusinessException
	 */
	public abstract List<Map<String, String>> search(String sql, Page page) throws BusinessException;

	/**
	 * 根据SQL查询数据对象
	 * @param sql
	 * @param paras
	 * @return
	 * @throws BusinessException
	 */
	public abstract List<Map<String, String>> search(String sql, List<Object> paras) throws BusinessException;

	/**
	 * 根据SQL分页查询数据对象
	 * @param sql
	 * @param paras
	 * @param page
	 * @return
	 * @throws BusinessException
	 */
	public abstract List<Map<String, String>> search(String sql, List<Object> paras, Page page) throws BusinessException;

	/**
	 * 根据SQL查询数据对象
	 * @param sql
	 * @return
	 * @throws BusinessException
	 */
	public abstract Map<String, String> find(String sql) throws BusinessException;

	/**
	 * 根据SQL查询数据对象
	 * @param sql
	 * @param paramObject
	 * @return
	 * @throws BusinessException
	 */
	public abstract Map<String, String> find(String sql, Object paramObject) throws BusinessException;

	/**
	 * 根据SQL查询数据对象
	 * @param sql
	 * @param paras
	 * @return
	 * @throws BusinessException
	 */
	public abstract Map<String, String> find(String sql, List<Object> paras) throws BusinessException;

	/**
	 * 根据SQL查询统计数据对象
	 * @param sql
	 * @return
	 * @throws BusinessException
	 */
	public abstract int count(String sql) throws BusinessException;
	
	/**
	 * 根据SQL查询统计数据对象
	 * @param sql
	 * @param paras
	 * @return
	 * @throws BusinessException
	 */
	public abstract int count(String sql, List<Object> paras) throws BusinessException;

}
