package com.daffodil.framework.shiro.filter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import org.apache.shiro.session.SessionException;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.LogoutFilter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.daffodil.core.constant.Constants;
import com.daffodil.framework.shiro.redis.ShiroRedisCache;
import com.daffodil.framework.shiro.redis.ShiroRedisCacheManager;
import com.daffodil.framework.shiro.service.SysShiroService;
import com.daffodil.framework.shiro.util.ShiroUtils;
import com.daffodil.system.entity.SysUser;
import com.daffodil.util.MessageUtils;
import com.daffodil.util.StringUtils;
import com.daffodil.util.spring.SpringUtils;

/**
 * 退出过滤器
 * 
 * @author yweijian
 * @date 2019年8月21日
 * @version 1.0
 */
public class SysLogoutFilter extends LogoutFilter {
	
	private static final Logger log = LoggerFactory.getLogger(SysLogoutFilter.class);

	/**
	 * 退出后重定向的地址
	 */
	private String loginUrl;

	private ShiroRedisCacheManager cacheManager;

	@Override
	protected boolean preHandle(ServletRequest request, ServletResponse response) throws Exception {
		Subject subject = getSubject(request, response);
		String redirectUrl = getRedirectUrl(request, response, subject);
		try {
			SysUser user = ShiroUtils.getSysUser();
			if (StringUtils.isNotNull(user)) {
				String loginName = user.getLoginName();
				// 记录用户退出日志
				SysShiroService shiroService = SpringUtils.getBean(SysShiroService.class);
				shiroService.recordLoginInfo(loginName, Constants.LOGOUT, MessageUtils.message("user.logout.success"));
				// 清理缓存
				ShiroRedisCache cache = cacheManager.getCache("shiro:login:user");
				cache.remove(loginName);
			}
			// 退出登录
			subject.logout();
		} catch (SessionException e) {
			log.error("注销失败", e);
		}
		issueRedirect(request, response, redirectUrl);
		return false;
	}

	/**
	 * 退出跳转URL
	 */
	@Override
	protected String getRedirectUrl(ServletRequest request, ServletResponse response, Subject subject) {
		String url = getLoginUrl();
		if (StringUtils.isNotEmpty(url)) {
			return url;
		}
		return super.getRedirectUrl(request, response, subject);
	}
	
	public String getLoginUrl() {
		return loginUrl;
	}

	public void setLoginUrl(String loginUrl) {
		this.loginUrl = loginUrl;
	}

	public void setCacheManager(ShiroRedisCacheManager cacheManager) {
		this.cacheManager = cacheManager;
	}

}
