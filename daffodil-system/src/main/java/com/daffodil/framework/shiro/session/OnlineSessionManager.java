package com.daffodil.framework.shiro.session;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.apache.commons.lang3.time.DateUtils;
import org.apache.shiro.session.ExpiredSessionException;
import org.apache.shiro.session.InvalidSessionException;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.DefaultSessionKey;
import org.apache.shiro.session.mgt.SessionKey;
import org.apache.shiro.web.session.mgt.DefaultWebSessionManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.daffodil.core.constant.ShiroConstants;
import com.daffodil.system.entity.SysUserOnline;
import com.daffodil.system.service.ISysUserOnlineService;
import com.daffodil.util.BeanUtils;
import com.daffodil.util.StringUtils;
import com.daffodil.util.spring.SpringUtils;

/**
 * web在线会话管理
 * @author yweijian
 * @date 2019年8月20日
 * @version 1.0
 */
public class OnlineSessionManager extends DefaultWebSessionManager{
	
	private static final Logger log = LoggerFactory.getLogger(OnlineSessionManager.class);

	@Override
	public void setAttribute(SessionKey sessionKey, Object attributeKey, Object value) throws InvalidSessionException {
		super.setAttribute(sessionKey, attributeKey, value);
		if (value != null && needMarkAttributeChanged(attributeKey)) {
			OnlineSession session = getOnlineSession(sessionKey);
			session.markAttributeChanged();
		}
	}

	private boolean needMarkAttributeChanged(Object attributeKey) {
		if (attributeKey == null) {
			return false;
		}
		String attributeKeyStr = attributeKey.toString();
		if (attributeKeyStr.startsWith("org.springframework")) {
			return false;
		}
		if (attributeKeyStr.startsWith("javax.servlet")) {
			return false;
		}
		if (attributeKeyStr.equals(ShiroConstants.CURRENT_USERNAME)) {
			return false;
		}
		return true;
	}

	@Override
	public Object removeAttribute(SessionKey sessionKey, Object attributeKey) throws InvalidSessionException {
		Object removed = super.removeAttribute(sessionKey, attributeKey);
		if (removed != null) {
			OnlineSession s = getOnlineSession(sessionKey);
			s.markAttributeChanged();
		}

		return removed;
	}

	public OnlineSession getOnlineSession(SessionKey sessionKey) {
		OnlineSession session = null;
		Object obj = doGetSession(sessionKey);
		if (StringUtils.isNotNull(obj)) {
			session = new OnlineSession();
			BeanUtils.copyBeanProp(session, obj);
		}
		return session;
	}

	/**
	 * 验证session是否有效 用于删除过期session
	 */
	@Override
	public void validateSessions() {
		log.info("清除无效过期会话...");
		
		int timeout = (int) this.getGlobalSessionTimeout();
		Date expiredDate = DateUtils.addMilliseconds(new Date(), 0 - timeout);
		ISysUserOnlineService userOnlineService = SpringUtils.getBean(ISysUserOnlineService.class);
		List<SysUserOnline> userOnlineList = userOnlineService.selectOnlineByExpired(expiredDate);
		// 批量过期删除
		List<String> sessionIds = new ArrayList<String>();
		for (SysUserOnline userOnline : userOnlineList) {
			try {
				SessionKey key = new DefaultSessionKey(userOnline.getId());
				Session session = retrieveSession(key);
				if (session != null) {
					throw new InvalidSessionException();
				}
			} catch (InvalidSessionException e) {
				boolean expired = (e instanceof ExpiredSessionException);
				String msg = "无效过期会话ID[" + userOnline.getId() + "]" + (expired ? " (expired)" : " (stopped)");
				log.info(msg);
				sessionIds.add(userOnline.getId());
			}

		}
		if (sessionIds.size() > 0) {
			try {
				userOnlineService.deleteOnlineByIds(sessionIds.toArray(new String[sessionIds.size()]));
			} catch (Exception e) {
				log.error("批量删除无效过期会话失败。", e);
			}
		}
		log.info("批量删除无效过期会话成功。");

	}
}
