package com.daffodil.flowable.service.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;
import java.util.Set;

import org.flowable.bpmn.constants.BpmnXMLConstants;
import org.flowable.engine.ProcessEngine;
import org.flowable.engine.history.HistoricActivityInstance;
import org.flowable.engine.history.HistoricProcessInstance;
import org.flowable.engine.history.HistoricProcessInstanceQuery;
import org.flowable.engine.runtime.Execution;
import org.flowable.engine.runtime.ProcessInstance;
import org.flowable.engine.task.Comment;
import org.flowable.task.api.Task;
import org.flowable.task.api.history.HistoricTaskInstance;
import org.flowable.task.api.history.HistoricTaskInstanceQuery;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.daffodil.core.dao.JdbcDao;
import com.daffodil.core.entity.Page;
import com.daffodil.core.entity.Query;
import com.daffodil.core.exception.BaseException;
import com.daffodil.flowable.entity.ActCnHistoricActivity;
import com.daffodil.flowable.entity.ActCnHistoricProcess;
import com.daffodil.flowable.service.IFlowableHandleService;
import com.daffodil.flowable.util.FlowableUtils;
import com.daffodil.framework.shiro.util.ShiroUtils;
import com.daffodil.util.StringUtils;

/**
 * 通用流程办理实现
 * 
 * @author yweijian
 * @date 2020年1月16日
 * @version 1.0
 */
@Service
public class FlowableHandleServiceImpl implements IFlowableHandleService {

	private static final Logger LOGGER = LoggerFactory.getLogger(FlowableHandleServiceImpl.class);

	@Autowired
	private ProcessEngine processEngine;

	@Autowired
	private JdbcDao jdbcDao;

	@Override
	@Transactional
	public void generalDirectHandle(String businessKey, String userId, String handleId, String message,
			String attachmentName, String attachmentDescription, MultipartFile attachmentFile) {
		// 获取当前任务
		Task task = FlowableUtils.getCurrentTask(businessKey, userId);
		// 保存意见表
		processEngine.getIdentityService().setAuthenticatedUserId(ShiroUtils.getLoginName());
		if(StringUtils.isNotEmpty(message)) {
			processEngine.getTaskService().addComment(task.getId(), task.getProcessInstanceId(), message);
		}

		// 保存附件表-后面实现
		if (null != attachmentFile) {
			try {
				processEngine.getTaskService().createAttachment(attachmentFile.getContentType(), task.getId(),
						task.getProcessInstanceId(), attachmentName, attachmentDescription,
						attachmentFile.getInputStream());
			} catch (IOException e) {
				LOGGER.warn("流程办理附件保存失败");
			}
		}

		Map<String, Object> handleVariables = FlowableUtils.getNextHandleVariables(businessKey, userId, handleId);//新
		Map<String, Object> processVariables = task.getProcessVariables();//旧
		Map<String, Object> variables = new HashMap<String, Object>();
		if(StringUtils.isNotNull(processVariables)){
			variables.putAll(processVariables);
		}
		if(StringUtils.isNotNull(handleVariables)){
			variables.putAll(handleVariables);
		}
		// 保存结束任务，并会新开启下一个任务
		processEngine.getTaskService().complete(task.getId(), variables);
	}

	@Override
	@Transactional
	public void changeTaskAssignee(String businessKey, String nodeId, String userId) {
		Task task = processEngine.getTaskService().createTaskQuery().processInstanceBusinessKey(businessKey)
				.taskDefinitionKey(nodeId).active().singleResult();
		// 设置下一步任务操作人员,若任务不存在即该流程任务结束了
		if(StringUtils.isNotNull(task) && task.getTaskDefinitionKey().equals(nodeId)) {
			processEngine.getTaskService().setAssignee(task.getId(), userId); 
		}
	}

	@Override
	@Transactional
	public void deleteProcessInstance(String businessKey) {
		ProcessInstance instance = processEngine.getRuntimeService().createProcessInstanceQuery().processInstanceBusinessKey(businessKey).singleResult();
		if(null != instance){
			processEngine.getRuntimeService().deleteProcessInstance(instance.getId(), "作废");
		}
	}

	@Override
	@Transactional
	public void backProcessInstance(String businessKey, String userId) {

		//撤办任务一定是当前这个用户最近的一次完成的任务
		try {
			HistoricTaskInstance taskInstance = processEngine.getHistoryService().createHistoricTaskInstanceQuery().processInstanceBusinessKey(businessKey)
					.taskAssignee(userId).orderByHistoricTaskInstanceEndTime().desc().list().iterator().next();

			this.moveExecutionsToSingleActivityId(businessKey, taskInstance.getProcessInstanceId(), taskInstance.getTaskDefinitionKey(), userId, taskInstance.getAssignee(), "撤办");
		}catch (Exception e) {
			throw new BaseException("撤办失败，当前任务节点不允许撤办");
		}
	}

	@Override
	@Transactional
	public void rejectProcessInstance(String businessKey, String message, String userId) {
		try {
			ProcessInstance processInstance = processEngine.getRuntimeService().createProcessInstanceQuery()
					.processInstanceBusinessKey(businessKey).active().singleResult();

			//驳回任务一定是当前流程发起人第一次完成的任务节点
			HistoricTaskInstance taskInstance = processEngine.getHistoryService().createHistoricTaskInstanceQuery().processInstanceBusinessKey(businessKey)
					.taskAssignee(processInstance.getStartUserId()).orderByHistoricTaskInstanceEndTime().asc().list().iterator().next();

			message = StringUtils.isNotEmpty(message) ? ("驳回，" + message) : "驳回";

			this.moveExecutionsToSingleActivityId(businessKey, taskInstance.getProcessInstanceId(), taskInstance.getTaskDefinitionKey(), userId, processInstance.getStartUserId(), message);
		}catch (Exception e) {
			throw new BaseException("驳回失败，当前任务节点不允许驳回");
		}
	}

	@Override
	public List<ActCnHistoricProcess> selectUnfinishedProcessList(Query<ActCnHistoricProcess> query) {
		return this.selectHistoricProcessList(query, false);
	}

	@Override
	public List<ActCnHistoricProcess> selectFinishedProcessList(Query<ActCnHistoricProcess> query) {
		return this.selectHistoricProcessList(query, true);
	}

	@Override
	public List<ActCnHistoricProcess> selectCompleteProcessList(Query<ActCnHistoricProcess> query) {
		List<ActCnHistoricProcess> datas = null;
		List<HistoricProcessInstance> list = null;
		HistoricProcessInstanceQuery processQuery = processEngine.getHistoryService()
				.createHistoricProcessInstanceQuery();
		if (StringUtils.isNotEmpty(query.getEntity().getName())) {
			processQuery.processInstanceNameLike("%" + query.getEntity().getName() + "%");
		}
		if (StringUtils.isNotNull(query.getPage())) {
			Page page = query.getPage();
			page.setTotalRow((int) processQuery.count());
			list = processQuery.finished().orderByProcessInstanceStartTime().desc().listPage(page.getFromIndex(),
					page.getPageSize());
		} else {
			list = processQuery.finished().orderByProcessInstanceStartTime().desc().list();
		}
		if (StringUtils.isNotEmpty(list)) {
			datas = new ArrayList<ActCnHistoricProcess>();
			for (int i = 0; i < list.size(); i++) {
				HistoricProcessInstance hpi = list.get(i);
				ActCnHistoricProcess hp = new ActCnHistoricProcess(hpi);
				datas.add(hp);
			}
		}
		return datas;
	}

	@Override
	public List<ActCnHistoricProcess> selectMyselfProcessList(Query<ActCnHistoricProcess> query, boolean taskIsFinished, boolean processIsfinished) {

		List<HistoricTaskInstance> tasks = null;
		List<ActCnHistoricProcess> datas = null;
		List<HistoricProcessInstance> list = null;
		Set<String> processInstanceIds = new HashSet<String>();
		HistoricTaskInstanceQuery taskQuery = processEngine.getHistoryService().createHistoricTaskInstanceQuery();
		HistoricProcessInstanceQuery processQuery = processEngine.getHistoryService()
				.createHistoricProcessInstanceQuery().startedBy(ShiroUtils.getLoginName());

		if (!taskIsFinished && !processIsfinished) {// 环节待办，流程未结束
			tasks = taskQuery.taskAssignee(ShiroUtils.getLoginName()).unfinished().processUnfinished().list();
		} else if (taskIsFinished && !processIsfinished) {// 环节已办，流程未结束
			tasks = taskQuery.finished().processUnfinished().list();
		} else if (taskIsFinished && processIsfinished) {// 环节已办，流程结束
			tasks = taskQuery.finished().processFinished().list();
		}

		if (StringUtils.isNotEmpty(tasks)) {
			for (int i = 0; i < tasks.size(); i++) {
				HistoricTaskInstance task = tasks.get(i);
				processInstanceIds.add(task.getProcessInstanceId());
			}
		}

		// 从指定的未完成任务且流程未结束的流程实例ID中查询，如果没有则结束查询
		if (StringUtils.isNotEmpty(processInstanceIds)) {
			processQuery.processInstanceIds(processInstanceIds);
		} else {
			return datas;
		}
		if (StringUtils.isNotEmpty(query.getEntity().getName())) {
			processQuery.processInstanceNameLike("%" + query.getEntity().getName() + "%");
		}
		if (StringUtils.isNotNull(query.getPage())) {
			Page page = query.getPage();
			page.setTotalRow((int) processQuery.count());
			list = processQuery.orderByProcessInstanceStartTime().desc().listPage(page.getFromIndex(),
					page.getPageSize());
		} else {
			list = processQuery.orderByProcessInstanceStartTime().desc().list();
		}
		if (StringUtils.isNotEmpty(list)) {
			datas = new ArrayList<ActCnHistoricProcess>();
			for (int i = 0; i < list.size(); i++) {
				HistoricProcessInstance hpi = list.get(i);
				ActCnHistoricProcess hp = new ActCnHistoricProcess(hpi);
				datas.add(hp);
			}
		}
		return datas;
	}

	/**
	 * 查询历史流程任务
	 * @param query
	 * @param taskIsFinished
	 * @return
	 */
	private List<ActCnHistoricProcess> selectHistoricProcessList(Query<ActCnHistoricProcess> query, boolean taskIsFinished) {
		List<HistoricTaskInstance> tasks = null;
		List<ActCnHistoricProcess> datas = null;
		List<HistoricProcessInstance> list = null;
		Set<String> processInstanceIds = new HashSet<String>();
		HistoricTaskInstanceQuery taskQuery = processEngine.getHistoryService().createHistoricTaskInstanceQuery();
		HistoricProcessInstanceQuery processQuery = processEngine.getHistoryService()
				.createHistoricProcessInstanceQuery();

		if (!taskIsFinished && !ShiroUtils.isAdmin()) {// 环节待办
			tasks = taskQuery.taskAssignee(ShiroUtils.getLoginName()).unfinished().processUnfinished().list();
		} else if (taskIsFinished && !ShiroUtils.isAdmin()) {// 环节已办
			tasks = taskQuery.taskAssignee(ShiroUtils.getLoginName()).finished().list();
		} else if (!taskIsFinished && ShiroUtils.isAdmin()) {// 环节待办，管理员
			tasks = taskQuery.unfinished().processUnfinished().list();
		} else if (taskIsFinished && ShiroUtils.isAdmin()) {// 环节已办，管理员
			tasks = taskQuery.finished().list();
		}

		if (StringUtils.isNotEmpty(tasks)) {
			for (int i = 0; i < tasks.size(); i++) {
				HistoricTaskInstance task = tasks.get(i);
				// 排除自己发起，自己提交的任务流程
				HistoricProcessInstance instance = processEngine.getHistoryService()
						.createHistoricProcessInstanceQuery().processInstanceId(task.getProcessInstanceId())
						.singleResult();
				if (null != instance && instance.getStartUserId().equals(ShiroUtils.getLoginName())) {
					continue;
				}
				processInstanceIds.add(task.getProcessInstanceId());
			}
		}
		// 从指定的未完成任务且流程未结束的流程实例ID中查询，如果没有则结束查询
		if (StringUtils.isNotEmpty(processInstanceIds)) {
			processQuery.processInstanceIds(processInstanceIds);
		} else {
			return datas;
		}
		if (StringUtils.isNotEmpty(query.getEntity().getName())) {
			processQuery.processInstanceNameLike("%" + query.getEntity().getName() + "%");
		}
		if (StringUtils.isNotNull(query.getPage())) {
			Page page = query.getPage();
			page.setTotalRow((int) processQuery.count());
			list = processQuery.orderByProcessInstanceStartTime().desc().listPage(page.getFromIndex(),
					page.getPageSize());
		} else {
			list = processQuery.orderByProcessInstanceStartTime().desc().list();
		}
		if (StringUtils.isNotEmpty(list)) {
			datas = new ArrayList<ActCnHistoricProcess>();
			for (int i = 0; i < list.size(); i++) {
				HistoricProcessInstance hpi = list.get(i);
				ActCnHistoricProcess hp = new ActCnHistoricProcess(hpi);
				datas.add(hp);
			}
		}

		return datas;
	}

	@Override
	public List<ActCnHistoricActivity> selectHistoricActivityByBusinessKey(String businessKey) {
		List<ActCnHistoricActivity> datas = new ArrayList<ActCnHistoricActivity>();
		HistoricProcessInstance instance = processEngine.getHistoryService().createHistoricProcessInstanceQuery()
				.processInstanceBusinessKey(businessKey).singleResult();
		if (null == instance) {
			return datas;
		}
		Set<String> activityTypes = new HashSet<String>();
		activityTypes.add(BpmnXMLConstants.ELEMENT_EVENT_START);
		activityTypes.add(BpmnXMLConstants.ELEMENT_TASK_USER);
		activityTypes.add(BpmnXMLConstants.ELEMENT_EVENT_END);
		List<HistoricActivityInstance> list = processEngine.getHistoryService().createHistoricActivityInstanceQuery()
				.processInstanceId(instance.getId())
				.activityTypes(activityTypes)
				.orderByHistoricActivityInstanceStartTime().asc().list();
		if (StringUtils.isNotEmpty(list)) {
			for (int i = 0; i < list.size(); i++) {
				HistoricActivityInstance hai = list.get(i);
				ListIterator<Comment> it = processEngine.getTaskService().getTaskComments(hai.getTaskId()).listIterator();
				ActCnHistoricActivity ha = new ActCnHistoricActivity(hai, it);
				datas.add(ha);
			}
		}
		return datas;
	}

	/**
	 * 执行跳转
	 * @param businessKey 业务ID
	 * @param processInstanceId 流程实例ID
	 * @param targetActivityId 跳转目标节点
	 * @param currentUserId 当前操作用户
	 * @param originalUserId 原始操作用户
	 * @param message 内容消息（操作原因）
	 */
	private void moveExecutionsToSingleActivityId(String businessKey, String processInstanceId, String targetActivityId, String currentUserId, String originalUserId, String message) {

		List<Execution> executions = processEngine.getRuntimeService().createExecutionQuery().processInstanceId(processInstanceId).parentId(processInstanceId).list();

		//执行跳转，是当前正在执行的节点到目标节点
		List<String> moveExecutionIds = new ArrayList<String>();
		for(Execution execution : executions) {
			moveExecutionIds.add(execution.getId());
		}
		processEngine.getRuntimeService().createChangeActivityStateBuilder().processInstanceId(processInstanceId)
			.moveExecutionsToSingleActivityId(moveExecutionIds, targetActivityId).changeState();

		//更新当前节点任务删除原因
		for(Execution execution : executions) {
			try {
				HistoricTaskInstance historicTaskInstance = processEngine.getHistoryService().createHistoricTaskInstanceQuery().processInstanceBusinessKey(businessKey)
						.processInstanceId(execution.getProcessInstanceId())
						.executionId(execution.getId())
						.taskDefinitionKey(execution.getActivityId())
						.orderByTaskCreateTime().desc().list().iterator().next();

				String sql = "update act_hi_actinst set delete_reason_=?,assignee_=? where proc_inst_id_=? and execution_id_=? and act_id_=? and task_id_=?";
				List<Object> paras = new ArrayList<Object>();
				paras.add(message);
				paras.add(currentUserId);//操作人
				paras.add(execution.getProcessInstanceId());
				paras.add(execution.getId());
				paras.add(execution.getActivityId());
				paras.add(historicTaskInstance.getId());
				jdbcDao.execute(sql, paras);

			}catch (Exception e) {
				throw new BaseException("操作失败，存在用户分支任务还未汇流");
			}
		}

		//将当前新的节点的任务执行人设置为当前用户
		Task currentTask = processEngine.getTaskService().createTaskQuery().processInstanceBusinessKey(businessKey).processInstanceId(processInstanceId).active().singleResult();
		if("$INITIATOR".equals(currentTask.getAssignee()) || StringUtils.isEmpty(currentTask.getAssignee())) {
			processEngine.getTaskService().setAssignee(currentTask.getId(), originalUserId);
		}
	}

}