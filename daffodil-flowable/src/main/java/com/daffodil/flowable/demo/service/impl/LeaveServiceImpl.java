package com.daffodil.flowable.demo.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.daffodil.core.dao.JpaDao;
import com.daffodil.core.entity.Query;
import com.daffodil.flowable.demo.entity.Leave;
import com.daffodil.flowable.demo.service.ILeaveService;
import com.daffodil.framework.shiro.util.ShiroUtils;
import com.daffodil.system.entity.SysUser;
import com.daffodil.util.StringUtils;

@Service
public class LeaveServiceImpl implements ILeaveService{

	@Autowired
	private JpaDao jpaDao;
	
	@Override
	public List<Leave> selectLeaveList(Query<Leave> query) {
		String hql = "from Leave where 1=1 ";
		SysUser user = ShiroUtils.getSysUser();
		List<Object> paras = new ArrayList<Object>();
		Leave leave = query.getEntity();
		if(StringUtils.isNotEmpty(leave.getTitle())){
			hql += "and title like ? ";
			paras.add("%" + leave.getTitle() + "%");
		}
		if(StringUtils.isNotNull(user)){
			hql += "and createBy = ? ";
			paras.add(user.getLoginName());
		}
		if(StringUtils.isNotEmpty(query.getOrderBy())){
			hql += "order by " + query.getOrderBy();
		}
		if(null != query.getPage()){
			return jpaDao.search(hql, paras, Leave.class, query.getPage());
		}else{
			return jpaDao.search(hql, paras, Leave.class);
		}
	}

	@Override
	public Leave selectLeaveById(String leaveId) {
		return jpaDao.find(Leave.class, leaveId);
	}

	@Override
	@Transactional
	public void insertLeave(Leave leave) {
		leave.setCreateBy(ShiroUtils.getLoginName());
		leave.setCreateTime(new Date());
		jpaDao.save(leave);
	}

	@Override
	@Transactional
	public void updateLeave(Leave leave) {
		leave.setUpdateBy(ShiroUtils.getLoginName());
		leave.setUpdateTime(new Date());
		jpaDao.update(leave);
	}

	@Override
	@Transactional
	public void deleteLeaveByIds(String[] ids) {
		if(StringUtils.isNotEmpty(ids)){
			jpaDao.delete(Leave.class, ids);
		}
	}

}
