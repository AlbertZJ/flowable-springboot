package com.daffodil.flowable.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.daffodil.core.annotation.Log;
import com.daffodil.core.annotation.Log.BusinessType;
import com.daffodil.core.entity.JsonResult;
import com.daffodil.core.entity.Page;
import com.daffodil.core.entity.TableInfo;
import com.daffodil.flowable.entity.ActCnDeployment;
import com.daffodil.flowable.entity.ActCnModel;
import com.daffodil.flowable.service.IFlowableModelService;
import com.daffodil.system.controller.SystemController;
import com.daffodil.util.StringUtils;
import com.daffodil.util.file.FileUtils;
import com.daffodil.util.text.Convert;

/**
 * 流程模板管理控制器
 * @author yweijian
 * @date 2020年1月13日
 * @version 1.0
 */
@Controller
@RequestMapping("/flowable/modeler")
public class FlowableModelerController extends SystemController{
	
	private String prefix = "flowable/modeler";
	
	@Autowired
	private IFlowableModelService modelService;
	
	@RequiresPermissions("flowable:modeler:view")
	@GetMapping
	public String index(){
		return StringUtils.format("redirect:{}", "/modeler/index.html");
	}
	
	@RequiresPermissions("flowable:modeler:add")
	@GetMapping("/add")
	public String add(){
		return StringUtils.format("redirect:{}", "/modeler/index.html");
	}
	
	@RequiresPermissions("flowable:modeler:edit")
	@GetMapping("/edit/{modelId}")
	public String edit(@PathVariable("modelId") String modelId){
		return StringUtils.format("redirect:{}", "/modeler/index.html#/editor/" + modelId);
	}
	
	/**
	 * 预览流程图
	 * @param modelId
	 * @param modelMap
	 * @return
	 */
	@RequiresPermissions("flowable:modeler:image")
	@GetMapping("/image/{modelId}")
	public String diagram(@PathVariable("modelId") String modelId, ModelMap modelMap){
		modelMap.put("modelId", modelId);
		return prefix + "/image";
	}
	
	/**
	 * 预览流程图
	 * @param modelKey
	 * @param response
	 */
	@GetMapping("/diagram/{modelKey}")
	public void diagram(@PathVariable("modelKey") String modelKey, HttpServletResponse response){
		try {
			InputStream in = modelService.getModelerDiagramByModelKey(modelKey);
			response.setHeader("Content-type", "text/html;charset=UTF-8");
			FileUtils.writeBytes(in, response.getOutputStream());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequiresPermissions("flowable:modeler:view")
	@GetMapping("/undeploy")
	public String undeploy() {
		return prefix + "/undeploy";
	}
	
	/**
	 * 查询待发布流程
	 * @param model
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequiresPermissions("flowable:modeler:list")
	@GetMapping("/list/undeploy")
	@ResponseBody
	public TableInfo list(ActCnModel model){
		initQuery(model, new Page());
		List<ActCnModel> list = modelService.selectModelUndeployList(query);
		return initTableInfo(list, query);
	}
	
	@RequiresPermissions("flowable:modeler:view")
	@GetMapping("/deploy")
	public String deploy() {
		return prefix + "/deploy";
	}
	
	/**
	 * 查询已发布流程
	 * @param model
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequiresPermissions("flowable:modeler:list")
	@GetMapping("/list/deploy")
	@ResponseBody
	public TableInfo list(ActCnDeployment deployment){
		initQuery(deployment, new Page());
		List<ActCnDeployment> list = modelService.selectModelDeployList(query);
		return initTableInfo(list, query);
	}
	
	/**
	 * 选择发布流程的流程类型
	 * @param modelId
	 * @param modelMap
	 * @return
	 */
	@GetMapping("/category/{modelId}")
	public String category(@PathVariable("modelId") String modelId, ModelMap modelMap) {
		modelMap.put("modelId", modelId);
		return prefix + "/category";
	}
	
	/**
	 * 发布流程
	 * @param modelId
	 * @param typeId
	 * @return
	 */
	@RequiresPermissions("flowable:modeler:deploy")
	@Log(title = "流程管理", businessType = BusinessType.INSERT)
	@PostMapping("/deploy")
	@ResponseBody
	public JsonResult deploy(String modelId, String typeId) {
		modelService.deployModeler(modelId, typeId);
		return JsonResult.success();
	}
	
	/**
	 * 取消发布流程
	 * @param deployId
	 * @return
	 */
	@RequiresPermissions("flowable:modeler:undeploy")
	@Log(title = "流程管理", businessType = BusinessType.DELETE)
	@PostMapping("/undeploy")
	@ResponseBody
	public JsonResult undeploy(String ids) {
		modelService.removeDeployment(Convert.toStrArray(ids));
		return JsonResult.success();
	}
}
