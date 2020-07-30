package com.daffodil.core.dao;

import java.io.Serializable;
import java.util.List;

import com.daffodil.core.entity.BaseEntity;
import com.daffodil.core.entity.Page;
import com.daffodil.core.exception.BusinessException;

/**
 * 公共jpaDao业务
 * @author yweijian
 * @date 2019年12月12日
 * @version 1.0
 */
public abstract interface JpaDao {
	/**
	 * 实体对象保存
	 * @param entity
	 * @return
	 * @throws BusinessException
	 */
	public abstract Serializable save(BaseEntity entity) throws BusinessException;
	/**
	 * 删除实体对象
	 * @param entity
	 * @throws BusinessException
	 */
	public abstract void delete(BaseEntity entity) throws BusinessException;
	/**
	 * 删除多个实体对象
	 * @param entitys
	 * @throws BusinessException
	 */
	public abstract void delete(BaseEntity[] entitys) throws BusinessException;
	/**
	 * 根据hql语句删除实体对象
	 * @param hql
	 * @throws BusinessException
	 */
	public abstract void delete(String hql) throws BusinessException;
	/**
	 * 根据hql语句删除实体对象
	 * @param hql
	 * @param para
	 * @throws BusinessException
	 */
	public abstract void delete(String hql, Object para) throws BusinessException;
	/**
	 * 根据hql语句删除实体对象
	 * @param hql
	 * @param paras
	 * @throws BusinessException
	 */
	public abstract void delete(String hql, List<Object> paras) throws BusinessException;
	/**
	 * 根据id删除实体对象
	 * @param clazz
	 * @param id
	 * @throws BusinessException
	 */
	public abstract void delete(Class<?> clazz, String id) throws BusinessException;
	/**
	 * 根据id删除多个实体对象
	 * @param clazz
	 * @param ids
	 * @throws BusinessException
	 */
	public abstract void delete(Class<?> clazz, String[] ids) throws BusinessException;
	/**
	 * 更新实体对象，只更新不为null的实体属性
	 * @param entity
	 * @throws BusinessException
	 */
	public abstract void update(BaseEntity entity) throws BusinessException;
	/**
	 * 更新实体对象，更新所有实体属性
	 * @param entity
	 * @throws BusinessException
	 */
	public abstract void updateAll(BaseEntity entity) throws BusinessException;
	/**
	 * 根据主键id查询实体对象
	 * @param clazz
	 * @param id
	 * @return
	 * @throws BusinessException
	 */
	public abstract <T> T find(Class<?> clazz, String id) throws BusinessException;
	/**
	 * 根据hql查询实体对象
	 * @param hql
	 * @param clazz
	 * @return
	 * @throws BusinessException
	 */
	public abstract <T> T find(String hql, Class<?> clazz) throws BusinessException;
	/**
	 * 根据hql查询实体对象
	 * @param hql
	 * @param para
	 * @param clazz
	 * @return
	 * @throws BusinessException
	 */
	public abstract <T> T find(String hql, Object para, Class<?> clazz) throws BusinessException;
	/**
	 * 根据hql查询实体对象
	 * @param hql
	 * @param paras
	 * @param clazz
	 * @return
	 * @throws BusinessException
	 */
	public abstract <T> T find(String hql, List<Object> paras, Class<?> clazz) throws BusinessException;
	/**
	 * 根据hql分页查询实体对象
	 * @param hql
	 * @param clazz
	 * @param page
	 * @return
	 * @throws BusinessException
	 */
	public abstract <T> List<T> search(String hql, Class<?> clazz, Page page) throws BusinessException;
	/**
	 * 根据hql查询实体对象
	 * @param hql
	 * @param para
	 * @param clazz
	 * @return
	 * @throws BusinessException
	 */
	public abstract <T> List<T> search(String hql, Object para, Class<?> clazz) throws BusinessException;
	/**
	 * 根据hql分页查询实体对象
	 * @param hql
	 * @param paras
	 * @param clazz
	 * @param page
	 * @return
	 * @throws BusinessException
	 */
	public abstract <T> List<T> search(String hql, List<Object> paras, Class<?> clazz, Page page) throws BusinessException;
	/**
	 * 根据hql查询实体对象
	 * @param hql
	 * @param clazz
	 * @return
	 * @throws BusinessException
	 */
	public abstract <T> List<T> search(String hql, Class<?> clazz) throws BusinessException;
	/**
	 * 根据hql查询实体对象
	 * @param hql
	 * @param paras
	 * @param clazz
	 * @return
	 * @throws BusinessException
	 */
	public abstract <T> List<T> search(String hql, List<Object> paras, Class<?> clazz) throws BusinessException;
	/**
	 * 根据hql统计数据
	 * @param hql
	 * @return
	 * @throws BusinessException
	 */
	public abstract int count(String hql) throws BusinessException;
	/**
	 * 根据hql统计数据
	 * @param hql
	 * @param para
	 * @return
	 * @throws BusinessException
	 */
	public abstract int count(String hql, Object para) throws BusinessException;
	/**
	 * 根据hql统计数据
	 * @param hql
	 * @param paras
	 * @return
	 * @throws BusinessException
	 */
	public abstract int count(String hql, List<Object> paras) throws BusinessException;
	
}
