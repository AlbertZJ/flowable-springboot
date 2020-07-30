package com.daffodil.flowable.util;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.StringTokenizer;

import javax.annotation.PostConstruct;

import org.flowable.bpmn.model.BpmnModel;
import org.flowable.bpmn.model.EndEvent;
import org.flowable.bpmn.model.ExclusiveGateway;
import org.flowable.bpmn.model.FlowElement;
import org.flowable.bpmn.model.FlowNode;
import org.flowable.bpmn.model.Gateway;
import org.flowable.bpmn.model.InclusiveGateway;
import org.flowable.bpmn.model.ParallelGateway;
import org.flowable.bpmn.model.SequenceFlow;
import org.flowable.bpmn.model.StartEvent;
import org.flowable.bpmn.model.UserTask;
import org.flowable.common.engine.impl.de.odysseus.el.ExpressionFactoryImpl;
import org.flowable.common.engine.impl.de.odysseus.el.util.SimpleContext;
import org.flowable.common.engine.impl.javax.el.ExpressionFactory;
import org.flowable.common.engine.impl.javax.el.ValueExpression;
import org.flowable.engine.ProcessEngine;
import org.flowable.engine.impl.persistence.entity.ExecutionEntity;
import org.flowable.engine.runtime.ProcessInstance;
import org.flowable.engine.runtime.ProcessInstanceBuilder;
import org.flowable.task.api.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.daffodil.core.entity.Query;
import com.daffodil.core.exception.BaseException;
import com.daffodil.flowable.service.IFlowableAccountService;
import com.daffodil.framework.shiro.util.ShiroUtils;
import com.daffodil.system.entity.SysUser;
import com.daffodil.util.StringUtils;

/**
 * 流程辅助工具集合
 * 
 * @author yweijian
 * @date 2020年1月14日
 * @version 1.0
 */
@Component
public class FlowableUtils {

	private static String[] chart = { " ", "$", "{", "}", "(", ")", "'", "\"", "||", "&&", ">", "<", "==", ">=", "<=", "!=" };

	private static ProcessEngine processEngine;

	private static IFlowableAccountService accountService;

	@Autowired
	private ProcessEngine processEngineService;

	@Autowired
	private IFlowableAccountService flowableAccountService;

	@PostConstruct
	public void init() {
		processEngine = this.processEngineService;
		accountService = this.flowableAccountService;
	}

	/**
	 * 获取当前用户正在进行的任务
	 * @param businessKey
	 * @param userId
	 * @return
	 */
	public static Task getCurrentTask(String businessKey, String userId) {
		try{
			Task task = processEngine.getTaskService().createTaskQuery().processInstanceBusinessKey(businessKey)
					.includeProcessVariables()
					.active()
					.taskAssignee(userId)
					.singleResult();
			return task;
		}catch (Exception e) {
			throw new BaseException("流程任务获取失败，请联系管理员");
		}
	}
	
	/**
	 * 获取当前激活正在进行的任务
	 * @param businessKey
	 * @return
	 */
	public static List<Task> getCurrentTask(String businessKey) {
		try{
			List<Task> tasks = processEngine.getTaskService().createTaskQuery().processInstanceBusinessKey(businessKey)
					.includeProcessVariables()
					.active()
					.list();
			return tasks;
		}catch (Exception e) {
			throw new BaseException("流程任务获取失败，请联系管理员");
		}
	}

	/**
	 * 获取当前用户正在进行的任务的出去的流程线
	 * @param businessKey
	 * @param userId
	 * @return
	 */
	public static List<SequenceFlow> getOutSequenceFlow(String businessKey, String userId) {
		Task task = getCurrentTask(businessKey, userId);
		return getOutSequenceFlow(task);
	}
	
	/**
	 * 获取任务的出去的流程线
	 * @param task
	 * @return
	 */
	public static List<SequenceFlow> getOutSequenceFlow(Task task) {
		if (null == task) {
			return null;
		}
		ExecutionEntity execution = (ExecutionEntity) processEngine.getRuntimeService().createExecutionQuery()
				.executionId(task.getExecutionId()).singleResult();
		BpmnModel bpmnModel = processEngine.getRepositoryService().getBpmnModel(task.getProcessDefinitionId());
		FlowNode flowNode = (FlowNode) bpmnModel.getFlowElement(execution.getActivityId());
		return flowNode.getOutgoingFlows();
	}
	
	/**
	 * 获取流程线（不包括网关节点）
	 * @param outgoingFlows
	 * @param resultFlows
	 */
	public static void getOutSequenceFlow(List<SequenceFlow> outgoingFlows, List<SequenceFlow> resultFlows){
		if(StringUtils.isEmpty(outgoingFlows) || StringUtils.isNull(resultFlows)) {
			return;
		}
		for(SequenceFlow sequenceFlow : outgoingFlows) {
			resultFlows.add(sequenceFlow);
			if(isGatewayNode(sequenceFlow.getTargetFlowElement())) {
				Gateway gateway = (Gateway)sequenceFlow.getTargetFlowElement();
				List<SequenceFlow> sequenceFlows = gateway.getOutgoingFlows();
				getOutSequenceFlow(sequenceFlows, resultFlows);
			}
		}
	}
	
	/**
	 * 获取当前用户正在进行的任务的进来的流程线
	 * @param businessKey
	 * @param userId
	 * @return
	 */
	public static List<SequenceFlow> getInSequenceFlow(String businessKey, String userId) {
		Task task = getCurrentTask(businessKey, userId);
		return getInSequenceFlow(task);
	}
	
	/**
	 * 获取任务的进来的流程线
	 * @param task
	 * @return
	 */
	public static List<SequenceFlow> getInSequenceFlow(Task task) {
		if (null == task) {
			return null;
		}
		ExecutionEntity execution = (ExecutionEntity) processEngine.getRuntimeService().createExecutionQuery()
				.executionId(task.getExecutionId()).singleResult();
		BpmnModel bpmnModel = processEngine.getRepositoryService().getBpmnModel(task.getProcessDefinitionId());
		FlowNode flowNode = (FlowNode) bpmnModel.getFlowElement(execution.getActivityId());
		return flowNode.getIncomingFlows();
	}

	/**
	 * 获取当前用户任务的流程节点
	 * @param businessKey
	 * @param userId
	 * @return
	 */
	public static FlowElement getCurrentFlowNode(String businessKey, String userId) {
		List<SequenceFlow> outFlows = getOutSequenceFlow(businessKey, userId);
		if (StringUtils.isEmpty(outFlows)) {
			return null;
		}
		return outFlows.get(0).getSourceFlowElement();
	}
	
	/**
	 * 获取任务的流程节点
	 * @param task
	 * @return
	 */
	public static FlowElement getFlowNode(Task task) {
		List<SequenceFlow> outFlows = getOutSequenceFlow(task);
		if (StringUtils.isEmpty(outFlows)) {
			return null;
		}
		return outFlows.get(0).getSourceFlowElement();
	}
	
	/**
	 * 获取当前用户任务的下一个任务节点
	 * @param businessKey
	 * @param userId
	 * @param handleId
	 * @param nodeId 节点ID
	 * @return
	 */
	public static FlowElement getNextFlowNode(String businessKey, String userId, String handleId, String nodeId) {
		List<FlowElement> flowElements = getNextFlowNodes(businessKey, userId, handleId);
		if(StringUtils.isNotEmpty(flowElements)) {
			for(FlowElement flowElement : flowElements) {
				if(StringUtils.isNotNull(nodeId) && nodeId.equals(flowElement.getId())) {
					return flowElement;
				}
			}
		}
		return null;
	}

	/**
	 * 获取当前用户任务的下一个任务节点（可能多个）
	 * @param businessKey
	 * @param userId
	 * @param handleId 操作ID（流程线ID）
	 * @return List[FlowElement]
	 */
	public static List<FlowElement> getNextFlowNodes(String businessKey, String userId, String handleId) {
		List<SequenceFlow> outFlows = getOutSequenceFlow(businessKey, userId);
		return getNextFlowNodes(outFlows, businessKey, userId, handleId);
	}
	
	/**
	 * 获取当前用户任务的下一个任务节点（可能多个）
	 * @param outFlows
	 * @param businessKey
	 * @param userId
	 * @param handleId
	 * @return List[FlowElement]
	 */
	public static List<FlowElement> getNextFlowNodes(List<SequenceFlow> outFlows, String businessKey, String userId, String handleId) {
		if (StringUtils.isEmpty(outFlows) || StringUtils.isEmpty(businessKey) || StringUtils.isEmpty(userId) || StringUtils.isEmpty(handleId)) {
			return null;
		}
		for (SequenceFlow sequenceFlow : outFlows) {
			if (handleId.equals(sequenceFlow.getId())) {
				if (isExclusiveGatewayNode(sequenceFlow.getTargetFlowElement())) {//排他网关
					ExclusiveGateway exclusiveGateway = (ExclusiveGateway) sequenceFlow.getTargetFlowElement();
					List<SequenceFlow> gatewayOutFlows = exclusiveGateway.getOutgoingFlows();
					Map<String, Object> processVariables = getCurrentTask(businessKey, userId).getProcessVariables();
					
					if(StringUtils.isEmpty(processVariables)){//没有变量附加值,获取默认取第一条
						return getNextFlowNodes(gatewayOutFlows, businessKey, userId, gatewayOutFlows.get(0).getId());
					}else{
						for(SequenceFlow gatewayOutFlow : gatewayOutFlows){
							String conditionExpression = gatewayOutFlow.getConditionExpression();
							if(checkConditionExpression(conditionExpression, processVariables)){//匹配到符合条件的输出流方向
								return getNextFlowNodes(gatewayOutFlows, businessKey, userId, gatewayOutFlow.getId());
							}
						}
					}
				} else if (isParallelGatewayNode(sequenceFlow.getTargetFlowElement())){//并行网关
					ParallelGateway parallelGateway = (ParallelGateway) sequenceFlow.getTargetFlowElement();
					List<SequenceFlow> gatewayOutFlows = parallelGateway.getOutgoingFlows();
					List<FlowElement> nodes = new ArrayList<FlowElement>();
					for(SequenceFlow gatewayOutFlow : gatewayOutFlows) {
						List<FlowElement> nextNodes = getNextFlowNodes(gatewayOutFlows, businessKey, userId, gatewayOutFlow.getId());
						nodes.addAll(nextNodes);
					}
					return nodes;
				} else if(isInclusiveGatewayNode(sequenceFlow.getTargetFlowElement())){//包容网关
					InclusiveGateway inclusiveGateway = (InclusiveGateway) sequenceFlow.getTargetFlowElement();
					List<SequenceFlow> gatewayOutFlows = inclusiveGateway.getOutgoingFlows();
					Map<String, Object> processVariables = getCurrentTask(businessKey, userId).getProcessVariables();
					if(StringUtils.isEmpty(processVariables)){//没有变量附加值,则同并行网关
						List<FlowElement> nodes = new ArrayList<FlowElement>();
						for(SequenceFlow gatewayOutFlow : gatewayOutFlows) {
							List<FlowElement> nextNodes = getNextFlowNodes(gatewayOutFlows, businessKey, userId, gatewayOutFlow.getId());
							nodes.addAll(nextNodes);
						}
						return nodes;
					} else {
						List<FlowElement> nodes = new ArrayList<FlowElement>();
						for(SequenceFlow gatewayOutFlow : gatewayOutFlows) {
							String conditionExpression = gatewayOutFlow.getConditionExpression();
							if(checkConditionExpression(conditionExpression, processVariables)){//匹配到符合条件的输出流方向
								List<FlowElement> nextNodes = getNextFlowNodes(gatewayOutFlows, businessKey, userId, gatewayOutFlow.getId());
								nodes.addAll(nextNodes);
							}
						}
						return nodes;
					}
					
				} else {
					List<FlowElement> nodes = new ArrayList<FlowElement>();
					nodes.add(sequenceFlow.getTargetFlowElement());
					return nodes;
				}
			}
		}
		return null;
	}
	
	/** 
	 * 根据conditionExpression和processVariables判断el表达式是否通过信息 
	 * @param conditionExpression el条件表达式
	 * @param processVariables 参数
	 * @return
	 */
	public static boolean checkConditionExpression(String conditionExpression, Map<String, Object> processVariables) {  
		if(StringUtils.isEmpty(conditionExpression)) {//如果条件表达式为空，则true
			return true;
		}
        ExpressionFactory factory = new ExpressionFactoryImpl();    
        SimpleContext context = new SimpleContext();
        Iterator<Entry<String, Object>> it = processVariables.entrySet().iterator();
        while(it.hasNext()){
        	Map.Entry<String, Object> entry = it.next();
        	context.setVariable(entry.getKey(), factory.createValueExpression(entry.getValue(), Object.class)); 
        }
        ValueExpression expression = factory.createValueExpression(context, conditionExpression, boolean.class);    
        return (Boolean) expression.getValue(context);  
    }  

	/**
	 * 获取当前用户任务的下一步的操作动作集合
	 * @param businessKey
	 * @param userId
	 * @return
	 */
	public static List<Map<String, String>> getNextHandles(String businessKey, String userId) {
		List<SequenceFlow> outFlows = getOutSequenceFlow(businessKey, userId);
		if (StringUtils.isEmpty(outFlows)) {
			return null;
		}
		List<Map<String, String>> handles = new ArrayList<Map<String, String>>();
		for (SequenceFlow sequenceFlow : outFlows) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("id", sequenceFlow.getId());
			map.put("name", sequenceFlow.getName());
			handles.add(map);
		}
		return handles;
	}

	/**
	 * 获取当前用户任务的下一步的流转操作条件
	 * @param businessKey
	 * @param userId
	 * @param handleId
	 * @return Map[String, Object]
	 */
	public static Map<String, Object> getNextHandleVariables(String businessKey, String userId, String handleId) {
		List<SequenceFlow> outFlows = getOutSequenceFlow(businessKey, userId);
		if (StringUtils.isEmpty(outFlows)) {
			return null;
		}
		for (SequenceFlow sequenceFlow : outFlows) {
			if (handleId.contentEquals(sequenceFlow.getId())) {
				return formatExpression(sequenceFlow.getConditionExpression());
			}
		}
		return null;
	}

	/**
	 * 条件表达式转换
	 * 
	 * @param expression ${action == '通过' || bction > 0 && cction < 10 && dction != '员工'}
	 * @return Map {action : '通过', bction : 0, cction : 10, dction : '员工'}
	 */
	public static Map<String, Object> formatExpression(String expression) {
		if (StringUtils.isEmpty(expression)) {
			return null;
		}
		List<String> charts = new ArrayList<String>(chart.length);
		Collections.addAll(charts, chart);

		Map<String, Object> map = new HashMap<String, Object>();
		StringTokenizer tokens = new StringTokenizer(expression, "${}()'\", \n\r\f\t", true);
		String key = "", value = "";
		while (tokens.hasMoreTokens()) {
			String token = tokens.nextToken();
			if (!charts.contains(token) && "".equals(key)) {
				key = token;
			} else if (!charts.contains(token) && "".equals(value)) {
				value = token;
			}
			if (!"".equals(key) && !"".equals(value)) {
				map.put(key, value);
				key = "";
				value = "";
			}
		}
		return map;
	}

	/**
	 * 是否是开始节点
	 * 
	 * @param flowElement
	 * @return boolean
	 */
	public static boolean isStartEventNode(FlowElement flowElement) {
		return flowElement instanceof StartEvent;
	}

	/**
	 * 是否是用户任务节点
	 * 
	 * @param flowElement
	 * @return boolean
	 */
	public static boolean isUserTaskNode(FlowElement flowElement) {
		return flowElement instanceof UserTask;
	}

	/**
	 * 是否是网关节点
	 * 
	 * @param flowElement
	 * @return boolean
	 */
	public static boolean isGatewayNode(FlowElement flowElement) {
		return flowElement instanceof Gateway;
	}
	
	/**
	 * 是否是排他网关节点
	 * 
	 * @param flowElement
	 * @return boolean
	 */
	public static boolean isExclusiveGatewayNode(FlowElement flowElement) {
		return flowElement instanceof ExclusiveGateway;
	}
	
	/**
	 * 是否是并行网关节点
	 * 
	 * @param flowElement
	 * @return boolean
	 */
	public static boolean isParallelGatewayNode(FlowElement flowElement) {
		return flowElement instanceof ParallelGateway;
	}
	
	/**
	 * 是否是包容网关节点
	 * @param flowElement
	 * @return
	 */
	public static boolean isInclusiveGatewayNode(FlowElement flowElement) {
		return flowElement instanceof InclusiveGateway;
	}

	/**
	 * 是否是结束节点
	 * 
	 * @param flowElement
	 * @return boolean
	 */
	public static boolean isEndEventNode(FlowElement flowElement) {
		return flowElement instanceof EndEvent;
	}
	
	/**
	 * 获取当前任务节点办理人员 从任务代理人、候选人、候选组选取办理人员
	 * @param businessKey
	 * @param userId
	 * @return
	 */
	public static List<SysUser> getCurrentNodeHandleUsers(String businessKey, String userId) {
		FlowElement flowElement = getCurrentFlowNode(businessKey, userId);
		return getFlowNodeUsers(businessKey, flowElement);
	}
	
	/**
	 * 获取下一任务节点办理人员 从任务代理人、候选人、候选组选取办理人员
	 * @param businessKey
	 * @param userId
	 * @param handleId
	 * @param nodeId
	 * @return
	 */
	public static List<SysUser> getNextNodeHandleUsers(String businessKey, String userId, String handleId, String nodeId){
		FlowElement flowElement = FlowableUtils.getNextFlowNode(businessKey, userId, handleId, nodeId);
		return FlowableUtils.getFlowNodeUsers(businessKey, flowElement);
	}
	
	/**
	 * 获取节点办理人员
	 * @param businessKey 业务ID
	 * @param flowElement 流程节点
	 * @return
	 */
	public static List<SysUser> getFlowNodeUsers(String businessKey, FlowElement flowElement){
		List<SysUser> users = null;
		if (isUserTaskNode(flowElement)) {
			UserTask userTask = (UserTask) flowElement;
			String assignee = userTask.getAssignee();
			// 单用户
			if (StringUtils.isNotEmpty(assignee)) {
				if ("$INITIATOR".equals(assignee)) {// 流程的发起者
					ProcessInstance processInstance = processEngine.getRuntimeService().createProcessInstanceQuery()
							.processInstanceBusinessKey(businessKey).active().singleResult();
					assignee = processInstance.getStartUserId();
				}
				SysUser sysUser = accountService.selectUserByLoginName(assignee);
				if (null != sysUser) {
					users = new ArrayList<SysUser>();
					users.add(sysUser);
					return users;
				}
			}
			// 多用户
			List<String> candidateUsers = userTask.getCandidateUsers();
			if (StringUtils.isNotEmpty(candidateUsers)) {
				Query<SysUser> query = new Query<SysUser>();
				query.setEntity(new SysUser());
				Map<String, Object> params = new HashMap<String, Object>();
				params.put("loginNames", candidateUsers);
				query.setParams(params);
				query.setOrderBy("createTime desc ");
				return accountService.selectUserListByLoginName(query);
			}
			// 多用户角色（组）
			List<String> candidateGroups = userTask.getCandidateGroups();
			if (StringUtils.isNotEmpty(candidateGroups)) {
				Query<SysUser> query = new Query<SysUser>();
				SysUser sysUser = new SysUser();
				sysUser.setRoleIds(candidateGroups.toArray(new String[candidateGroups.size()]));
				query.setEntity(sysUser);
				query.setOrderBy("createTime desc ");
				return accountService.selectUserListByRoleIds(query);
			}
		}
		return users;
	}
	
	/**
	 * 获取流程发起人
	 * @param businessKey
	 * @return
	 */
	public static SysUser getStartUser(String businessKey) {
		ProcessInstance processInstance = processEngine.getRuntimeService().createProcessInstanceQuery()
				.processInstanceBusinessKey(businessKey).active().singleResult();
		if(StringUtils.isNull(processInstance)) {
			return null;
		}
		String assignee = processInstance.getStartUserId();
		SysUser sysUser = accountService.selectUserByLoginName(assignee);
		return sysUser;
	}

	/**
	 * 初始化流程任务
	 * 
	 * @param flowName 任务名称（一般为业务名称）
	 * @param tenantId   流程类型ID（租户ID）
	 * @param processDefinitionKey  流程标识（modelKey）
	 * @param businessKey 业务ID
	 * @param userId 操作人
	 * @param callbackId = 回调标识编号，推荐按照{模块}-{业务}-{功能}定义，也可以使用UUID，只要唯一就行。
	 * @param callbackType = 回调类型，根据目前业务能想到考虑的就是打开业务表单的JQueryFunction。
	 * @param variables  附加变量值
	 * @return 流程引擎实例ID
	 */
	public static String startProcessInstanceByKey(String flowName, String tenantId, String processDefinitionKey, String businessKey, String callbackId, String callbackType, Map<String, Object> variables) {
		if (StringUtils.isEmpty(processDefinitionKey) || StringUtils.isEmpty(businessKey)) {
			throw new BaseException("流程初始化失败，流程标识或业务ID为空");
		}
		processEngine.getIdentityService().setAuthenticatedUserId(ShiroUtils.getLoginName());
		ProcessInstanceBuilder builder = processEngine.getRuntimeService().createProcessInstanceBuilder();
		builder.name(flowName);
		builder.tenantId(tenantId);
		builder.processDefinitionKey(processDefinitionKey);
		builder.businessKey(businessKey);
		builder.variables(variables);
		builder.callbackId(callbackId);
		builder.callbackType(callbackType);
		ProcessInstance instance = builder.start();
		Task task = processEngine.getTaskService().createTaskQuery().processInstanceId(instance.getId()).singleResult();
		if (null != task) {
			processEngine.getTaskService().setAssignee(task.getId(), ShiroUtils.getLoginName());
		}
		
		return instance.getId();
	}
	
	/**
	 * 初始化流程任务
	 * 
	 * @param flowName 任务名称（一般为业务名称）
	 * @param tenantId 流程类型ID（租户ID）
	 * @param processDefinitionId 流程部署ID
	 * @param businessKey 业务ID
	 * @param userId 操作人
	 * @param callbackId = 回调标识编号，推荐按照{模块}-{业务}-{功能}定义，也可以使用UUID，只要唯一就行。
	 * @param callbackType = 回调类型，根据目前业务能想到考虑的就是打开业务表单的JQueryFunction。
	 * @param variables 附加变量值
	 * @return 流程引擎实例ID
	 */
	public static String startProcessInstanceById(String flowName, String tenantId, String processDefinitionId, String businessKey, String callbackId, String callbackType, Map<String, Object> variables) {
		if (StringUtils.isEmpty(processDefinitionId) || StringUtils.isEmpty(businessKey)) {
			throw new BaseException("流程初始化失败，流程ID或业务ID为空");
		}
		processEngine.getIdentityService().setAuthenticatedUserId(ShiroUtils.getLoginName());
		ProcessInstanceBuilder builder = processEngine.getRuntimeService().createProcessInstanceBuilder();
		builder.name(flowName);
		builder.tenantId(tenantId);
		builder.processDefinitionId(processDefinitionId);
		builder.businessKey(businessKey);
		builder.variables(variables);
		builder.callbackId(callbackId);
		builder.callbackType(callbackType);
		ProcessInstance instance = builder.start();
		Task task = processEngine.getTaskService().createTaskQuery().processInstanceId(instance.getId()).singleResult();
		if (null != task) {
			processEngine.getTaskService().setAssignee(task.getId(), ShiroUtils.getLoginName());
		}
		
		return instance.getId();
	}
}
