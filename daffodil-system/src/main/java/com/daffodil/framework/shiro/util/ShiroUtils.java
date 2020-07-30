package com.daffodil.framework.shiro.util;

import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.mgt.RealmSecurityManager;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

import com.daffodil.core.constant.Constants;
import com.daffodil.framework.shiro.realm.UserRealm;
import com.daffodil.system.entity.SysRole;
import com.daffodil.system.entity.SysUser;
import com.daffodil.util.BeanUtils;
import com.daffodil.util.StringUtils;

import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;

/**
 * shiro 工具类
 * 
 * @author yweijian
 * @date 2019年8月18日
 * @version 1.0
 */
public class ShiroUtils {
	
	/**
	 * 获取shio认证对象
	 * @return
	 */
	public static Subject getSubject() {
		return SecurityUtils.getSubject();
	}

	/**
	 * 获取会话
	 * @return
	 */
	public static Session getSession() {
		return SecurityUtils.getSubject().getSession();
	}

	/**
	 * 退出登录
	 */
	public static void logout() {
		getSubject().logout();
	}

	/**
	 * 获取用户
	 * @return
	 */
	public static SysUser getSysUser() {
		SysUser user = null;
		Object obj = getSubject().getPrincipal();
		if (StringUtils.isNotNull(obj)) {
			user = new SysUser();
			BeanUtils.copyBeanProp(user, obj);
		}
		return user;
	}

	/**
	 * 设置用户
	 * @param user
	 */
	public static void setSysUser(SysUser user) {
		Subject subject = getSubject();
		PrincipalCollection principalCollection = subject.getPrincipals();
		String realmName = principalCollection.getRealmNames().iterator().next();
		PrincipalCollection newPrincipalCollection = new SimplePrincipalCollection(user, realmName);
		// 重新加载Principal
		subject.runAs(newPrincipalCollection);
	}

	/**
	 * 清除权限缓存信息
	 */
	public static void clearCachedAuthorizationInfo() {
		RealmSecurityManager rsm = (RealmSecurityManager) SecurityUtils.getSecurityManager();
		UserRealm realm = (UserRealm) rsm.getRealms().iterator().next();
		realm.clearCachedAuthorizationInfo();
	}

	/**
	 * 获取用户编号
	 * @return
	 */
	public static String getUserId() {
		return getSysUser().getId();
	}

	/**
	 * 获取登录名称
	 * @return
	 */
	public static String getLoginName() {
		return getSysUser().getLoginName();
	}
	
	/**
	 * 获取邮箱名称
	 * @return
	 */
	public static String getEmail() {
		return getSysUser().getEmail();
	}
	
	/**
	 * 是否是管理员
	 * @return
	 */
	public static boolean isAdmin(){
		if(Constants.YES.equals(getSysUser().getIsAdmin())){
			return true;
		}
		List<SysRole> roles = getSysUser().getRoles();
		if(StringUtils.isNotEmpty(roles)){
			for(SysRole role : roles){
				if(Constants.SYSADMIN.equals(role.getRoleKey())){
					return true;
				}
			}
		}
		return false;
	}
	
	/**
	 * 判断用户是否是管理员
	 * @param sysUser
	 * @return
	 */
	public static boolean isAdmin(SysUser sysUser){
		if(null == sysUser){
			return false;
		}
		if(Constants.YES.equals(sysUser.getIsAdmin())){
			return true;
		}
		List<SysRole> roles = sysUser.getRoles();
		if(StringUtils.isNotEmpty(roles)){
			for(SysRole role : roles){
				if(Constants.SYSADMIN.equals(role.getRoleKey())){
					return true;
				}
			}
		}
		return false;
	}

	/**
	 * 获取IP
	 * @return
	 */
	public static String getIp() {
		return getSubject().getSession().getHost();
	}

	/**
	 * 会话编号
	 * @return
	 */
	public static String getSessionId() {
		return String.valueOf(getSubject().getSession().getId());
	}

	/**
	 * 生成随机盐
	 */
	public static String randomSalt() {
		// 一个Byte占两个字节，此处生成的3字节，字符串长度为6
		SecureRandomNumberGenerator secureRandom = new SecureRandomNumberGenerator();
		String hex = secureRandom.nextBytes(3).toHex();
		return hex;
	}
	
	/**
	 * MD5-用户密码加密
	 * @param loginName 用户名
	 * @param password 密码
	 * @param salt 加密盐
	 * @return
	 */
	public static String encryptPassword(String loginName, String password, String salt) {
		return new Md5Hash(loginName + password + salt).toHex().toString();
	}
}
