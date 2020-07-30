package com.daffodil.flowable.controller;

import java.util.List;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.daffodil.core.annotation.FormToken;
import com.daffodil.core.annotation.FormToken.TokenType;
import com.daffodil.core.annotation.Log;
import com.daffodil.core.annotation.Log.BusinessType;
import com.daffodil.core.entity.JsonResult;
import com.daffodil.core.entity.TableInfo;
import com.daffodil.core.entity.Ztree;
import com.daffodil.flowable.entity.ActCnFlowType;
import com.daffodil.flowable.service.IFlowableTypeService;
import com.daffodil.system.controller.SystemController;

/**
 * 流程流程类型控制器
 * @author yweijian
 * @date 2020年2月11日
 * @version 1.0
 */
@Controller
@RequestMapping("/flowable/type")
public class FlowableTypeController extends SystemController {
	
	private String prefix = "flowable/type";

	@Autowired
	private IFlowableTypeService typeService;

	@RequiresPermissions("flowable:type:view")
	@GetMapping()
	public String type() {
		return prefix + "/type";
	}

	@SuppressWarnings("unchecked")
	@RequiresPermissions("flowable:type:list")
	@GetMapping("/list")
	@ResponseBody
	public TableInfo list(ActCnFlowType flowType) {
		initQuery(flowType);
		List<ActCnFlowType> types = typeService.selectFlowTypeList(query);
		return initTableInfo(types);
	}

	/**
	 * 新增流程类型
	 */
	@FormToken
	@GetMapping("/add/{parentId}")
	public String add(@PathVariable("parentId") String parentId, ModelMap modelMap) {
		modelMap.put("flowType", typeService.selectFlowTypeById(parentId));
		return prefix + "/add";
	}

	/**
	 * 新增保存流程类型
	 */
	@FormToken(TokenType.DESTROY)
	@Log(title = "流程类型管理", businessType = BusinessType.INSERT)
	@RequiresPermissions("flowable:type:add")
	@PostMapping("/add")
	@ResponseBody
	public JsonResult addSave(@Validated ActCnFlowType flowType) {
		typeService.insertFlowType(flowType);
		return JsonResult.success();
	}

	/**
	 * 修改
	 */
	@GetMapping("/edit/{flowTypeId}")
	public String edit(@PathVariable("flowTypeId") String flowTypeId, ModelMap modelMap) {
		ActCnFlowType flowType = typeService.selectFlowTypeById(flowTypeId);
		modelMap.put("flowType", flowType);
		ActCnFlowType parent = typeService.selectFlowTypeById(flowType.getParentId());
		modelMap.put("parent", parent);
		return prefix + "/edit";
	}

	/**
	 * 保存
	 */
	@Log(title = "流程类型管理", businessType = BusinessType.UPDATE)
	@RequiresPermissions("flowable:type:edit")
	@PostMapping("/edit")
	@ResponseBody
	public JsonResult editSave(@Validated ActCnFlowType flowType) {
		typeService.updateFlowType(flowType);
		return JsonResult.success();
	}

	/**
	 * 删除
	 */
	@Log(title = "流程类型管理", businessType = BusinessType.DELETE)
	@RequiresPermissions("flowable:type:remove")
	@PostMapping("/remove/{flowTypeId}")
	@ResponseBody
	public JsonResult remove(@PathVariable("flowTypeId") String flowTypeId) {
		typeService.deleteFlowTypeById(flowTypeId);
		return JsonResult.success();
	}

	/**
	 * 校验流程类型名称
	 */
	@GetMapping("/checkFlowTypeNameUnique")
	@ResponseBody
	public String checkFlowTypeNameUnique(ActCnFlowType flowType) {
		return typeService.checkFlowTypeNameUnique(flowType) ? "1" : "0";
	}

	/**
	 * 选择流程类型树
	 */
	@GetMapping("/selectFlowTypeTree/{flowTypeId}")
	public String selectFlowTypeTree(@PathVariable("flowTypeId") String flowTypeId, ModelMap modelMap) {
		modelMap.put("flowType", typeService.selectFlowTypeById(flowTypeId));
		return prefix + "/tree";
	}

	/**
	 * 加载流程类型列表树
	 */
	@SuppressWarnings("unchecked")
	@GetMapping("/treeData")
	@ResponseBody
	public List<Ztree> treeData(ActCnFlowType flowType) {
		initQuery(flowType);
		List<Ztree> ztrees = typeService.selectFlowTypeTree(query);
		return ztrees;
	}

}
