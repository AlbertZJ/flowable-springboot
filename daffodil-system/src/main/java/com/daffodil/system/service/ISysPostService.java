package com.daffodil.system.service;

import java.util.List;

import com.daffodil.core.entity.Query;
import com.daffodil.system.entity.SysPost;

/**
 * 岗位信息
 * @author yweijian
 * @date 2019年12月18日
 * @version 1.0
 */
public interface ISysPostService {
	/**
	 * 分页查询岗位信息集合
	 * @param query
	 * @return
	 */
	public List<SysPost> selectPostList(Query<SysPost> query);

	/**
	 * 根据用户ID查询岗位
	 * @param userId
	 * @return
	 */
	public List<SysPost> selectPostsByUserId(String userId);

	/**
	 * 通过岗位ID查询岗位信息
	 * @param postId
	 * @return
	 */
	public SysPost selectPostById(String postId);

	/**
	 * 批量删除岗位信息
	 * @param ids
	 */
	public void deletePostByIds(String[] ids);

	/**
	 * 新增保存岗位信息
	 * @param post
	 */
	public void insertPost(SysPost post);

	/**
	 * 修改保存岗位信息
	 * @param post
	 */
	public void updatePost(SysPost post);

	/**
	 * 校验岗位名称唯一性
	 * @param post
	 * @return
	 */
	public boolean checkPostNameUnique(SysPost post);

	/**
	 * 校验岗位编码唯一性
	 * @param post
	 * @return
	 */
	public boolean checkPostCodeUnique(SysPost post);
}
