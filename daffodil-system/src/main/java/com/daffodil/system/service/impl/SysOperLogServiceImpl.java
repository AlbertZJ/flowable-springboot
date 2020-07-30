package com.daffodil.system.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.daffodil.core.dao.JpaDao;
import com.daffodil.core.entity.Query;
import com.daffodil.system.entity.SysOperLog;
import com.daffodil.system.service.ISysOperLogService;
import com.daffodil.util.HqlUtils;

/**
 * 操作日志 服务
 * @author yweijian
 * @date 2019年12月18日
 * @version 1.0
 */
@Service
public class SysOperLogServiceImpl implements ISysOperLogService {
	@Autowired
	private JpaDao jpaDao;

	@Override
	@Transactional
	public void insertOperlog(SysOperLog operLog) {
		jpaDao.save(operLog);
	}

	@Override
	public List<SysOperLog> selectOperLogList(Query<SysOperLog> query) {
		StringBuffer hql = new StringBuffer("from SysOperLog where 1=1 ");
		List<Object> paras = new ArrayList<Object>();
		HqlUtils.createHql(hql, paras, query);
		return jpaDao.search(hql.toString(), paras, SysOperLog.class, query.getPage());
	}
	
	@Override
	@Transactional
	public void deleteOperLogByIds(String[] ids) {
		jpaDao.delete(SysOperLog.class, ids);
	}

	@Override
	public SysOperLog selectOperLogById(String operId) {
		return jpaDao.find(SysOperLog.class, operId);
	}

	@Override
	@Transactional
	public void cleanOperLog() {
		jpaDao.delete("delete from SysOperLog");
	}
}
