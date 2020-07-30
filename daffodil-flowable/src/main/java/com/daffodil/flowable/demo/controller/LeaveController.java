package com.daffodil.flowable.demo.controller;

import java.util.List;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.daffodil.core.annotation.FormToken;
import com.daffodil.core.annotation.FormToken.TokenType;
import com.daffodil.core.annotation.Log;
import com.daffodil.core.annotation.Log.BusinessType;
import com.daffodil.core.controller.BaseController;
import com.daffodil.core.entity.JsonResult;
import com.daffodil.core.entity.Page;
import com.daffodil.core.entity.TableInfo;
import com.daffodil.flowable.demo.entity.Leave;
import com.daffodil.flowable.demo.service.ILeaveService;
import com.daffodil.util.text.Convert;

/**
 * 请假 信息控制层
 * 
 * @author yweijian
 * @date 2019年8月18日
 * @version 1.0
 */
@Controller
@RequestMapping("/demo/leave")
public class LeaveController extends BaseController {

	private String prefix = "demo/leave";

	@Autowired
	private ILeaveService leaveService;

	@RequiresPermissions("demo:leave:view")
	@GetMapping()
	public String leave() {
		return prefix + "/leave";
	}

	/**
	 * 查询请假列表
	 */
	@SuppressWarnings("unchecked")
	@RequiresPermissions("demo:leave:list")
	@GetMapping("/list")
	@ResponseBody
	public TableInfo list(Leave leave) {
		initQuery(leave, new Page());
		List<Leave> list = leaveService.selectLeaveList(query);
		return initTableInfo(list, query);
	}

	/**
	 * 新增请假
	 */
	@FormToken
	@GetMapping("/add")
	public String add() {
		return prefix + "/add";
	}

	/**
	 * 新增保存请假
	 */
	@FormToken(TokenType.DESTROY)
	@RequiresPermissions("demo:leave:add")
	@Log(title = "请假管理", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public JsonResult addSave(Leave leave) {
		leaveService.insertLeave(leave);
		return JsonResult.success(leave);
	}

	/**
	 * 修改请假
	 */
	@GetMapping("/edit/{leaveId}")
	public String edit(@PathVariable("leaveId") String leaveId, ModelMap modelMap) {
		modelMap.put("leave", leaveService.selectLeaveById(leaveId));
		return prefix + "/edit";
	}

	/**
	 * 修改保存请假
	 */
	@RequiresPermissions("demo:leave:edit")
	@Log(title = "请假管理", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public JsonResult editSave(Leave leave) {
		leaveService.updateLeave(leave);
		return JsonResult.success();
	}

	/**
	 * 删除请假
	 */
	@RequiresPermissions("demo:leave:remove")
	@Log(title = "请假管理", businessType = BusinessType.DELETE)
	@PostMapping("/remove")
	@ResponseBody
	public JsonResult remove(String ids) {
		leaveService.deleteLeaveByIds(Convert.toStrArray(ids));
		return JsonResult.success();
	}
}
