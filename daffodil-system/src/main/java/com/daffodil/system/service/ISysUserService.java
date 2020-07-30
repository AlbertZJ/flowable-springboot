package com.daffodil.system.service;

import java.util.List;

import com.daffodil.core.entity.Query;
import com.daffodil.system.entity.SysUser;

/**
 * 用户 业务服务
 * 
 * @author yweijian
 * @date 2019年8月15日
 * @version 1.0
 */
public interface ISysUserService {
	/**
	 * 根据查询条件分页查询用户列表
	 * @param query
	 * @return
	 */
	public List<SysUser> selectUserList(Query<SysUser> query);

	/**
	 * 根据查询条件分页查询已分配角色用户列表
	 * @param query
	 * @return
	 */
	public List<SysUser> selectAllocatedList(Query<SysUser> query);

	/**
	 * 通过用户名查询用户
	 * @param loginName
	 * @return
	 */
	public SysUser selectUserByLoginName(String loginName);

	/**
	 * 通过手机号码查询用户
	 * @param phone
	 * @return
	 */
	public SysUser selectUserByPhone(String phone);

	/**
	 * 通过邮箱查询用户
	 * @param email
	 * @return
	 */
	public SysUser selectUserByEmail(String email);

	/**
	 * 通过用户ID查询用户
	 * @param userId
	 * @return
	 */
	public SysUser selectUserById(String userId);

	/**
	 * 批量删除用户信息
	 * @param ids
	 */
	public void deleteUserByIds(String[] ids);

	/**
	 * 保存用户信息
	 * @param user
	 */
	public void insertUser(SysUser user);

	/**
	 * 保存用户信息
	 * @param user
	 */
	public void updateUser(SysUser user);

	/**
	 * 修改用户详细信息
	 * @param user
	 * @return
	 */
	public void updateUserInfo(SysUser user);

	/**
	 * 修改用户密码信息
	 * @param user
	 * @return
	 */
	public void resetUserPwd(SysUser user);

	/**
	 * 校验用户名称是否唯一
	 * @param user
	 * @return
	 */
	public boolean checkLoginNameUnique(SysUser user);

	/**
	 * 校验手机号码是否唯一
	 * @param user
	 * @return
	 */
	public boolean checkPhoneUnique(SysUser user);

	/**
	 * 校验email是否唯一
	 * @param user
	 * @return
	 */
	public boolean checkEmailUnique(SysUser user);

	/**
	 * 根据用户ID查询用户所属角色组
	 * @param userId
	 * @return
	 */
	public String selectUserRoleGroup(String userId);

	/**
	 * 根据用户ID查询用户所属岗位组
	 * @param userId
	 * @return
	 */
	public String selectUserPostGroup(String userId);

	/**
	 * 导入用户数据
	 * @param userList 用户数据列表
	 * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
	 * @param operName  操作用户
	 * @return
	 */
	public String importUser(List<SysUser> userList, Boolean isUpdateSupport, String operName);

}
