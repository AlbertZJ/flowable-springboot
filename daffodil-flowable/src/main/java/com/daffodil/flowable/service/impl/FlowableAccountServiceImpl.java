package com.daffodil.flowable.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daffodil.core.constant.Constants;
import com.daffodil.core.dao.JpaDao;
import com.daffodil.core.entity.Query;
import com.daffodil.flowable.service.IFlowableAccountService;
import com.daffodil.system.entity.SysRole;
import com.daffodil.system.entity.SysUser;
import com.daffodil.util.HqlUtils;
import com.daffodil.util.StringUtils;

/**
 * 流程账号管理接口实现
 * @author yweijian
 * @date 2020年1月16日
 * @version 1.0
 */
@Service
public class FlowableAccountServiceImpl implements IFlowableAccountService {

	@Autowired
	private JpaDao jpaDao;
	
	public List<SysUser> selectUserList(Query<SysUser> query) {
		StringBuffer hql = new StringBuffer();
		List<Object> paras = new ArrayList<Object>();
		SysUser sysUser = query.getEntity();
		
		hql.append("select u from SysUser u left join SysDept d on u.deptId=d.id where 1=1 ");
		if(StringUtils.isNotEmpty(sysUser.getDeptId())){
			hql.append("and (u.deptId = ? or u.deptId in (select t.id from SysDept t where ancestors like ?)) ");
			paras.add(sysUser.getDeptId());
			paras.add("%" + sysUser.getDeptId() + "%");
		}
		HqlUtils.createHql(hql, paras, query, "u");
		
		return jpaDao.search(hql.toString(), paras, SysUser.class, query.getPage());
	}
	
	public List<SysRole> selectRoleList(Query<SysRole> query) {
		StringBuffer hql = new StringBuffer("from SysRole where 1=1 ");
		List<Object> paras = new ArrayList<Object>();
		HqlUtils.createHql(hql, paras, query);
		return jpaDao.search(hql.toString(), paras, SysRole.class, query.getPage());
	}
	
	@Override
	public SysUser selectUserByLoginName(String loginName) {
		return jpaDao.find("from SysUser where status != '2' and loginName = ?", loginName, SysUser.class);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<SysUser> selectUserListByLoginName(Query<SysUser> query) {
		List<String> loginNames = (List<String>) query.getParams().get("loginNames");
		if(StringUtils.isEmpty(loginNames)){
			return null;
		}
		List<Object> paras = new ArrayList<Object>();
		StringBuffer hql = new StringBuffer();
		
		hql.append("select u from SysUser u left join SysDept d on u.deptId=d.id where u.status = ? ");
		paras.add(Constants.NORMAL);
		
		hql.append(StringUtils.format("and u.loginName in {} ", HqlUtils.createHql(paras, loginNames.toArray(new String[loginNames.size()]))));
		
		HqlUtils.createHql(hql, paras, query, "u");
		
		return jpaDao.search(hql.toString(), paras, SysUser.class, query.getPage());
	}

	@Override
	public List<SysUser> selectUserListByRoleIds(Query<SysUser> query) {
		List<Object> paras = new ArrayList<Object>();
		SysUser sysUser = query.getEntity();
		StringBuffer hql = new StringBuffer();
		hql.append("select u from SysUser u left join SysDept d on u.deptId=d.id where u.id ");
		hql.append(StringUtils.format("in (select distinct userId from SysUserRole where roleId in {}) ", HqlUtils.createHql(paras, sysUser.getRoleIds())));
		HqlUtils.createHql(hql, paras, query, "u");
		
		return jpaDao.search(hql.toString(), paras, SysUser.class, query.getPage());
	}

}
