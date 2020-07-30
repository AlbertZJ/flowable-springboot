package com.daffodil.flowable.service.impl;

import org.flowable.bpmn.constants.BpmnXMLConstants;
import org.flowable.bpmn.model.BpmnModel;
import org.flowable.engine.ProcessEngine;
import org.flowable.engine.ProcessEngineConfiguration;
import org.flowable.engine.history.HistoricActivityInstance;
import org.flowable.engine.history.HistoricProcessInstance;
import org.flowable.engine.runtime.Execution;
import org.flowable.image.ProcessDiagramGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daffodil.flowable.custom.CustomProcessDiagramGenerator;
import com.daffodil.flowable.service.IFlowableDiagramService;
import com.daffodil.util.StringUtils;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * 生成流程图
 * @author yweijian
 * @date 2020年7月22日
 * @version 1.0
 * @description
 */
@Service
public class FlowableDigramServiceImpl implements IFlowableDiagramService {

	@Autowired
	private ProcessEngine processEngine;

	/**
	 * 根据业务Id,获取实时流程图片
	 *
	 * @param businessKey
	 * @return
	 */
	@Override
	public InputStream getFlowableDiagramByBusinessKey(String businessKey) {
		// 通过流程实例ID获取历史流程实例
		HistoricProcessInstance historicProcessInstance = this.getHistoricProcessInstanceByBusinessKey(businessKey);
		String processInstanceId = historicProcessInstance.getId();

		// 将已经执行的历史节点ID放入高亮显示节点集合
		List<String> historicHighLightedFlowNodes = this.getHistoricHighLightedFlowNodes(processInstanceId);

		
		// 将正在执行的节点ID放入高亮显示节点集合
		List<String> runningHighLightedFlowNodes = this.getRunningHighLightedFlowNodes(processInstanceId);

		// 定义流程画布生成器
		ProcessDiagramGenerator processDiagramGenerator = new CustomProcessDiagramGenerator();
		// 如果还没完成，流程图高亮颜色为绿色，如果已经完成为红色
		try {
			// 获取流程定义Model对象
			BpmnModel bpmnModel = processEngine.getRepositoryService().getBpmnModel(historicProcessInstance.getProcessDefinitionId());

			// 获取已流经的流程线，需要高亮显示高亮流程已发生流转的线id集合
			List<String> highLightedSequenceFlows = this.getHighLightedSequenceFlows(processInstanceId);

			// 使用默认配置获得流程图表生成器，并生成追踪图片字符流
			ProcessEngineConfiguration engconf = processEngine.getProcessEngineConfiguration();
			InputStream in = ((CustomProcessDiagramGenerator) processDiagramGenerator).generateDiagramCustom(bpmnModel,
					"png", historicHighLightedFlowNodes, runningHighLightedFlowNodes, highLightedSequenceFlows, engconf.getActivityFontName(),
					engconf.getLabelFontName(), engconf.getAnnotationFontName(), null, 1.0);
			return in;
		} catch (Exception e) {
			// 没有找到相应的流程图
		}
		
		return null;
	}

	/**
	 * 通过业务ID获取历史流程实例
	 *
	 * @param businessKey
	 * @return
	 */
	public HistoricProcessInstance getHistoricProcessInstanceByBusinessKey(String businessKey) {
		return processEngine.getHistoryService().createHistoricProcessInstanceQuery()
				.processInstanceBusinessKey(businessKey).singleResult();
	}

	/**
	 * 通过流程实例ID获取流程中已经执行的节点，按照执行先后顺序排序
	 *
	 * @param processInstanceId
	 * @return
	 */
	public List<String> getHistoricHighLightedFlowNodes(String processInstanceId) {
		Set<String> activityTypes = new HashSet<String>();
		activityTypes.add(BpmnXMLConstants.ELEMENT_GATEWAY_EXCLUSIVE);
		activityTypes.add(BpmnXMLConstants.ELEMENT_GATEWAY_PARALLEL);
		activityTypes.add(BpmnXMLConstants.ELEMENT_GATEWAY_INCLUSIVE);
		activityTypes.add(BpmnXMLConstants.ELEMENT_EVENT_START);
		activityTypes.add(BpmnXMLConstants.ELEMENT_EVENT_END);
		activityTypes.add(BpmnXMLConstants.ELEMENT_TASK_USER);
		
		List<HistoricActivityInstance> historicActivityInstances = processEngine.getHistoryService().createHistoricActivityInstanceQuery()
			.processInstanceId(processInstanceId)
			.activityTypes(activityTypes)
			.orderByHistoricActivityInstanceStartTime()
			.asc().list();

		// 将已经执行的节点ID放入高亮显示节点集合
		List<String> highLightedFlowNodes = new ArrayList<String>();
		for (HistoricActivityInstance historicActivityInstance : historicActivityInstances) {
			highLightedFlowNodes.add(historicActivityInstance.getActivityId());
		}
		return highLightedFlowNodes;
	}
	
	/**
	 * 通过流程实例ID获取流程中正在执行的节点，按照执行先后顺序排序
	 * @param processInstanceId
	 * @return
	 */
	private List<String> getRunningHighLightedFlowNodes(String processInstanceId) {
		List<Execution> executions = processEngine.getRuntimeService().createExecutionQuery().processInstanceId(processInstanceId).list();
		List<String> runningHighLightedFlowNodes = new ArrayList<String>();
		if(StringUtils.isNotEmpty(executions)) {
			for (Execution execution : executions) {
				if (StringUtils.isNotEmpty(execution.getActivityId())) {
					runningHighLightedFlowNodes.add(execution.getActivityId());
				}
			}
		}
		return runningHighLightedFlowNodes;
	}

	/**
	 * 获取已流经的流程线，需要高亮显示高亮流程已发生流转的线id集合
	 * @param processInstanceId
	 * @return
	 */
	public List<String> getHighLightedSequenceFlows(String processInstanceId){
		List<HistoricActivityInstance> activityInstances = processEngine.getHistoryService().createHistoricActivityInstanceQuery()
				.activityType(BpmnXMLConstants.ELEMENT_SEQUENCE_FLOW).processInstanceId(processInstanceId).list();
		List<String> highLightedSequenceFlows = new ArrayList<String>();
		if(StringUtils.isNotEmpty(activityInstances)) {
			for(HistoricActivityInstance activityInstance : activityInstances) {
				highLightedSequenceFlows.add(activityInstance.getActivityId());
			}
		}
		
		return highLightedSequenceFlows;
	}

}
