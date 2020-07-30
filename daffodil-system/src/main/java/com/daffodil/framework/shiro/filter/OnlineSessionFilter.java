package com.daffodil.framework.shiro.filter;

import java.io.IOException;
import java.io.Serializable;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.AccessControlFilter;
import org.apache.shiro.web.util.WebUtils;

import com.daffodil.core.constant.ShiroConstants;
import com.daffodil.util.StringUtils;
import com.daffodil.core.enums.OnlineStatus;
import com.daffodil.framework.shiro.session.OnlineSession;
import com.daffodil.framework.shiro.session.OnlineSessionDao;
import com.daffodil.framework.shiro.session.OnlineSessionManager;
import com.daffodil.framework.shiro.util.ShiroUtils;
import com.daffodil.system.entity.SysUser;

/**
 * 自定义访问控制
 * 
 * @author yweijian
 * @date 2019年8月21日
 * @version 1.0
 */
public class OnlineSessionFilter extends AccessControlFilter {
	/**
	 * 强制退出后重定向的地址
	 */
	private String loginUrl;

	private OnlineSessionManager sessionManager;

	/**
	 * 表示是否允许访问；如果允许访问返回true，否则false;
	 * mappedValue就是[urls]配置中拦截器参数部分.
	 */
	@Override
	protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue) throws Exception {
		Subject subject = getSubject(request, response);
		if (subject == null || subject.getSession() == null) {
			return true;
		}
		Serializable sessionId = subject.getSession().getId();
		Session session = sessionManager.getSessionDAO().readSession(sessionId);
		if (session != null && session instanceof OnlineSession) {
			OnlineSession onlineSession = (OnlineSession) session;
			// 把user对象设置进去
			if (StringUtils.isEmpty(onlineSession.getUserId())) {
				SysUser user = ShiroUtils.getSysUser();
				if (user != null) {
					onlineSession.setId(sessionId);
					onlineSession.setUserId(user.getId());
					onlineSession.setLoginName(user.getLoginName());
					onlineSession.setAvatar(user.getAvatar());
					onlineSession.markAttributeChanged();
				}
			}
			request.setAttribute(ShiroConstants.ONLINE_SESSION, onlineSession);
			
			if (onlineSession.getStatus() == OnlineStatus.OFF_LINE) {
				return false;
			}
		}
		OnlineSession onlineSession = (OnlineSession) request.getAttribute(ShiroConstants.ONLINE_SESSION);
		if (onlineSession != null && onlineSession.getUserId() != null && onlineSession.getStopTimestamp() == null) {
			OnlineSessionDao sessionDao = (OnlineSessionDao) sessionManager.getSessionDAO();
			sessionDao.recordOnlineSession(onlineSession);
		}
		return true;
	}

	/**
	 * 表示当访问拒绝时是否已经处理了；
	 * 如果返回true表示需要继续处理；
	 * 如果返回false表示该拦截器实例已经处理了，将直接返回即可。
	 */
	@Override
	protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {
		Subject subject = getSubject(request, response);
		if (subject != null) {
			subject.logout();
		}
		saveRequestAndRedirectToLogin(request, response);
		return false;
	}

	@Override
	protected void redirectToLogin(ServletRequest request, ServletResponse response) throws IOException {
		WebUtils.issueRedirect(request, response, loginUrl);
	}

	public void setSessionManager(OnlineSessionManager sessionManager) {
		this.sessionManager = sessionManager;
	}

	public void setLoginUrl(String loginUrl) {
		this.loginUrl = loginUrl;
	}

}
