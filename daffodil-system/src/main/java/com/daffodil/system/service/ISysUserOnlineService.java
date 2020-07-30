package com.daffodil.system.service;

import java.util.Date;
import java.util.List;

import com.daffodil.core.entity.Query;
import com.daffodil.system.entity.SysUserOnline;

/**
 * 在线用户 服务
 * @author yweijian
 * @date 2019年12月18日
 * @version 1.0
 */
public interface ISysUserOnlineService {
	
	/**
	 * 通过会话序号查询信息
	 * @param sessionId
	 * @return
	 */
	public SysUserOnline selectOnlineById(String sessionId);

	/**
	 * 通过会话序号删除信息
	 * @param sessionIds
	 */
	public void deleteOnlineByIds(String[] sessionIds);

	/**
	 * 保存会话信息
	 * @param online
	 */
	public void insertOnline(SysUserOnline online);
	
	/**
	 * 更新会话信息
	 * @param online
	 */
	public void updateOnline(SysUserOnline online);

	/**
	 * 查询会话集合
	 * @param query
	 * @return
	 */
	public List<SysUserOnline> selectUserOnlineList(Query<SysUserOnline> query);

	/**
	 * 强退用户
	 * @param sessionId
	 */
	public void forceLogout(String sessionId);

	/**
	 * 查询会话集合
	 * @param expiredDate 会话有效期
	 * @return
	 */
	public List<SysUserOnline> selectOnlineByExpired(Date expiredDate);
}
