package com.daffodil.flowable.entity;

import java.util.Date;

import org.flowable.engine.history.HistoricProcessInstance;

import com.daffodil.core.entity.BaseEntity;
import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 历史流程信息
 * @author yweijian
 * @date 2020年2月13日
 * @version 1.0
 */
public class ActCnHistoricProcess extends BaseEntity{

	private static final long serialVersionUID = 1L;

	/** 任务名称 */
	private String name;

	/** 任务描述 */
	private String description;

	/** 业务ID */
	private String businessKey;

	/** 流程发起人 */
	private String startUserId;

	/** 所属流程部署ID */
	private String deployId;

	/** 所属租户ID */
	private String tenantId;

	/** 流程实例ID */
	private String processId;

	/** 流程实例名称 */
	private String processName;

	/** 流程实例标识 */
	private String processKey;

	/** 流程实例版本 */
	private Integer processVersion;

	/** 任务开始时间 */
	private Date startTime;

	/** 任务结束时间 */
	private Date endTime;

	/** 任务状态（0在办 1已办结 2已删除） */
	private String status;

	/** 删除原因 */
	private String deleteReason;
	
	/** 回调标识，一般即为JQuery函数名称 */
	private String callbackId;
	
	/** 回调类型，默认为JQueryFunction */
	private String callbackType;

	@Override
	public String getId() {
		return super.getId();
	}

	@Override
	public void setId(String id) {
		super.setId(id);
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getBusinessKey() {
		return businessKey;
	}

	public void setBusinessKey(String businessKey) {
		this.businessKey = businessKey;
	}

	public String getStartUserId() {
		return startUserId;
	}

	public void setStartUserId(String startUserId) {
		this.startUserId = startUserId;
	}

	public String getDeployId() {
		return deployId;
	}

	public void setDeployId(String deployId) {
		this.deployId = deployId;
	}

	public String getTenantId() {
		return tenantId;
	}

	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}

	public String getProcessId() {
		return processId;
	}

	public void setProcessId(String processId) {
		this.processId = processId;
	}

	public String getProcessName() {
		return processName;
	}

	public void setProcessName(String processName) {
		this.processName = processName;
	}

	public String getProcessKey() {
		return processKey;
	}

	public void setProcessKey(String processKey) {
		this.processKey = processKey;
	}

	public Integer getProcessVersion() {
		return processVersion;
	}

	public void setProcessVersion(Integer processVersion) {
		this.processVersion = processVersion;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	/** 任务状态（0在办 1已办 2删除） */
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDeleteReason() {
		return deleteReason;
	}

	public void setDeleteReason(String deleteReason) {
		this.deleteReason = deleteReason;
	}

	public String getCallbackId() {
		return callbackId;
	}

	public void setCallbackId(String callbackId) {
		this.callbackId = callbackId;
	}

	public String getCallbackType() {
		return callbackType;
	}

	public void setCallbackType(String callbackType) {
		this.callbackType = callbackType;
	}

	public ActCnHistoricProcess() {
		super();
	}

	/**
	 * 打包封装流程任务对象
	 * @return
	 */
	public ActCnHistoricProcess(HistoricProcessInstance hpi){
		this.setId(hpi.getId());
		name = hpi.getName();
		description = hpi.getDescription();
		businessKey = hpi.getBusinessKey();
		startUserId = hpi.getStartUserId();
		deployId = hpi.getDeploymentId();
		tenantId = hpi.getTenantId();
		processId = hpi.getProcessDefinitionId();
		processKey = hpi.getProcessDefinitionKey();
		processName = hpi.getProcessDefinitionName();
		processVersion = hpi.getProcessDefinitionVersion();
		startTime = hpi.getStartTime();
		endTime = hpi.getEndTime();
		deleteReason = hpi.getDeleteReason();
		callbackId = hpi.getCallbackId();
		callbackType = hpi.getCallbackType();
	}
}
