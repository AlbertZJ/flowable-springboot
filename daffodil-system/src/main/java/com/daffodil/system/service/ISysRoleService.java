package com.daffodil.system.service;

import java.util.List;
import java.util.Set;

import com.daffodil.core.entity.Query;
import com.daffodil.system.entity.SysRole;
import com.daffodil.system.entity.SysUserRole;

/**
 * 角色业务层服务
 * @author yweijian
 * @date 2019年12月18日
 * @version 1.0
 */
public interface ISysRoleService {
	
	/**
	 * 根据条件分页查询角色数据
	 * @param query
	 * @return
	 */
	public List<SysRole> selectRoleList(Query<SysRole> query);

	/**
	 * 根据用户ID查询角色权限列表
	 * @param userId
	 * @return
	 */
	public Set<String> selectRoleKeysByUserId(String userId);

	/**
	 * 根据用户ID查询角色列表
	 * @param userId
	 * @return
	 */
	public List<SysRole> selectRolesByUserId(String userId);

	/**
	 * 通过角色ID查询角色
	 * @param roleId
	 * @return
	 */
	public SysRole selectRoleById(String roleId);

	/**
	 * 批量删除角色用户信息
	 * @param ids
	 */
	public void deleteRoleByIds(String[] ids);

	/**
	 * 新增保存角色信息
	 * @param role
	 */
	public void insertRole(SysRole role);

	/**
	 * 修改保存角色信息
	 * @param role
	 */
	public void updateRole(SysRole role);

	/**
	 * 修改角色数据权限信息
	 * @param role
	 */
	public void authRoleDataScope(SysRole role);

	/**
	 * 校验角色名称是否唯一
	 * @param role
	 * @return
	 */
	public boolean checkRoleNameUnique(SysRole role);

	/**
	 * 校验角色权限是否唯一
	 * @param role
	 * @return
	 */
	public boolean checkRoleKeyUnique(SysRole role);

	/**
	 * 角色状态修改
	 * @param role
	 */
	public void changeRoleStatus(SysRole role);

	/**
	 * 取消授权用户角色
	 * @param userRole
	 */
	public void deleteAuthUser(SysUserRole userRole);

	/**
	 * 批量取消授权用户角色
	 * @param roleId
	 * @param userIds
	 */
	public void deleteAuthUsers(String roleId, String[] userIds);

	/**
	 * 批量选择授权用户角色
	 * @param roleId
	 * @param userIds
	 */
	public void insertAuthUsers(String roleId, String[] userIds);
}
