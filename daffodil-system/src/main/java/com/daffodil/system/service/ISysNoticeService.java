package com.daffodil.system.service;

import java.util.List;

import com.daffodil.core.entity.Query;
import com.daffodil.system.entity.SysNotice;

/**
 * 公告 服务
 * @author yweijian
 * @date 2019年12月18日
 * @version 1.0
 */
public interface ISysNoticeService {

	/**
	 * 查询公告列表
	 * @param query
	 * @return
	 */
	public List<SysNotice> selectNoticeList(Query<SysNotice> query);
	
	/**
	 * 查询公告信息
	 * @param noticeId
	 * @return
	 */
	public SysNotice selectNoticeById(String noticeId);

	/**
	 * 新增公告
	 * @param notice
	 */
	public void insertNotice(SysNotice notice);

	/**
	 * 修改公告
	 * @param notice
	 */
	public void updateNotice(SysNotice notice);

	/**
	 * 删除公告信息
	 * @param ids
	 */
	public void deleteNoticeByIds(String[] ids);
}
