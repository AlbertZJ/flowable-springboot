package com.daffodil.system.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.daffodil.core.dao.JpaDao;
import com.daffodil.core.entity.Query;
import com.daffodil.system.entity.SysUserOnline;
import com.daffodil.system.service.ISysUserOnlineService;
import com.daffodil.util.DateUtils;
import com.daffodil.util.HqlUtils;
import com.daffodil.util.StringUtils;

/**
 * 在线用户 服务
 * 
 * @author yweijian
 * @date 2019年8月16日
 * @version 1.0
 */
@Service
public class SysUserOnlineServiceImpl implements ISysUserOnlineService {

	@Autowired
	private JpaDao jpaDao;
	
	@Override
	public SysUserOnline selectOnlineById(String sessionId) {
		return jpaDao.find(SysUserOnline.class, sessionId);
	}

	@Override
	@Transactional
	public void deleteOnlineByIds(String[] sessionIds) {
		for (String sessionId : sessionIds) {
			SysUserOnline userOnline = this.selectOnlineById(sessionId);
			if (StringUtils.isNotNull(userOnline)) {
				jpaDao.delete(userOnline);
			}
		}
	}

	@Override
	@Transactional
	public void insertOnline(SysUserOnline online) {
		jpaDao.save(online);
	}
	
	@Override
	@Transactional
	public void updateOnline(SysUserOnline online) {
		jpaDao.update(online);
	}

	@Override
	public List<SysUserOnline> selectUserOnlineList(Query<SysUserOnline> query) {
		StringBuffer hql = new StringBuffer("from SysUserOnline where 1=1 ");
		List<Object> paras = new ArrayList<Object>();
		HqlUtils.createHql(hql, paras, query);
		return jpaDao.search(hql.toString(), paras, SysUserOnline.class, query.getPage());
	}

	@Override
	@Transactional
	public void forceLogout(String sessionId) {
		jpaDao.delete(SysUserOnline.class, sessionId);
	}

	@Override
	public List<SysUserOnline> selectOnlineByExpired(Date expiredDate) {
		String lastAccessTime = DateUtils.parseDateToStr(DateUtils.YYYY_MM_DD_HH_MM_SS, expiredDate);
		return jpaDao.search("from SysUserOnline where lastAccessTime <= ? order by lastAccessTime asc", lastAccessTime, SysUserOnline.class);
	}
}
