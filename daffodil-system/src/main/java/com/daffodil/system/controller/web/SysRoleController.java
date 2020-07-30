package com.daffodil.system.controller.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.daffodil.core.constant.Constants;
import com.daffodil.core.entity.JsonResult;
import com.daffodil.core.entity.Page;
import com.daffodil.core.entity.TableInfo;
import com.daffodil.system.controller.SystemController;
import com.daffodil.system.entity.SysRole;
import com.daffodil.system.entity.SysUser;
import com.daffodil.system.entity.SysUserRole;
import com.daffodil.system.service.ISysRoleService;
import com.daffodil.system.service.ISysUserService;
import com.daffodil.framework.shiro.util.ShiroUtils;
import com.daffodil.util.ExcelUtils;
import com.daffodil.util.text.Convert;

/**
 * 系统角色控制层
 * 
 * @author yweijian
 * @date 2019年8月18日
 * @version 1.0
 */
@Controller
@RequestMapping("/system/role")
public class SysRoleController extends SystemController {
	private String prefix = "system/role";

	@Autowired
	private ISysRoleService roleService;

	@Autowired
	private ISysUserService userService;

	@RequiresPermissions("system:role:view")
	@GetMapping()
	public String role() {
		return prefix + "/role";
	}

	@SuppressWarnings("unchecked")
	@RequiresPermissions("system:role:list")
	@GetMapping("/list")
	@ResponseBody
	public TableInfo list(SysRole role) {
		initQuery(role, new Page());
		List<SysRole> list = roleService.selectRoleList(query);
		return initTableInfo(list, query);
	}

	@SuppressWarnings("unchecked")
	@Log(title = "角色管理", businessType = BusinessType.EXPORT)
	@RequiresPermissions("system:role:export")
	@GetMapping("/export")
	@ResponseBody
	public JsonResult export(SysRole role) {
		initQuery(role);
		List<SysRole> list = roleService.selectRoleList(query);
		ExcelUtils<SysRole> util = new ExcelUtils<SysRole>(SysRole.class);
		return util.exportExcel(list, "角色数据");
	}

	/**
	 * 新增角色
	 */
	@FormToken
	@GetMapping("/add")
	public String add() {
		return prefix + "/add";
	}

	/**
	 * 新增保存角色
	 */
	@FormToken(TokenType.DESTROY)
	@RequiresPermissions("system:role:add")
	@Log(title = "角色管理", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public JsonResult addSave(@Validated SysRole role) {
		roleService.insertRole(role);
		ShiroUtils.clearCachedAuthorizationInfo();
		return JsonResult.success();

	}

	/**
	 * 修改角色
	 */
	@GetMapping("/edit/{roleId}")
	public String edit(@PathVariable("roleId") String roleId, ModelMap mmap) {
		mmap.put("role", roleService.selectRoleById(roleId));
		return prefix + "/edit";
	}

	/**
	 * 修改保存角色
	 */
	@RequiresPermissions("system:role:edit")
	@Log(title = "角色管理", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public JsonResult editSave(@Validated SysRole role) {
		roleService.updateRole(role);
		ShiroUtils.clearCachedAuthorizationInfo();
		return JsonResult.success();
	}

	/**
	 * 角色分配数据权限
	 */
	@GetMapping("/authDataScope/{roleId}")
	public String authDataScope(@PathVariable("roleId") String roleId, ModelMap modelMap) {
		modelMap.put("role", roleService.selectRoleById(roleId));
		return prefix + "/dataScope";
	}

	/**
	 * 保存角色分配数据权限
	 */
	@RequiresPermissions("system:role:edit")
	@Log(title = "角色管理", businessType = BusinessType.UPDATE)
	@PostMapping("/authDataScope")
	@ResponseBody
	public JsonResult authDataScopeSave(SysRole role) {
		roleService.authRoleDataScope(role);
		SysUser user = userService.selectUserById(ShiroUtils.getSysUser().getId());
		ShiroUtils.setSysUser(user);
		return JsonResult.success();
	}

	@RequiresPermissions("system:role:remove")
	@Log(title = "角色管理", businessType = BusinessType.DELETE)
	@PostMapping("/remove")
	@ResponseBody
	public JsonResult remove(String ids) {
		roleService.deleteRoleByIds(Convert.toStrArray(ids));
		return JsonResult.success();
	}

	/**
	 * 校验角色名称
	 */
	@GetMapping("/checkRoleNameUnique")
	@ResponseBody
	public String checkRoleNameUnique(SysRole role) {
		return roleService.checkRoleNameUnique(role) ? "1" : "0";
	}

	/**
	 * 校验角色权限
	 */
	@GetMapping("/checkRoleKeyUnique")
	@ResponseBody
	public String checkRoleKeyUnique(SysRole role) {
		return roleService.checkRoleKeyUnique(role) ? "1" : "0";
	}

	/**
	 * 选择菜单树
	 */
	@GetMapping("/selectMenuTree")
	public String selectMenuTree() {
		return prefix + "/tree";
	}

	/**
	 * 角色状态修改
	 */
	@Log(title = "角色管理", businessType = BusinessType.UPDATE)
	@RequiresPermissions("system:role:edit")
	@PostMapping("/changeStatus")
	@ResponseBody
	public JsonResult changeStatus(SysRole role) {
		roleService.changeRoleStatus(role);
		return JsonResult.success();
	}

	/**
	 * 分配用户
	 */
	@RequiresPermissions("system:role:edit")
	@GetMapping("/authUser/{roleId}")
	public String authUser(@PathVariable("roleId") String roleId, ModelMap mmap) {
		mmap.put("role", roleService.selectRoleById(roleId));
		return prefix + "/authUser";
	}

	/**
	 * 查询已分配用户角色列表
	 */
	@SuppressWarnings("unchecked")
	@RequiresPermissions("system:role:list")
	@GetMapping("/authUser/allocatedList")
	@ResponseBody
	public TableInfo allocatedList(SysUser user) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("allocated", Constants.YES);
		initQuery(user, params , new Page());
		List<SysUser> list = userService.selectAllocatedList(query);
		return initTableInfo(list, query);
	}

	/**
	 * 取消授权
	 */
	@Log(title = "角色管理", businessType = BusinessType.GRANT)
	@PostMapping("/authUser/cancel")
	@ResponseBody
	public JsonResult cancelAuthUser(SysUserRole userRole) {
		roleService.deleteAuthUser(userRole);
		return JsonResult.success();
	}

	/**
	 * 批量取消授权
	 */
	@Log(title = "角色管理", businessType = BusinessType.GRANT)
	@PostMapping("/authUser/cancelAll")
	@ResponseBody
	public JsonResult cancelAuthUserAll(String roleId, String userIds) {
		roleService.deleteAuthUsers(roleId, Convert.toStrArray(userIds));
		return JsonResult.success();
	}

	/**
	 * 选择用户
	 */
	@GetMapping("/authUser/selectUser/{roleId}")
	public String selectUser(@PathVariable("roleId") String roleId, ModelMap modelMap) {
		modelMap.put("role", roleService.selectRoleById(roleId));
		return prefix + "/selectUser";
	}

	/**
	 * 查询未分配用户角色列表
	 */
	@SuppressWarnings("unchecked")
	@RequiresPermissions("system:role:list")
	@GetMapping("/authUser/unallocatedList")
	@ResponseBody
	public TableInfo unallocatedList(SysUser user) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("allocated", Constants.NO);
		initQuery(user, params , new Page());
		List<SysUser> list = userService.selectAllocatedList(query);
		return initTableInfo(list, query);
	}

	/**
	 * 批量新增选择用户授权
	 */
	@Log(title = "角色管理", businessType = BusinessType.GRANT)
	@PostMapping("/authUser/grantAll")
	@ResponseBody
	public JsonResult grantAuthUserAll(String roleId, String userIds) {
		roleService.insertAuthUsers(roleId, Convert.toStrArray(userIds));
		return JsonResult.success();
	}
}