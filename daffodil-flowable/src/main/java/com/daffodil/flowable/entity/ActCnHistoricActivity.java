package com.daffodil.flowable.entity;

import java.util.Date;
import java.util.ListIterator;

import org.flowable.engine.history.HistoricActivityInstance;
import org.flowable.engine.task.Comment;

import com.daffodil.core.entity.BaseEntity;
import com.daffodil.util.StringUtils;
import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 历史环节信息
 * @author yweijian
 * @date 2020年1月20日
 * @version 1.0
 */
public class ActCnHistoricActivity extends BaseEntity{

	private static final long serialVersionUID = 1L;
	
	private String activityId;

	/** 环节名称 */
	private String activityName;

	private String activityType;

	private String processInstanceId;

	private String executionId;

	private String taskId;

	private String tenantId;

	/** 执行人 */
	private String assignee;

	private Date startTime;

	private Date endTime;

	private String deleteReason;
	
	/** 办理意见 */
	private String comment;

	@Override
	public String getId() {
		return super.getId();
	}

	@Override
	public void setId(String id) {
		super.setId(id);
	}

	public String getActivityId() {
		return activityId;
	}

	public void setActivityId(String activityId) {
		this.activityId = activityId;
	}

	public String getActivityName() {
		return activityName;
	}

	public void setActivityName(String activityName) {
		this.activityName = activityName;
	}

	public String getActivityType() {
		return activityType;
	}

	public void setActivityType(String activityType) {
		this.activityType = activityType;
	}

	public String getProcessInstanceId() {
		return processInstanceId;
	}

	public void setProcessInstanceId(String processInstanceId) {
		this.processInstanceId = processInstanceId;
	}

	public String getExecutionId() {
		return executionId;
	}

	public void setExecutionId(String executionId) {
		this.executionId = executionId;
	}

	public String getTaskId() {
		return taskId;
	}

	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}

	public String getTenantId() {
		return tenantId;
	}

	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}

	public String getAssignee() {
		return assignee;
	}

	public void setAssignee(String assignee) {
		this.assignee = assignee;
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

	public String getDeleteReason() {
		return deleteReason;
	}

	public void setDeleteReason(String deleteReason) {
		this.deleteReason = deleteReason;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public ActCnHistoricActivity() {
		super();
	}

	public ActCnHistoricActivity(HistoricActivityInstance hai, ListIterator<Comment> it){
		this.setId(hai.getId());
		activityId = hai.getActivityId();
		activityName = hai.getActivityName();
		activityType = hai.getActivityType();
		if("startEvent".equals(activityType)) {//开始节点
			activityName = StringUtils.isEmpty(activityName) ? "开始" : activityName;
		}
		if("endEvent".equals(activityType)) {//结束节点
			activityName = StringUtils.isEmpty(activityName) ? "结束" : activityName;
		}
		if("userTask".equals(activityType)) {//用户任务节点
			activityName = StringUtils.isEmpty(activityName) ? "用户任务" : activityName;
		}
		processInstanceId = hai.getProcessInstanceId();
		taskId = hai.getTaskId();
		executionId = hai.getExecutionId();
		tenantId = hai.getTenantId();
		assignee = hai.getAssignee();
		startTime = hai.getStartTime();
		endTime = hai.getEndTime();
		deleteReason = hai.getDeleteReason();
		if(it != null) {
			while (it.hasNext()) {
				comment += it.next().getFullMessage();
				comment = comment.replace("null", "");//null字符串的坑
				comment = comment.replace("NULL", "");
			}
		}
	}
}
