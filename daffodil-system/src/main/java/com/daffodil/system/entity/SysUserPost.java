package com.daffodil.system.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.daffodil.core.entity.BaseEntity;

/**
 * 用户和岗位关联
 * 
 * @author yweijian
 * @date 2019年8月15日
 * @version 1.0
 */
@Entity
@Table(name = "sys_user_post")
public class SysUserPost extends BaseEntity {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/** 用户ID */
	private String userId;

	/** 岗位ID */
	private String postId;

	/** 角用户和岗位关联编号 */
	@Id
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	@Column(name = "user_post_id")
	@Override
	public String getId() {
		return super.getId();
	}
	
	@Column(name = "user_id")
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Column(name = "post_id")
	public String getPostId() {
		return postId;
	}

	public void setPostId(String postId) {
		this.postId = postId;
	}

}
