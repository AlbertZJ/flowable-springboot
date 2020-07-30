package com.daffodil.flowable.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.daffodil.core.entity.BaseEntity;

/**
 * 用户绑定流程关系表
 * @author yweijian
 * @date 2020年2月11日
 * @version 1.0
 */
@Entity
@Table(name = "act_cn_flow_user")
public class ActCnFlowUser extends BaseEntity{

	private static final long serialVersionUID = 1L;
	
	/** 用户ID */
	private String userId;
	
	/** 流程类型ID */
	private String flowTypeId;
	
	/** 部署ID（发布） */
	private String deployId;
	
	/** 流程标识 */
	private String modelKey;
	
	/** 状态 */
	private String status;

	@Id
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	@Column(name = "model_user_id")
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

	@Column(name = "flow_type_id")
	public String getFlowTypeId() {
		return flowTypeId;
	}

	public void setFlowTypeId(String flowTypeId) {
		this.flowTypeId = flowTypeId;
	}

	@Column(name = "deploy_id")
	public String getDeployId() {
		return deployId;
	}
	
	public void setDeployId(String deployId) {
		this.deployId = deployId;
	}
	
	@Column(name = "model_key")
	public String getModelKey() {
		return modelKey;
	}

	public void setModelKey(String modelKey) {
		this.modelKey = modelKey;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
}
