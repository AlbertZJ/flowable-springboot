package com.daffodil.flowable.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.flowable.bpmn.model.FlowElement;
import org.flowable.bpmn.model.UserTask;
import org.flowable.task.api.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.daffodil.core.annotation.Log;
import com.daffodil.core.annotation.Log.BusinessType;
import com.daffodil.core.entity.JsonResult;
import com.daffodil.core.exception.BaseException;
import com.daffodil.flowable.constant.FlowableConstants;
import com.daffodil.flowable.entity.ActCnDeployment;
import com.daffodil.flowable.entity.ActCnHistoricActivity;
import com.daffodil.flowable.service.IFlowableEngineService;
import com.daffodil.flowable.service.IFlowableHandleService;
import com.daffodil.flowable.util.FlowableUtils;
import com.daffodil.framework.shiro.util.ShiroUtils;
import com.daffodil.system.entity.SysUser;
import com.daffodil.util.StringUtils;

/**
 * 流程引擎实例API
 * @author yweijian
 * @date 2020年7月8日
 * @version 1.0
 * @description
 */
@Controller
@RequestMapping("/flowable/engine")
public class FlowableEngineController {

	@Autowired
	private IFlowableEngineService flowableEngineService;
	
	@Autowired
	private IFlowableHandleService handleService;
	
	@Value("${flowable.button.trash: 0}")
	private String FLOWABLE_BUTTON_TRASH;
	
	/**
	 * 获取当前用户下所绑定的流程信息
	 * @return
	 */
	@GetMapping("/infos/{flowTypeId}")
	@ResponseBody
	public JsonResult infos(@PathVariable("flowTypeId") String flowTypeId) {
		List<ActCnDeployment> deployments = flowableEngineService.selectFlowableInfoListByFlowTypeId(flowTypeId);
		return JsonResult.success(deployments);
	}
	
	/**
	 * 根据流程部署的ID获取流程信息
	 * @param deployId
	 * @return
	 */
	@GetMapping("/info/{deployId}")
	@ResponseBody
	public JsonResult info(@PathVariable("deployId") String deployId) {
		ActCnDeployment deployment = flowableEngineService.selectFlowableInfoByDeployId(deployId);
		return JsonResult.success(deployment);
	}
	
	/**
	 * 获取当前节点信息
	 * @return
	 */
	@GetMapping("/node/{businessKey}")
	@ResponseBody
	public JsonResult node(@PathVariable("businessKey") String businessKey) {
		Task task = FlowableUtils.getCurrentTask(businessKey, ShiroUtils.getLoginName());
		FlowElement flowElement = FlowableUtils.getFlowNode(task);
		return JsonResult.success(flowElement);
	}
	
	/**
	 * 查看流程记录详情
	 * @param businessKey
	 * @return
	 */
	@GetMapping("/detail/{businessKey}")
	@ResponseBody
	public JsonResult detail(@PathVariable("businessKey") String businessKey){
		List<ActCnHistoricActivity> activitys = handleService.selectHistoricActivityByBusinessKey(businessKey);
		return JsonResult.success(activitys);
	}
	
	/**
	 * 流程初始化
	 * @param params
	 * @return
	 */
	@PostMapping("/start")
	@Log(title = "流程实例", businessType = BusinessType.INSERT)
	@ResponseBody
	public JsonResult start(@RequestParam Map<String, Object> params) {
		//流程实例初始化
		String flowName = (String) params.get("flowName");
		if(StringUtils.isEmpty(flowName)) {
			throw new BaseException("流程实例失败，流程标题【flowName】不能为空");
		}
		String flowTypeId = (String) params.get("flowTypeId");
		if(StringUtils.isEmpty(flowTypeId)) {
			throw new BaseException("流程实例失败，流程类型【flowTypeId】不能为空");
		}
		String modelKey = (String) params.get("modelKey");
		if(StringUtils.isEmpty(modelKey)) {
			throw new BaseException("流程实例失败，流程标识【modelKey】不能为空");
		}
		String businessKey = (String) params.get("businessKey");
		if(StringUtils.isEmpty(businessKey)) {
			throw new BaseException("流程实例失败，业务标识【businessKey】不能为空");
		}
		String callbackId = (String) params.get("callbackId");
		String callbackType = (String) params.get("callbackType");
		String instanceId = FlowableUtils.startProcessInstanceByKey(flowName, flowTypeId, modelKey, businessKey, callbackId, callbackType, params);
		params.put("instanceId", instanceId);
		
		return JsonResult.success(params);
	}
	
	/**
	 * 流程作废
	 * @param businessKey
	 * @return
	 */
	@PostMapping("/trash")
	@Log(title = "流程作废", businessType = BusinessType.TRASH)
	@ResponseBody
	public JsonResult trash(String businessKey) {
		handleService.deleteProcessInstance(businessKey);
		return JsonResult.success();
	}
	
	@PostMapping("/back")
	@Log(title = "流程撤办", businessType = BusinessType.UPDATE)
	@ResponseBody
	public JsonResult back(String businessKey) {
		handleService.backProcessInstance(businessKey, ShiroUtils.getLoginName());
		return JsonResult.success();
	}
	
	@PostMapping("/reject")
	@Log(title = "流程驳回", businessType = BusinessType.UPDATE)
	@ResponseBody
	public JsonResult reject(String businessKey, String message) {
		handleService.rejectProcessInstance(businessKey, message, ShiroUtils.getLoginName());
		return JsonResult.success();
	}
	
	/**
	 * 获取当前任务节点的按钮操作
	 * @param businessKey
	 * @return
	 */
	@GetMapping("/button/{businessKey}")
	@ResponseBody
	public JsonResult button(@PathVariable("businessKey") String businessKey){
		SysUser user = ShiroUtils.getSysUser();
		SysUser startUser = FlowableUtils.getStartUser(businessKey);
		List<String> buttons = new ArrayList<String>();
		FlowElement flowElement = FlowableUtils.getCurrentFlowNode(businessKey, user.getLoginName());
		
		if("0".equals(businessKey)) {
			buttons.add(FlowableConstants.actFormSave);//还未开启流程，【保存】按钮功能
		}
		
		if (FlowableUtils.isUserTaskNode(flowElement)) {
			UserTask userTask = (UserTask) flowElement;
			String assignee = userTask.getAssignee();
			if("$INITIATOR".equals(assignee)) {//执行人是发起人即发起的用户节点
				if(StringUtils.isNotNull(startUser) && user.getId().equals(startUser.getId())) {
					buttons.add(FlowableConstants.actFormSave);//【保存】按钮功能
				}
			}
		}
		
		List<SysUser> users = FlowableUtils.getCurrentNodeHandleUsers(businessKey, user.getLoginName());
		if(StringUtils.isNotEmpty(users)) {
			for(int i= 0; i < users.size(); i++) {
				if(user.getId().equals(users.get(i).getId())) {
					buttons.add(FlowableConstants.actFlowSend);//包含当前用户则拥有【发送】按钮功能
					if("0".equals(FLOWABLE_BUTTON_TRASH)) {
						buttons.add(FlowableConstants.actFlowTrash);//环节执行人可【作废】按钮功能
					}
					break;
				}
			}
		}
		
		if(!buttons.contains(FlowableConstants.actFlowSend) && !buttons.contains(FlowableConstants.actFormSave)) {//不包含【发送】和【保存】功能则可能包含撤办
			if(StringUtils.isNotEmpty(FlowableUtils.getCurrentTask(businessKey))) {//任务结束就不能有【撤办】
				buttons.add(FlowableConstants.actFlowBack);
			}
		}
		if(buttons.contains(FlowableConstants.actFlowSend) && !buttons.contains(FlowableConstants.actFormSave)) {//包含【发送】且不包含【保存】功能则可能包含驳回
			if(StringUtils.isNotEmpty(FlowableUtils.getCurrentTask(businessKey))) {//任务结束就不能有【驳回】
				buttons.add(FlowableConstants.actFlowReject);//【驳回】按钮功能
			}
		}
		
		if(StringUtils.isNotNull(startUser) && user.getId().equals(startUser.getId())) {
			buttons.add(FlowableConstants.actFlowTrash);//当前登录用户是当前流程发起人则，拥有【作废】按钮功能
		}
		
		buttons.add(FlowableConstants.actFormClose);//默认都拥有【关闭】按钮功能
		
		List<String> result = buttons.stream().distinct().collect(Collectors.toList());//去重
		return JsonResult.success(result);
	}
}
