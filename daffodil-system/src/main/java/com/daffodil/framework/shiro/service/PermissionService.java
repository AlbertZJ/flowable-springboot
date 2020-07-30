package com.daffodil.framework.shiro.service;

import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Service;

/**
 * js调用 thymeleaf 实现按钮权限可见性
 * @author yweijian
 * @date 2019年12月19日
 * @version 1.0
 */
@Service("permission")
public class PermissionService {
	
	/**
	 * 是否拥有某个权限-显示或隐藏
	 * @param permission
	 * @return
	 */
	public String hasPerms(String permission) {
		return isPermittedOperator(permission) ? "" : "hidden";
	}
	
	/**
	 * 是否拥有某个角色-显示或隐藏
	 * @param role
	 * @return
	 */
	public String hasRole(String role) {
		return hasRoleOperator(role) ? "" : "hidden";
	}

	/**
	 * 判断用户是否拥有某个权限
	 * @param permission 权限字符串
	 * @return 结果
	 */
	private boolean isPermittedOperator(String permission) {
		return SecurityUtils.getSubject().isPermitted(permission);
	}

	/**
	 * 判断用户是否拥有某个角色
	 * @param role 角色字符串
	 * @return 结果
	 */
	private boolean hasRoleOperator(String role) {
		return SecurityUtils.getSubject().hasRole(role);
	}
	
}
