package com.daffodil.system.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.daffodil.core.constant.Constants;
import com.daffodil.core.dao.JpaDao;
import com.daffodil.core.entity.Query;
import com.daffodil.core.exception.BaseException;
import com.daffodil.framework.shiro.util.ShiroUtils;
import com.daffodil.system.entity.SysPost;
import com.daffodil.system.service.ISysPostService;
import com.daffodil.util.HqlUtils;
import com.daffodil.util.StringUtils;

/**
 * 岗位信息 服务实现
 * @author yweijian
 * @date 2019年12月18日
 * @version 1.0
 */
@Service
public class SysPostServiceImpl implements ISysPostService {

	@Autowired
	private JpaDao jpaDao;

	@Override
	public List<SysPost> selectPostList(Query<SysPost> query) {
		StringBuffer hql = new StringBuffer("from SysPost where 1=1 ");
		List<Object> paras = new ArrayList<Object>();
		HqlUtils.createHql(hql, paras, query);
		return jpaDao.search(hql.toString(), paras, SysPost.class, query.getPage());
	}

	@Override
	public List<SysPost> selectPostsByUserId(String userId) {
		String hql = "select p from SysPost p, SysUserPost up where up.postId = p.id and p.status != '2' and up.userId = ? ";
		List<SysPost> userPosts = jpaDao.search(hql, userId, SysPost.class);
		Query<SysPost> query = new Query<SysPost>();
		query.setEntity(new SysPost());
		List<SysPost> posts = this.selectPostList(query);
		for (SysPost post : posts) {
			for (SysPost userRole : userPosts) {
				if (post.getId().equals(userRole.getId())) {
					post.setFlag(true);
					break;
				}
			}
		}
		return posts;
	}

	@Override
	public SysPost selectPostById(String postId) {
		return jpaDao.find(SysPost.class, postId);
	}

	@Override
	@Transactional
	public void deletePostByIds(String[] ids) {
		for (String postId : ids) {
			int count = jpaDao.count("from SysUserPost where postId = ? ", postId);
			if (count > 0) {
				throw new BaseException("删除岗位失败，岗位已分配，不能删除");
			}
		}
		jpaDao.delete(SysPost.class, ids);
	}

	@Override
	@Transactional
	public void insertPost(SysPost post) {
		if (this.checkPostNameUnique(post)) {
			throw new BaseException("新增岗位【" + post.getPostName() + "】失败，岗位名称已存在");
		} else if (this.checkPostCodeUnique(post)) {
			throw new BaseException("新增岗位【" + post.getPostName() + "】失败，岗位编码已存在");
		}
		post.setCreateBy(ShiroUtils.getLoginName());
		post.setCreateTime(new Date());
		jpaDao.save(post);
	}

	@Override
	@Transactional
	public void updatePost(SysPost post) {
		if (this.checkPostNameUnique(post)) {
			throw new BaseException("修改岗位【" + post.getPostName() + "】失败，岗位名称已存在");
		} else if (this.checkPostCodeUnique(post)) {
			throw new BaseException("修改岗位【" + post.getPostName() + "】失败，岗位编码已存在");
		}
		post.setUpdateBy(ShiroUtils.getLoginName());
		post.setUpdateTime(new Date());
		jpaDao.update(post);
	}

	@Override
	public boolean checkPostNameUnique(SysPost post) {
		List<Object> paras = new ArrayList<Object>();
		String hql = "from SysPost where postName = ? ";
		paras.add(post.getPostName());
		if(StringUtils.isNotEmpty(post.getId())){
			hql += "and id != ? ";
			paras.add(post.getId());
		}
		SysPost sysPost = jpaDao.find(hql, paras, SysPost.class);
		if (null != sysPost) {
			return Constants.NOT_UNIQUE;
		}
		return Constants.IS_UNIQUE;
	}

	@Override
	public boolean checkPostCodeUnique(SysPost post){
		List<Object> paras = new ArrayList<Object>();
		String hql = "from SysPost where postCode = ? ";
		paras.add(post.getPostCode());
		if(StringUtils.isNotEmpty(post.getId())){
			hql += "and id != ? ";
			paras.add(post.getId());
		}
		SysPost sysPost = jpaDao.find(hql, paras, SysPost.class);
		if (null != sysPost) {
			return Constants.NOT_UNIQUE;
		}
		return Constants.IS_UNIQUE;
	}
}
