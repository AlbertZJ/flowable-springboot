package com.daffodil.flowable.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.flowable.bpmn.model.FlowElement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.daffodil.core.annotation.Log;
import com.daffodil.core.annotation.Log.BusinessType;
import com.daffodil.core.entity.JsonResult;
import com.daffodil.core.entity.Page;
import com.daffodil.core.entity.TableInfo;
import com.daffodil.flowable.entity.ActCnHistoricActivity;
import com.daffodil.flowable.entity.ActCnHistoricProcess;
import com.daffodil.flowable.service.IFlowableDiagramService;
import com.daffodil.flowable.service.IFlowableHandleService;
import com.daffodil.flowable.util.FlowableUtils;
import com.daffodil.framework.shiro.util.ShiroUtils;
import com.daffodil.system.controller.SystemController;
import com.daffodil.system.entity.SysUser;
import com.daffodil.util.StringUtils;
import com.daffodil.util.file.FileUtils;

/**
 * 流程任务管理公共组件
 * @author yweijian
 * @date 2020年1月14日
 * @version 1.0
 */
@Controller
@RequestMapping("/flowable/task")
public class FlowableTaskController extends SystemController {

	private String prefix = "flowable/task";
	
	@Autowired
	private IFlowableHandleService handleService;
	
	@Autowired
	private IFlowableDiagramService diagramService;
	
	/**
	 * 我的任务（待发送、已发送、已办结）
	 * @return
	 */
	@RequiresPermissions("flowable:task:view")
	@GetMapping("/myself/{type}")
	public String myself(@PathVariable("type") String type, ModelMap modelMap){
		modelMap.put("type", type);
		return prefix + "/myself";
	}
	
	
	/**
	 * 待办任务、已办（经办）任务、办结任务
	 * @return
	 */
	@RequiresPermissions("flowable:task:view")
	@GetMapping("/task/{type}")
	public String list(@PathVariable("type") String type, ModelMap modelMap){
		modelMap.put("type", type);
		return prefix + "/task";
	}
	
	/**
	 * 任务数据
	 * 
	 * @param historicProcess
	 * @param type   
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequiresPermissions("flowable:task:list")
	@GetMapping("/list/{type}")
	@ResponseBody
	public TableInfo list(ActCnHistoricProcess historicProcess, @PathVariable("type") String type) {
		initQuery(historicProcess, new Page());
		List<ActCnHistoricProcess> list = new ArrayList<ActCnHistoricProcess>();
		if ("0".equals(type)) {		  // 待提交-环节任务待办-流程未结
			list = handleService.selectMyselfProcessList(query, false, false);
		} else if ("1".equals(type)) {// 已提交-环节任务已办-流程未结
			list = handleService.selectMyselfProcessList(query, true, false);
		} else if ("2".equals(type)) {// 已办结-环节任务已办-流程结束
			list = handleService.selectMyselfProcessList(query, true, true);
		} else if ("3".equals(type)) {// 待办任务
			list = handleService.selectUnfinishedProcessList(query);
		} else if ("4".equals(type)) {// 经办任务（已办任务）
			list = handleService.selectFinishedProcessList(query);
		} else if ("5".equals(type)) {// 办结任务(查看所有办结任务，一般是给管理员使用)
			list = handleService.selectCompleteProcessList(query);
		}

		return initTableInfo(list, query);
	}
	
	/**
	 * 任务办理页面（审批意见）
	 * @param businessKey 业务ID
	 * @param modelMap
	 * @return
	 */
	@GetMapping("/submit/{businessKey}")
	public String submit(@PathVariable("businessKey") String businessKey, ModelMap modelMap){
		List<Map<String, String>> handles = FlowableUtils.getNextHandles(businessKey, ShiroUtils.getLoginName());
		FlowElement currentNode = FlowableUtils.getCurrentFlowNode(businessKey, ShiroUtils.getLoginName());
		modelMap.put("businessKey", businessKey);
		modelMap.put("handles", handles);
		modelMap.put("currentNode", currentNode);
		return prefix + "/submit";
	}
	
	/**
	 * 保存结束任务办理
	 * @param businessKey 业务ID
	 * @param handleId 操作ID
	 * @param message 办理意见
	 * @return
	 */
	@RequiresPermissions("flowable:task:edit")
	@Log(title = "任务管理", businessType = BusinessType.UPDATE)
	@PostMapping("/submit")
	@ResponseBody
	public JsonResult submitSave(String businessKey, String handleId, String message,
			String attachmentName, String attachmentDescription, MultipartFile attachmentFile,
			@RequestParam("nodeIds") String[] nodeIds, @RequestParam("userIds")String userIds[]){
		
		handleService.generalDirectHandle(businessKey, ShiroUtils.getLoginName(), handleId, message, attachmentName, attachmentDescription, attachmentFile);
		
		//设置下一环节办理人员
		if(StringUtils.isNotEmpty(nodeIds) && StringUtils.isNotEmpty(userIds)) {
			for(int i = 0; i < nodeIds.length; i++) {
				handleService.changeTaskAssignee(businessKey, nodeIds[i], userIds[i]);
			}
		}
		
		return JsonResult.success();
	}
	
	/**
	 * 获取选择下一步环节以及操作人员
	 * @param businessKey 业务ID
	 * @param handleId 操作ID
	 * @param modelMap
	 * @return
	 */
	@GetMapping("/nextAssignee/{businessKey}/{handleId}/{nodeId}")
	@ResponseBody
	public JsonResult assignee(@PathVariable("businessKey") String businessKey, @PathVariable("handleId") String handleId, @PathVariable("nodeId") String nodeId){
		List<SysUser> users = FlowableUtils.getNextNodeHandleUsers(businessKey, ShiroUtils.getLoginName(), handleId, nodeId);
		return JsonResult.success(users);
	}
	
	/**
	 * 获取选择下一步环节以及操作人员
	 * @param businessKey 业务ID
	 * @param handleId 操作ID
	 * @param modelMap
	 * @return
	 */
	@GetMapping("/nextFlowNodes/{businessKey}/{handleId}")
	@ResponseBody
	public JsonResult nextFlowNodes(@PathVariable("businessKey") String businessKey, @PathVariable("handleId") String handleId){
		List<FlowElement> flowElements = FlowableUtils.getNextFlowNodes(businessKey, ShiroUtils.getLoginName(), handleId);
		return JsonResult.success(flowElements);
	}
	
	
	
	/**
	 * 查看流程图
	 * @param businessKey
	 * @param modelMap
	 * @return
	 */
	@RequiresPermissions("flowable:task:image")
	@GetMapping("/image/{businessKey}")
	public String image(@PathVariable("businessKey") String businessKey, ModelMap modelMap){
		modelMap.put("businessKey", businessKey);
		return prefix + "/image";
	}
	
	/**
	 * 生成流程图
	 * @param businessKey
	 * @param response
	 */
	@GetMapping("/diagram/{businessKey}")
	public void diagram(@PathVariable("businessKey") String businessKey, HttpServletResponse response){
		try {
			InputStream in = diagramService.getFlowableDiagramByBusinessKey(businessKey);
			response.setHeader("Content-type", "text/html;charset=UTF-8");
			FileUtils.writeBytes(in, response.getOutputStream());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 查看流程步骤详情
	 * @param businessKey
	 * @param modelMap
	 * @return
	 */
	@RequiresPermissions("flowable:task:detail")
	@GetMapping("/detail/{businessKey}")
	public String detail(@PathVariable("businessKey") String businessKey, ModelMap modelMap){
		List<ActCnHistoricActivity> activitys = handleService.selectHistoricActivityByBusinessKey(businessKey);
		modelMap.put("activitys", activitys);
		return prefix + "/detail";
	}
	
}
