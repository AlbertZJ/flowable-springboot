package com.daffodil.framework.shiro.service;

import java.util.Date;
import java.util.concurrent.atomic.AtomicInteger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import com.daffodil.core.constant.Constants;
import com.daffodil.core.constant.ShiroConstants;
import com.daffodil.core.exception.BaseException;
import com.daffodil.core.enums.DataStatus;
import com.daffodil.framework.shiro.redis.ShiroRedisCache;
import com.daffodil.framework.shiro.redis.ShiroRedisCacheManager;
import com.daffodil.framework.shiro.util.ShiroUtils;
import com.daffodil.system.entity.SysUser;
import com.daffodil.system.service.ISysUserService;
import com.daffodil.util.MessageUtils;
import com.daffodil.util.ServletUtils;

/**
 * 用户登录、校验处理服务
 * 
 * @author yweijian
 * @date 2019年8月18日
 * @version 1.0
 */
@Component
public class SysLoginService {

	@Autowired
	private ISysUserService userService;
	
	@Autowired
	private SysShiroService shiroService;
	
	@Autowired
	private ShiroRedisCacheManager cacheManager;
	
	/**
	 * 密码输入错误最多重复次数
	 */
	private Integer maxRetryCount = 5;

	/**
	 * 登录
	 */
	public SysUser login(String username, String password) {
		// 验证码校验
		if (!StringUtils.isEmpty(ServletUtils.getRequest().getAttribute(ShiroConstants.CURRENT_CAPTCHA))) {
			shiroService.recordLoginInfo(username, Constants.LOGIN_FAIL,MessageUtils.message("user.kaptcha.error"));
			throw new BaseException(MessageUtils.message("user.kaptcha.error"));
		}
		// 用户名或密码为空 错误
		if (StringUtils.isEmpty(username) || StringUtils.isEmpty(password)) {
			shiroService.recordLoginInfo(username, Constants.LOGIN_FAIL, MessageUtils.message("not.null"));
			throw new BaseException(MessageUtils.message("not.null"));
		}
		// 密码如果不在指定范围内 错误
		if (password.length() < Constants.PASSWORD_MIN_LENGTH || password.length() > Constants.PASSWORD_MAX_LENGTH) {
			shiroService.recordLoginInfo(username, Constants.LOGIN_FAIL, MessageUtils.message("user.password.not.match"));
			throw new BaseException(MessageUtils.message("user.password.not.match"));
		}

		// 用户名不在指定范围内 错误
		if (username.length() < Constants.USERNAME_MIN_LENGTH || username.length() > Constants.USERNAME_MAX_LENGTH) {
			shiroService.recordLoginInfo(username, Constants.LOGIN_FAIL, MessageUtils.message("user.password.not.match"));
			throw new BaseException(MessageUtils.message("user.password.not.match"));
		}

		// 查询用户信息
		SysUser user = userService.selectUserByLoginName(username);

		if (user == null && maybeMobilePhoneNumber(username)) {
			user = userService.selectUserByPhone(username);
		}

		if (user == null && maybeEmail(username)) {
			user = userService.selectUserByEmail(username);
		}

		if (user == null) {
			shiroService.recordLoginInfo(username, Constants.LOGIN_FAIL, MessageUtils.message("user.not.exists"));
			throw new BaseException(MessageUtils.message("user.not.exists"));
		}

		if (DataStatus.DELETED.getCode().equals(user.getStatus())) {
			shiroService.recordLoginInfo(username, Constants.LOGIN_FAIL, MessageUtils.message("user.password.delete"));
			throw new BaseException(MessageUtils.message("user.password.delete"));
		}

		this.validate(user, password);
		user.setLoginIp(ShiroUtils.getIp());
		user.setLoginTime(new Date());
		userService.updateUserInfo(user);
		
		shiroService.recordLoginInfo(username, Constants.LOGIN_SUCCESS, MessageUtils.message("user.login.success"));
		
		return userService.selectUserById(user.getId());
	}
	
	/**
	 * 验证
	 * @param user
	 * @param password
	 */
	public void validate(SysUser user, String password) {
		String loginName = user.getLoginName();
		
		ShiroRedisCache cache = cacheManager.getCache("shiro:login:count");
		
		AtomicInteger retryCount = (AtomicInteger) cache.get(loginName);

		if (retryCount == null) {
			retryCount = new AtomicInteger(0);
			cache.put(loginName, retryCount);
		}
		if (retryCount.incrementAndGet() > maxRetryCount) {
			shiroService.recordLoginInfo(loginName, Constants.LOGIN_FAIL, MessageUtils.message("user.password.retry.limit.exceed", maxRetryCount));
			throw new BaseException(MessageUtils.message("user.password.retry.limit.exceed", maxRetryCount));
		}

		if (!matches(user, password)) {
			shiroService.recordLoginInfo(loginName, Constants.LOGIN_FAIL, MessageUtils.message("user.password.retry.limit.count", retryCount));
			cache.put(loginName, retryCount);
			throw new BaseException(MessageUtils.message("user.password.not.match"));
		} else {
			cache.remove(loginName);
		}
	}

	/**
	 * 密码验证
	 * @param user
	 * @param newPassword
	 * @return
	 */
	public boolean matches(SysUser user, String newPassword) {
		return user.getPassword().equals(ShiroUtils.encryptPassword(user.getLoginName(), newPassword, user.getSalt()));
	}

	private boolean maybeEmail(String username) {
		if (!username.matches(Constants.EMAIL_PATTERN)) {
			return false;
		}
		return true;
	}

	private boolean maybeMobilePhoneNumber(String username) {
		if (!username.matches(Constants.MOBILE_PHONE_NUMBER_PATTERN)) {
			return false;
		}
		return true;
	}

}
