package com.daffodil.framework.shiro.service;

import java.io.Serializable;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;

import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

import com.daffodil.core.constant.Constants;
import com.daffodil.core.entity.Query;
import com.daffodil.framework.shiro.session.OnlineSession;
import com.daffodil.framework.shiro.util.ShiroUtils;
import com.daffodil.system.entity.SysLoginInfo;
import com.daffodil.system.entity.SysOperLog;
import com.daffodil.system.entity.SysShiroFilter;
import com.daffodil.system.entity.SysUserOnline;
import com.daffodil.system.service.ISysLoginInfoService;
import com.daffodil.system.service.ISysOperLogService;
import com.daffodil.system.service.ISysShiroFilterService;
import com.daffodil.system.service.ISysUserOnlineService;
import com.daffodil.util.AddressUtils;
import com.daffodil.util.ServletUtils;
import com.daffodil.util.StringUtils;
import com.daffodil.util.text.Convert;

import eu.bitwalker.useragentutils.UserAgent;

/**
 * 同步用户会话信息服务
 * 
 * @author yweijian
 * @date 2019年8月20日
 * @version 1.0
 */
@Component
public class SysShiroService {
	
	@Autowired
	private ISysLoginInfoService loginInfoService;
	
	@Autowired
	private ISysOperLogService operLogService;
	
	@Autowired
	private ISysUserOnlineService onlineService;
	
	@Autowired
	private ISysShiroFilterService filterService;

	/**
	 * 删除会话
	 *
	 * @param onlineSession 会话信息
	 *            
	 */
	public void deleteSession(OnlineSession onlineSession) {
		String[] sessionIds = Convert.toStrArray(String.valueOf(onlineSession.getId()));
		onlineService.deleteOnlineByIds(sessionIds);
	}

	/**
	 * 获取会话信息
	 *
	 * @param sessionId
	 * @return
	 */
	public Session getSession(Serializable sessionId) {
		SysUserOnline userOnline = onlineService.selectOnlineById(String.valueOf(sessionId));
		return StringUtils.isNull(userOnline) ? null : this.getSession(userOnline);
	}
	
	/**
	 * 创建会话信息
	 * @param userOnline
	 * @return
	 */
	private Session getSession(SysUserOnline userOnline) {
		OnlineSession session = new OnlineSession();
		if (StringUtils.isNotNull(userOnline)) {
			session.setId(userOnline.getId());
			session.setHost(userOnline.getIpaddr());
			session.setBrowser(userOnline.getBrowser());
			session.setOs(userOnline.getOs());
			session.setDeptName(userOnline.getDeptName());
			session.setLoginName(userOnline.getLoginName());
			session.setStartTimestamp(userOnline.getStartTimestamp());
			session.setLastAccessTime(userOnline.getLastAccessTime());
			session.setTimeout(userOnline.getExpireTime());
		}
		return session;
	}
	
	@Async
	public void recordSession(OnlineSession session) {
		SysUserOnline online = onlineService.selectOnlineById(String.valueOf(session.getId()));
		if(online == null){
			online = new SysUserOnline();
			online.setId(String.valueOf(session.getId()));
			online.setDeptName(session.getDeptName());
			online.setLoginName(session.getLoginName());
			online.setStartTimestamp(session.getStartTimestamp());
			online.setLastAccessTime(session.getLastAccessTime());
			online.setExpireTime(session.getTimeout());
			online.setIpaddr(session.getHost());
			online.setLoginLocation(AddressUtils.getRealAddressByIP(session.getHost()));
			online.setBrowser(session.getBrowser());
			online.setOs(session.getOs());
			online.setStatus(session.getStatus());
			onlineService.insertOnline(online);
		}else{
			online.setStatus(session.getStatus());
			onlineService.updateOnline(online);
		}
	}
	
	/**
	 * 操作日志记录
	 * @param operLog 操作日志信息
	 */
	@Async
	public void recordOperLog(SysOperLog operLog) {
		operLogService.insertOperlog(operLog);
	}
	
	/**
	 * 记录登陆信息
	 * @param username
	 * @param status
	 * @param message
	 */
	public void recordLoginInfo(String username, String status, String message) {
		String ip = ShiroUtils.getIp();
		UserAgent userAgent = UserAgent.parseUserAgentString(ServletUtils.getRequest().getHeader("User-Agent"));
		String address = AddressUtils.getRealAddressByIP(ip);
		// 获取客户端操作系统
		String os = userAgent.getOperatingSystem().getName();
		// 获取客户端浏览器
		String browser = userAgent.getBrowser().getName();
		// 封装对象
		SysLoginInfo loginInfo = new SysLoginInfo();
		loginInfo.setLoginName(username);
		loginInfo.setIpaddr(ip);
		loginInfo.setLoginLocation(address);
		loginInfo.setBrowser(browser);
		loginInfo.setOs(os);
		loginInfo.setMsg(message);
		// 日志状态
		if (Constants.LOGIN_SUCCESS.equals(status) || Constants.LOGOUT.equals(status)) {
			loginInfo.setStatus(Constants.SUCCESS);
		} else if (Constants.LOGIN_FAIL.equals(status)) {
			loginInfo.setStatus(Constants.FAIL);
		}
		loginInfo.setCreateTime(new Date());
		// 插入数据
		loginInfoService.insertLoginInfo(loginInfo);
	}
	
	/**
	 * 获取系统过滤约束访问配置
	 * 必须使用有序的LinkedHashMap()
	 * @return
	 */
	public LinkedHashMap<String, String> getShiroFilterMap(){
		Query<SysShiroFilter> query = new Query<SysShiroFilter>();
		query.setOrderBy("orderNum desc");
		List<SysShiroFilter> filters = filterService.selectShiroFilterList(query);
		LinkedHashMap<String, String> filterMap = new LinkedHashMap<String, String>();
		if(StringUtils.isNotEmpty(filters)){
			for(SysShiroFilter filter : filters){
				filterMap.put(filter.getFilterKey(), filter.getFilterValue());
			}
		}
		return filterMap;
	}
}
