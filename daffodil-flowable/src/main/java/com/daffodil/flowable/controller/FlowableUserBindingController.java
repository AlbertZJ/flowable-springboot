package com.daffodil.flowable.controller;

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

import com.daffodil.core.entity.JsonResult;
import com.daffodil.core.entity.Page;
import com.daffodil.core.entity.TableInfo;
import com.daffodil.flowable.entity.ActCnDeployment;
import com.daffodil.flowable.service.IFlowableUserBindingService;
import com.daffodil.system.controller.SystemController;
import com.daffodil.system.entity.SysUser;
import com.daffodil.system.service.ISysUserService;

/**
 * 流程绑定管理
 * @author yweijian
 * @date 2020年1月11日
 * @version 1.0
 */
@Controller
@RequestMapping("/flowable/user")
public class FlowableUserBindingController extends SystemController{

	private String prefix = "flowable/user";
	
	@Autowired
	private ISysUserService userService;
	
	@Autowired
	private IFlowableUserBindingService bindingService;
	
	/**
	 * 绑定用户管理
	 * @return
	 */
	@RequiresPermissions("flowable:user:view")
	@GetMapping
	public String user() {
		return prefix + "/user";
	}
	
	@SuppressWarnings("unchecked")
	@RequiresPermissions("flowable:user:list")
	@GetMapping("/list")
	@ResponseBody
	public TableInfo list(SysUser user) {
		initQuery(user, new Page());
		List<SysUser> list = userService.selectUserList(query);
		return initTableInfo(list, query);
	}

	/**
	 * 选择绑定已发布的流程
	 * @return
	 */
	@RequiresPermissions("flowable:user:binding")
	@GetMapping("/binding/{userId}")
	public String binding(@PathVariable("userId") String userId, ModelMap modelMap) {
		SysUser user = userService.selectUserById(userId);
		modelMap.put("user", user);
		return prefix + "/binding";
	}
	
	/**
	 * 用户绑定流程
	 * @param deployId
	 * @return
	 */
	@PostMapping("/binding")
	@ResponseBody
	public JsonResult binding(String deployId, String userId){
		bindingService.bingdingByDeployId(deployId, userId);
		return JsonResult.success();
	}
	
	/**
	 * 选择已绑定的流程
	 * @return
	 */
	@RequiresPermissions("flowable:user:binded")
	@GetMapping("/binded/{userId}")
	public String binded(@PathVariable("userId") String userId, ModelMap modelMap) {
		SysUser user = userService.selectUserById(userId);
		modelMap.put("user", user);
		return prefix + "/binded";
	}
	
	/**
	 * 用户已绑定的数据
	 * @param user
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequiresPermissions("flowable:user:binded")
	@GetMapping("/list/binded/{userId}")
	@ResponseBody
	public TableInfo listBinded(ActCnDeployment deployment, @PathVariable("userId") String userId) {
		initQuery(deployment, new Page());
		List<ActCnDeployment> list = bindingService.selectModelBindedList(query, userId);
		return initTableInfo(list, query);
	}
	
	/**
	 * 用户取消绑定流程
	 * @param deployId
	 * @return
	 */
	@PostMapping("/unbinded")
	@RequiresPermissions("flowable:user:unbinded")
	@ResponseBody
	public JsonResult unbinded(String deployId, String userId){
		bindingService.unbindedByDeployId(deployId, userId);
		return JsonResult.success();
	}
}
