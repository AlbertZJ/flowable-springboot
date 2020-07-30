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
import com.daffodil.system.entity.SysNotice;
import com.daffodil.system.service.ISysNoticeService;
import com.daffodil.util.HqlUtils;

/**
 * 公告 服务层实现
 * 
 * @author yweijian
 * @date 2019年8月16日
 * @version 1.0
 */
@Service
public class SysNoticeServiceImpl implements ISysNoticeService {
	
	@Autowired
	private JpaDao jpaDao;
	
	@Override
	public List<SysNotice> selectNoticeList(Query<SysNotice> query) {
		StringBuffer hql = new StringBuffer("from SysNotice where 1=1 ");
		List<Object> paras = new ArrayList<Object>();
		HqlUtils.createHql(hql, paras, query);
		return jpaDao.search(hql.toString(), paras, SysNotice.class, query.getPage());
	}
	
	@Override
	public SysNotice selectNoticeById(String noticeId) {
		return jpaDao.find(SysNotice.class, noticeId);
	}

	@Override
	@Transactional
	public void insertNotice(SysNotice notice) {
		notice.setCreateBy(ShiroUtils.getLoginName());
		notice.setCreateTime(new Date());
		jpaDao.save(notice);
	}

	@Override
	@Transactional
	public void updateNotice(SysNotice notice) {
		notice.setUpdateBy(ShiroUtils.getLoginName());
		notice.setUpdateTime(new Date());
		jpaDao.update(notice);
	}

	@Override
	@Transactional
	public void deleteNoticeByIds(String[] ids) {
		jpaDao.delete(SysNotice.class, ids);
	}
}
