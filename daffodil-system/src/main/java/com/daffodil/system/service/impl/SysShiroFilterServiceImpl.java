package com.daffodil.system.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.daffodil.core.dao.JpaDao;
import com.daffodil.core.entity.Query;
import com.daffodil.framework.shiro.util.ShiroUtils;
import com.daffodil.system.entity.SysShiroFilter;
import com.daffodil.system.service.ISysShiroFilterService;
import com.daffodil.util.HqlUtils;

/**
 * 系统过滤约束配置 实现
 * @author yweijian
 * @date 2020年2月15日
 * @version 1.0
 */
@Service
public class SysShiroFilterServiceImpl implements ISysShiroFilterService {
	
	@Autowired
	private JpaDao jpaDao;
	
	@Override
	public List<SysShiroFilter> selectShiroFilterList(Query<SysShiroFilter> query) {
		StringBuffer hql = new StringBuffer("from SysShiroFilter where 1=1 ");
		List<Object> paras = new ArrayList<Object>();
		HqlUtils.createHql(hql, paras, query);
		return jpaDao.search(hql.toString(), paras, SysShiroFilter.class, query.getPage());
	}
	
	@Override
	public SysShiroFilter selectShiroFilterById(String filterId) {
		return jpaDao.find(SysShiroFilter.class, filterId);
	}

	@Override
	@Transactional
	public void insertShiroFilter(SysShiroFilter filter) {
		filter.setCreateBy(ShiroUtils.getLoginName());
		filter.setCreateTime(new Date());
		jpaDao.save(filter);
	}

	@Override
	@Transactional
	public void updateShiroFilter(SysShiroFilter filter) {
		filter.setUpdateBy(ShiroUtils.getLoginName());
		filter.setUpdateTime(new Date());
		jpaDao.update(filter);
	}

	@Override
	@Transactional
	public void deleteShiroFilterByIds(String[] ids) {
		jpaDao.delete(SysShiroFilter.class, ids);
	}
}
