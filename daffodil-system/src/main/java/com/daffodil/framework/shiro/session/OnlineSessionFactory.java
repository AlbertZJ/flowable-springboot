package com.daffodil.framework.shiro.session;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.SessionContext;
import org.apache.shiro.session.mgt.SessionFactory;
import org.apache.shiro.web.session.mgt.WebSessionContext;

import com.daffodil.util.IpUtils;
import com.daffodil.util.ServletUtils;

import eu.bitwalker.useragentutils.UserAgent;

/**
 * 创建、获取、更新、删除、记录用户会话工厂
 * @author yweijian
 * @date 2019年8月20日
 * @version 1.0
 */
public class OnlineSessionFactory implements SessionFactory{

	/**
	 * 创建会话
	 */
	@Override
	public Session createSession(SessionContext initData) {
		OnlineSession session = new OnlineSession();
		if (initData != null && initData instanceof WebSessionContext) {
			WebSessionContext sessionContext = (WebSessionContext) initData;
			HttpServletRequest request = (HttpServletRequest) sessionContext.getServletRequest();
			if (request != null) {
				UserAgent userAgent = UserAgent.parseUserAgentString(ServletUtils.getRequest().getHeader("User-Agent"));
				// 获取客户端操作系统
				String os = userAgent.getOperatingSystem().getName();
				// 获取客户端浏览器
				String browser = userAgent.getBrowser().getName();
				session.setHost(IpUtils.getIpAddr(request));
				session.setBrowser(browser);
				session.setOs(os);
			}
		}
		return session;
	}
}
