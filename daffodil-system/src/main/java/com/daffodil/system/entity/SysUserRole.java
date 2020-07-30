package com.daffodil.system.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.daffodil.core.entity.BaseEntity;

/**
 * 用户和角色关联
 * 
 * @author yweijian
 * @date 2019年8月15日
 * @version 1.0
 */
@Entity
@Table(name = "sys_user_role")
public class SysUserRole extends BaseEntity {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/** 用户ID */
	private String userId;

	/** 角色ID */
	private String roleId;
	
	/** 用户和角色关联编号 */
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

	@Column(name = "role_id")
	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
}
