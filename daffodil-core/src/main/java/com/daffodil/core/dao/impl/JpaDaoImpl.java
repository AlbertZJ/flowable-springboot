package com.daffodil.core.dao.impl;

import java.io.Serializable;
import java.lang.reflect.Field;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.daffodil.core.dao.JpaDao;
import com.daffodil.core.entity.BaseEntity;
import com.daffodil.core.entity.Page;
import com.daffodil.core.exception.BusinessException;

@Repository("jpaDao")
public class JpaDaoImpl implements JpaDao {
	
	@Autowired
	private EntityManager entityManager;
	
	private static int DEFAULT_PAGE_NUM  = 1;
	
	private static int DEFAULT_PAGE_SIZE  = 9999;

	public Serializable save(BaseEntity entity) throws BusinessException {
		try {
			if (entity.getId() == null || "".equals(entity.getId())) {
				entity.setId(null);
			}
			this.entityManager.persist(entity);
		} catch (Exception e) {
			throw new BusinessException("[JAP] 执行HQL语句错误 ...", e);
		}
		return null;
	}

	public void delete(BaseEntity entity) throws BusinessException {
		try {
			this.entityManager.remove(this.entityManager.contains(entity) ? entity : this.entityManager.merge(entity));
		} catch (Exception e) {
			throw new BusinessException("[JAP] 执行HQL语句错误 ...", e);
		}
	}

	public void delete(BaseEntity[] entitys) throws BusinessException {
		try {
			BaseEntity[] arrayOfBaseEntity;
			int j = (arrayOfBaseEntity = entitys).length;
			for (int i = 0; i < j; i++) {
				BaseEntity entity = arrayOfBaseEntity[i];
				this.entityManager
				.remove(this.entityManager.contains(entity) ? entity : this.entityManager.merge(entity));
			}
		} catch (Exception e) {
			throw new BusinessException("[JAP] 执行HQL语句错误 ...", e);
		}
	}

	public void delete(String hql) throws BusinessException {
		try {
			String queryHql = this.getQueryHql(hql);
			Query query = this.entityManager.createQuery(queryHql);
			query.executeUpdate();
		} catch (Exception e) {
			throw new BusinessException("[JAP] 执行HQL语句错误 ...", e);
		}
	}

	public void delete(String hql, Object para) throws BusinessException {
		try {
			String queryHql = this.getQueryHql(hql);
			Query query = this.entityManager.createQuery(queryHql);
			query.setParameter(0, para);
			query.executeUpdate();
		} catch (Exception e) {
			throw new BusinessException("[JAP] 执行HQL语句错误 ...", e);
		}
	}

	public void delete(String hql, List<Object> paras) throws BusinessException {
		try {
			String queryHql = this.getQueryHql(hql);
			Query query = this.entityManager.createQuery(queryHql);
			this.setQueryParas(query, paras);
			query.executeUpdate();
		} catch (Exception e) {
			throw new BusinessException("[JAP] 执行HQL语句错误 ...", e);
		}
	}

	@SuppressWarnings("deprecation")
	public void delete(Class<?> clazz, String id) throws BusinessException {
		if (id == null || "".equals(id.trim())) {
			return;
		}
		try {
			BaseEntity entity = (BaseEntity) clazz.newInstance();
			entity.setId(id);
			this.entityManager.remove(this.entityManager.contains(entity) ? entity : this.entityManager.merge(entity));
		} catch (Exception e) {
			throw new BusinessException("[JAP] 执行HQL语句错误 ...", e);
		}
	}

	@SuppressWarnings("deprecation")
	public void delete(Class<?> clazz, String[] ids) throws BusinessException {
		try {
			String[] arrayOfString;
			int j = (arrayOfString = ids).length;
			for (int i = 0; i < j; i++) {
				String id = arrayOfString[i];
				BaseEntity entity = (BaseEntity) clazz.newInstance();
				entity.setId(id);
				this.entityManager.remove(this.entityManager.contains(entity) ? entity : this.entityManager.merge(entity));
			}
		} catch (Exception e) {
			throw new BusinessException("[JAP] 执行HQL语句错误 ...", e);
		}
	}

	@SuppressWarnings("unchecked")
	public <T> T find(Class<?> clazz, String id) throws BusinessException {
		T t = null;
		if (id == null || "".equals(id.trim())) {
			return t;
		}
		try {
			t = (T) this.entityManager.find(clazz, id);
		} catch (Exception e) {
			throw new BusinessException("[JAP] 执行HQL语句错误 ...", e);
		}
		return t;
	}

	public void update(BaseEntity entity) throws BusinessException {
		try {
			BaseEntity baseEntity = this.find(entity.getClass(), entity.getId());
			baseEntity = this.combineBean(entity, baseEntity);
			this.entityManager.merge(baseEntity);
		} catch (Exception e) {
			throw new BusinessException("[JAP] 执行HQL语句错误 ...", e);
		}
	}

	public void updateAll(BaseEntity entity) throws BusinessException {
		try {
			if (!this.entityManager.contains(entity)) {
				this.entityManager.merge(entity);
			}
		} catch (Exception e) {
			throw new BusinessException("[JAP] 执行HQL语句错误 ...", e);
		}
	}

	@SuppressWarnings("unchecked")
	public <T> T find(String hql, Class<?> clazz) throws BusinessException {
		T t = null;
		try {
			String queryHql = this.getQueryHql(hql);
			Query query = this.entityManager.createQuery(queryHql, clazz);
			List<T> result = query.getResultList();
			Iterator<T> iterator = result.iterator();
			if (iterator.hasNext()) {
				t = iterator.next();
			}
		} catch (Exception e) {
			throw new BusinessException("[JAP] 执行HQL语句错误 ...", e);
		}
		return t;
	}

	@SuppressWarnings("unchecked")
	public <T> T find(String hql, Object para, Class<?> clazz) throws BusinessException {
		T t = null;
		try {
			String queryHql = this.getQueryHql(hql);
			Query query = this.entityManager.createQuery(queryHql, clazz);
			query.setParameter(0, para);
			List<T> result = query.getResultList();
			Iterator<T> iterator = result.iterator();
			if (iterator.hasNext()) {
				t = iterator.next();
			}
		} catch (Exception e) {
			throw new BusinessException("[JAP] 执行HQL语句错误 ...", e);
		}
		return t;
	}

	@SuppressWarnings("unchecked")
	public <T> T find(String hql, List<Object> paras, Class<?> clazz) throws BusinessException {
		T t = null;
		try {
			String queryHql = this.getQueryHql(hql);
			Query query = this.entityManager.createQuery(queryHql, clazz);
			this.setQueryParas(query, paras);
			List<T> result = query.getResultList();
			Iterator<T> iterator = result.iterator();
			if (iterator.hasNext()) {
				t = iterator.next();
			}
		} catch (Exception e) {
			throw new BusinessException("[JAP] 执行HQL语句错误 ...", e);
		}
		return t;
	}

	@SuppressWarnings("unchecked")
	public <T> List<T> search(String hql, Class<?> clazz, Page page) throws BusinessException {
		if(null == page){
			page = new Page();
			page.setPageNumber(DEFAULT_PAGE_NUM);
			page.setPageSize(DEFAULT_PAGE_SIZE);
		}
		page.setTotalRow(this.count(hql));
		List<T> list = null;
		try {
			String queryHql = this.getQueryHql(hql);
			Query query = this.entityManager.createQuery(queryHql, clazz);
			query.setFirstResult(page.getFromIndex()).setMaxResults(page.getPageSize());
			list = query.getResultList();
		} catch (Exception e) {
			throw new BusinessException("[JAP] 执行HQL语句错误 ...", e);
		}
		return list;
	}

	@SuppressWarnings("unchecked")
	public <T> List<T> search(String hql, Object para, Class<?> clazz) throws BusinessException {
		List<T> list = null;
		try {
			String queryHql = this.getQueryHql(hql);
			Query query = this.entityManager.createQuery(queryHql, clazz);
			query.setParameter(0, para);
			list = query.getResultList();
		} catch (Exception e) {
			throw new BusinessException("[JAP] 执行HQL语句错误 ...", e);
		}
		return list;
	}

	@SuppressWarnings("unchecked")
	public <T> List<T> search(String hql, List<Object> paras, Class<?> clazz, Page page) throws BusinessException {
		if(null == page){
			page = new Page();
			page.setPageNumber(DEFAULT_PAGE_NUM);
			page.setPageSize(DEFAULT_PAGE_SIZE);
		}
		page.setTotalRow(this.count(hql, paras));
		List<T> list = null;
		try {
			String queryHql = this.getQueryHql(hql);
			Query query = this.entityManager.createQuery(queryHql, clazz);
			this.setQueryParas(query, paras);
			query.setFirstResult(page.getFromIndex()).setMaxResults(page.getPageSize());
			list = query.getResultList();
		} catch (Exception e) {
			throw new BusinessException("[JAP] 执行HQL语句错误 ...", e);
		}
		return list;
	}

	@SuppressWarnings("unchecked")
	public <T> List<T> search(String hql, Class<?> clazz) throws BusinessException {
		List<T> list = null;
		try {
			String queryHql = this.getQueryHql(hql);
			Query query = this.entityManager.createQuery(queryHql, clazz);
			list = query.getResultList();
		} catch (Exception e) {
			throw new BusinessException("[JAP] 执行HQL语句错误 ...", e);
		}
		return list;
	}

	@SuppressWarnings("unchecked")
	public <T> List<T> search(String hql, List<Object> paras, Class<?> clazz) throws BusinessException {
		List<T> list = null;
		try {
			String queryHql = this.getQueryHql(hql);
			Query query = this.entityManager.createQuery(queryHql, clazz);
			this.setQueryParas(query, paras);
			list = query.getResultList();
		} catch (Exception e) {
			throw new BusinessException("[JAP] 执行HQL语句错误 ...", e);
		}
		return list;
	}

	public int count(String hql, List<Object> paras) throws BusinessException {
		try {
			String queryHql = this.getQueryHql(hql);
			String queryCountHql = getQueryCountHql(queryHql);
			Query query = this.entityManager.createQuery(queryCountHql);
			this.setQueryParas(query, paras);
			return ((Long) query.getResultList().iterator().next()).intValue();
		} catch (Exception e) {
			throw new BusinessException("[JPA] 数据统计总数错误 ...", e);
		}
	}

	public int count(String hql, Object para) throws BusinessException {
		try {
			String queryHql = this.getQueryHql(hql);
			String queryCountHql = this.getQueryCountHql(queryHql);
			Query query = this.entityManager.createQuery(queryCountHql);
			query.setParameter(0, para);
			return ((Long) query.getResultList().iterator().next()).intValue();
		} catch (Exception e) {
			throw new BusinessException("[JPA] 数据统计总数错误 ...", e);
		}
	}

	public int count(String hql) throws BusinessException {
		try {
			String queryHql = this.getQueryHql(hql);
			String queryCountHql = this.getQueryCountHql(queryHql);
			Query query = this.entityManager.createQuery(queryCountHql);
			return ((Long) query.getResultList().iterator().next()).intValue();
		} catch (Exception e) {
			throw new BusinessException("[JPA] 数据统计总数错误 ...", e);
		}
	}

	/**
	 * 将查询语句中的占位符[?]替换成[?i]<br>
	 * 如：from table where id = ? and name = ?<br>
	 * -> from table where id = ?0 and name = ?1
	 * @param hql
	 * @return
	 */
	private String getQueryHql(String hql){
		StringBuffer sb= new StringBuffer();
		Pattern pattern = Pattern.compile("[?]"); 
		Matcher matcher = pattern.matcher(hql); 
		boolean result = matcher.find();
		int count = 0;
		while (result) {
			matcher.appendReplacement(sb, "?" + count);
			count++;
			result = matcher.find();
		}
		matcher.appendTail(sb);
		return sb.toString();
	}

	private void setQueryParas(Query query, List<Object> paras) throws BusinessException {
		if ((paras != null) && (paras.size() > 0)) {
			for (int i = 0; i < paras.size(); i++) {
				query.setParameter(i, paras.get(i));
			}
		}
	}

	private String getQueryCountHql(String hql) {
		String queryCountHql = "";
		if (hql.indexOf(" order ") > -1) {
			queryCountHql = "select count(*) " + hql.substring(hql.indexOf("from"), hql.indexOf("order"));
		} else if (hql.indexOf(" group ") > -1) {
			queryCountHql = "select count(*) " + hql.substring(hql.indexOf("from"), hql.indexOf("group"));
		} else {
			queryCountHql = "select count(*) " + hql.substring(hql.indexOf("from"));
		}
		return queryCountHql;
	}

	private BaseEntity combineBean(BaseEntity sourceBean, BaseEntity targetBean) {
		Class<? extends BaseEntity> sourceBeanClass = sourceBean.getClass();
		Field[] sourceFields = sourceBeanClass.getDeclaredFields();
		Field[] targetFields = sourceBeanClass.getDeclaredFields();
		for (int i = 0; i < sourceFields.length; i++) {
			Field sourceField = sourceFields[i];
			Field targetField = targetFields[i];
			sourceField.setAccessible(true);
			targetField.setAccessible(true);
			try {
				if (null != sourceField.get(sourceBean) && !"serialVersionUID".equals(sourceField.getName())) {
					targetField.set(targetBean, sourceField.get(sourceBean));
				}
			} catch (IllegalArgumentException | IllegalAccessException e) {
				e.printStackTrace();
			}
		}
		return targetBean;
	}
}
