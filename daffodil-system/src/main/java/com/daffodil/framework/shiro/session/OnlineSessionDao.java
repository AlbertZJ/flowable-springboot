package com.daffodil.framework.shiro.session;

import java.io.Serializable;
import java.util.Date;

import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.eis.EnterpriseCacheSessionDAO;
import org.springframework.beans.factory.annotation.Autowired;

import com.daffodil.core.enums.OnlineStatus;
import com.daffodil.framework.shiro.service.SysShiroService;
import com.daffodil.util.StringUtils;


/**
 * 创建、获取、更新、删除、记录用户会话
 * @author yweijian
 * @date 2020年2月15日
 * @version 1.0
 */
public class OnlineSessionDao extends EnterpriseCacheSessionDAO{

	/**
	 * 上次同步数据库的时间戳
	 */
	private static final String ONLINE_SESSION_LAST_RECORD_TIMESTAMP = "ONLINE_SESSION_LAST_RECORD_TIMESTAMP";

	@Autowired
	private SysShiroService sysShiroService;
	
	@Override
    protected Session doReadSession(Serializable sessionId){
        return sysShiroService.getSession(sessionId);
    }

	/**
	 * 删除会话；当会话过期/停止（如用户退出时）属性等会调用
	 */
	@Override
	protected void doDelete(Session session) {
		OnlineSession onlineSession = (OnlineSession) session;
		if (null == onlineSession) {
			return;
		}
		onlineSession.setStatus(OnlineStatus.OFF_LINE);
		sysShiroService.deleteSession(onlineSession);
	}
	
	/**
	 * 记录会话；如更新会话最后访问时间/停止会话/设置超时时间/设置移除属性等会调用
	 */
	public void recordOnlineSession(OnlineSession onlineSession) {
		Date lastRecordTimestamp = (Date) onlineSession.getAttribute(ONLINE_SESSION_LAST_RECORD_TIMESTAMP);
		if (lastRecordTimestamp != null) {
			boolean needSync = true;
			long deltaTime = onlineSession.getLastAccessTime().getTime() - lastRecordTimestamp.getTime();
			//同步session到数据库的周期1分钟
			if (deltaTime < 1 * 60 * 1000) {
				// 时间差不足 无需同步
				needSync = false;
			}
			// session 数据变更了 同步
			if (StringUtils.isNotEmpty(onlineSession.getUserId()) && onlineSession.isAttributeChanged()) {
				needSync = true;
			}
			if (needSync == false) {
				return;
			}
		}
		// 更新上次同步数据库时间
		onlineSession.setAttribute(ONLINE_SESSION_LAST_RECORD_TIMESTAMP, onlineSession.getLastAccessTime());
		// 更新完后 重置标识
		if (onlineSession.isAttributeChanged()) {
			onlineSession.resetAttributeChanged();
		}
		sysShiroService.recordSession(onlineSession);
	}
}
