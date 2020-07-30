package com.daffodil.flowable.entity;

import java.util.Date;

import org.flowable.engine.repository.Deployment;

import com.daffodil.core.entity.BaseEntity;
import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 流程部署信息
 * 
 * @author yweijian
 * @date 2020年2月11日
 * @version 1.0
 */
public class ActCnDeployment extends BaseEntity {

	private static final long serialVersionUID = 1L;
	
	/** 流程部署ID */
	private String deployId;

	/** 流程名称 */
	private String name;

	/** 流程类型 */
	private String category;
	
	/** 流程标识 */
	private String modelKey;

	/** 部署时间 */
	private Date deployTime;
	
	/** 流程类型编号(租户ID) */
	private String tenantId;

	public ActCnDeployment() {
		super();
	}

	public ActCnDeployment(Deployment deployment) {
		this.setId(deployment.getId());
		deployId = deployment.getId();
		name = deployment.getName();
		category = deployment.getCategory();
		modelKey = deployment.getKey();
		deployTime = deployment.getDeploymentTime();
		tenantId = deployment.getTenantId();
	}

	@Override
	public String getId() {
		return super.getId();
	}

	@Override
	public void setId(String id) {
		super.setId(id);
	}
	
	public String getDeployId() {
		return deployId;
	}

	public void setDeployId(String deployId) {
		this.deployId = deployId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getModelKey() {
		return modelKey;
	}

	public void setModelKey(String modelKey) {
		this.modelKey = modelKey;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getDeployTime() {
		return deployTime;
	}

	public void setDeployTime(Date deployTime) {
		this.deployTime = deployTime;
	}

	public String getTenantId() {
		return tenantId;
	}

	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}

}
