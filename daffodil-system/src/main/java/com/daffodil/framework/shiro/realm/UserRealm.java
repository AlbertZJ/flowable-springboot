package com.daffodil.framework.shiro.realm;

import java.util.Set;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.daffodil.system.entity.SysUser;
import com.daffodil.system.service.ISysMenuService;
import com.daffodil.system.service.ISysRoleService;
import com.daffodil.core.constant.Constants;
import com.daffodil.framework.shiro.service.SysLoginService;
import com.daffodil.framework.shiro.util.ShiroUtils;

/**
 * 用户登录登录权限
 * 
 * @author yweijian
 * @date 2019年8月18日
 * @version 1.0
 */
public class UserRealm extends AuthorizingRealm {
	private static final Logger log = LoggerFactory.getLogger(UserRealm.class);

	@Autowired
	private ISysMenuService menuService;

	@Autowired
	private ISysRoleService roleService;

	@Autowired
	private SysLoginService loginService;
	
	/**
	 * 授权
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection arg0) {
		SysUser user = ShiroUtils.getSysUser();
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		// 管理员拥有所有权限
		if (ShiroUtils.isAdmin()) {
			info.addRole(Constants.SYSADMIN);
			info.addStringPermission("*:*:*");
		} else {
			// 角色列表
			Set<String> roleKeys = roleService.selectRoleKeysByUserId(user.getId());
			// 权限列表
			Set<String> menus = menuService.selectPermsByUserId(user.getId());
			// 角色加入AuthorizationInfo认证对象
			info.setRoles(roleKeys);
			// 权限加入AuthorizationInfo认证对象
			info.setStringPermissions(menus);
		}
		return info;
	}

	/**
	 * 登录认证
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		UsernamePasswordToken upToken = (UsernamePasswordToken) token;
		String username = upToken.getUsername();
		String password = "";
		if (upToken.getPassword() != null) {
			password = new String(upToken.getPassword());
		}

		SysUser user = null;
		try {
			user = loginService.login(username, password);
		} catch (Exception e) {
			log.info("对用户[" + username + "]进行登录验证..验证未通过{}", e.getMessage());
			throw new AuthenticationException(e.getMessage(), e);
		}
		SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(user, password, getName());
		return info;
	}

	/**
	 * 清理缓存权限
	 */
	public void clearCachedAuthorizationInfo() {
		this.clearCachedAuthorizationInfo(SecurityUtils.getSubject().getPrincipals());
	}
}
