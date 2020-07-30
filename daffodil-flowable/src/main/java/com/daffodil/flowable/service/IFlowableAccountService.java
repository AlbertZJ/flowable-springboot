package com.daffodil.flowable.service;

import java.util.List;

import com.daffodil.core.entity.Query;
import com.daffodil.system.entity.SysRole;
import com.daffodil.system.entity.SysUser;

/**
 * 流程账号管理
 * @author yweijian
 * @date 2020年1月16日
 * @version 1.0
 */
public interface IFlowableAccountService {
	
	/**
	 * 根据查询条件分页查询用户列表
	 * @param query
	 * @return
	 */
	public List<SysUser> selectUserList(Query<SysUser> query);
	
	/**
	 * 根据条件分页查询角色数据
	 * @param query
	 * @return
	 */
	public List<SysRole> selectRoleList(Query<SysRole> query);

	/**
	 * 通过用户名查询用户
	 * @param loginName
	 * @return
	 */
	public SysUser selectUserByLoginName(String loginName);
	
	/**
	 * 通过用户名查询用户列表
	 * @param query
	 * @return
	 */
	public List<SysUser> selectUserListByLoginName(Query<SysUser> query);
	
	/**
	 * 根据查询条件分页查询已分配角色用户列表
	 * @param query
	 * @return
	 */
	public List<SysUser> selectUserListByRoleIds(Query<SysUser> query);
}
