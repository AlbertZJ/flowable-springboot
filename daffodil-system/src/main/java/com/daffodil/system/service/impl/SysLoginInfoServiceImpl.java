package com.daffodil.system.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.daffodil.core.dao.JpaDao;
import com.daffodil.core.entity.Query;
import com.daffodil.system.entity.SysLoginInfo;
import com.daffodil.system.service.ISysLoginInfoService;
import com.daffodil.util.HqlUtils;

/**
 * 系统访问日志
 * 
 * @author yweijian
 * @date 2019年8月16日
 * @version 1.0
 */
@Service
public class SysLoginInfoServiceImpl implements ISysLoginInfoService {

	@Autowired
	private JpaDao jpaDao;

	@Override
	@Transactional
	public void insertLoginInfo(SysLoginInfo loginInfo) {
		jpaDao.save(loginInfo);
	}

	/**
	 * 分页查询系统登录日志集合
	 * @param query
	 * @return
	 */
	@Override
	public List<SysLoginInfo> selectLoginInfoList(Query<SysLoginInfo> query) {
		StringBuffer hql = new StringBuffer("from SysLoginInfo where 1=1 ");
		List<Object> paras = new ArrayList<Object>();
		HqlUtils.createHql(hql, paras, query);
		return jpaDao.search(hql.toString(), paras, SysLoginInfo.class, query.getPage());
	}
	
	@Override
	@Transactional
	public void deleteLoginInfoByIds(String[] ids) {
		jpaDao.delete(SysLoginInfo.class, ids);
	}

	@Override
	@Transactional
	public void cleanLoginInfo() {
		jpaDao.delete("delete from SysLoginInfo");
	}
}
