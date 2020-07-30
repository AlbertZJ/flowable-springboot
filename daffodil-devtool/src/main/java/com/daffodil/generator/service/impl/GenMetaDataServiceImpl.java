package com.daffodil.generator.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.daffodil.core.dao.JpaDao;
import com.daffodil.core.entity.Query;
import com.daffodil.generator.entity.GenMetaData;
import com.daffodil.generator.service.IGenMetaDataService;
import com.daffodil.util.HqlUtils;

/**
 * 元数据 服务层实现
 * @author yweijian
 * @date 2020年5月15日
 * @version 1.0
 */
@Service
public class GenMetaDataServiceImpl implements IGenMetaDataService {
	
	@Autowired
	private JpaDao jpaDao;
	
	@Override
	public List<GenMetaData> selectGenMetaDataList(Query<GenMetaData> query) {
		StringBuffer hql = new StringBuffer("from GenMetaData where 1=1 ");
		List<Object> paras = new ArrayList<Object>();
		HqlUtils.createHql(hql, paras, query);
		return jpaDao.search(hql.toString(), paras, GenMetaData.class, query.getPage());
	}
	
	@Override
	public GenMetaData selectGenMetaDataById(String id) {
		return jpaDao.find(GenMetaData.class, id);
	}

	@Override
	@Transactional
	public void insertGenMetaData(GenMetaData metaData) {
		metaData.setCreateTime(new Date());
		jpaDao.save(metaData);
	}

	@Override
	@Transactional
	public void updateGenMetaData(GenMetaData metaData) {
		metaData.setUpdateTime(new Date());
		jpaDao.update(metaData);
	}

	@Override
	@Transactional
	public void deleteGenMetaDataByIds(String[] ids) {
		jpaDao.delete(GenMetaData.class, ids);
	}
}
