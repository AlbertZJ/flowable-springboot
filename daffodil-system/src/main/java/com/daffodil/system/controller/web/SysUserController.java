package com.daffodil.system.controller.web;

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
import org.springframework.web.multipart.MultipartFile;

import com.daffodil.core.annotation.FormToken;
import com.daffodil.core.annotation.FormToken.TokenType;
import com.daffodil.core.annotation.Log;
import com.daffodil.core.annotation.Log.BusinessType;
import com.daffodil.core.entity.JsonResult;
import com.daffodil.core.entity.Page;
import com.daffodil.core.entity.TableInfo;
import com.daffodil.framework.shiro.util.ShiroUtils;
import com.daffodil.system.controller.SystemController;
import com.daffodil.system.entity.SysDept;
import com.daffodil.system.entity.SysPost;
import com.daffodil.system.entity.SysRole;
import com.daffodil.system.entity.SysUser;
import com.daffodil.system.service.ISysDeptService;
import com.daffodil.system.service.ISysPostService;
import com.daffodil.system.service.ISysRoleService;
import com.daffodil.system.service.ISysUserService;
import com.daffodil.util.ExcelUtils;
import com.daffodil.util.text.Convert;

/**
 * 系统用户控制层
 * @author yweijian
 * @date 2019年8月18日
 * @version 1.0
 */
@Controller
@RequestMapping("/system/user")
public class SysUserController extends SystemController {
	
	private String prefix = "system/user";
	
	@Autowired
	private ISysUserService userService;
	
	@Autowired
	private ISysDeptService deptService;

	@Autowired
	private ISysRoleService roleService;

	@Autowired
	private ISysPostService postService;

	@RequiresPermissions("system:user:view")
	@GetMapping()
	public String user() {
		return prefix + "/user";
	}

	@SuppressWarnings("unchecked")
	@RequiresPermissions("system:user:list")
	@GetMapping("/list")
	@ResponseBody
	public TableInfo list(SysUser user) {
		initQuery(user, new Page());
		List<SysUser> list = userService.selectUserList(query);
		return initTableInfo(list, query);
	}

	@SuppressWarnings("unchecked")
	@Log(title = "用户管理", businessType = BusinessType.EXPORT)
	@RequiresPermissions("system:user:export")
	@GetMapping("/export")
	@ResponseBody
	public JsonResult export(SysUser user) {
		initQuery(user);
		List<SysUser> list = userService.selectUserList(query);
		ExcelUtils<SysUser> util = new ExcelUtils<SysUser>(SysUser.class);
		return util.exportExcel(list, "用户数据");
	}

	@Log(title = "用户管理", businessType = BusinessType.IMPORT)
	@RequiresPermissions("system:user:import")
	@PostMapping("/importData")
	@ResponseBody
	public JsonResult importData(MultipartFile file, boolean updateSupport) throws Exception {
		ExcelUtils<SysUser> util = new ExcelUtils<SysUser>(SysUser.class);
		List<SysUser> userList = util.importExcel(file.getInputStream());
		String operName = ShiroUtils.getSysUser().getLoginName();
		String message = userService.importUser(userList, updateSupport, operName);
		return JsonResult.success(message);
	}

	@RequiresPermissions("system:user:view")
	@GetMapping("/importTemplate")
	@ResponseBody
	public JsonResult importTemplate() {
		ExcelUtils<SysUser> util = new ExcelUtils<SysUser>(SysUser.class);
		return util.importTemplateExcel("用户数据");
	}

	/**
	 * 新增用户
	 */
	@SuppressWarnings("unchecked")
	@FormToken
	@GetMapping("/add")
	public String add(ModelMap modelMap) {
		initQuery(new SysRole());
		modelMap.put("roles", roleService.selectRoleList(query));
		initQuery(new SysPost());
		modelMap.put("posts", postService.selectPostList(query));
		return prefix + "/add";
	}

	/**
	 * 新增保存用户
	 */
	@FormToken(TokenType.DESTROY)
	@RequiresPermissions("system:user:add")
	@Log(title = "用户管理", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public JsonResult addSave(@Validated SysUser user) {
		userService.insertUser(user);
		return JsonResult.success();
	}

	/**
	 * 修改用户
	 */
	@GetMapping("/edit/{userId}")
	public String edit(@PathVariable("userId") String userId, ModelMap modelMap) {
		SysUser user = userService.selectUserById(userId);
		modelMap.put("user", user);
		SysDept dept = deptService.selectDeptById(user.getDeptId());
		modelMap.put("dept", dept);
		modelMap.put("roles", roleService.selectRolesByUserId(userId));
		modelMap.put("posts", postService.selectPostsByUserId(userId));
		return prefix + "/edit";
	}

	/**
	 * 修改保存用户
	 */
	@RequiresPermissions("system:user:edit")
	@Log(title = "用户管理", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public JsonResult editSave(@Validated SysUser user) {
		userService.updateUser(user);
		return JsonResult.success();
	}

	@GetMapping("/resetPwd/{userId}")
	public String resetPwd(@PathVariable("userId") String userId, ModelMap modelMap) {
		modelMap.put("user", userService.selectUserById(userId));
		return prefix + "/resetPwd";
	}

	@RequiresPermissions("system:user:resetPwd")
	@Log(title = "重置密码", businessType = BusinessType.UPDATE)
	@PostMapping("/resetPwd")
	@ResponseBody
	public JsonResult resetPwdSave(SysUser user) {
		user.setSalt(ShiroUtils.randomSalt());
		user.setPassword(ShiroUtils.encryptPassword(user.getLoginName(), user.getPassword(), user.getSalt()));
		userService.resetUserPwd(user);
		if (ShiroUtils.getUserId() == user.getId()) {
			ShiroUtils.setSysUser(userService.selectUserById(user.getId()));
		}
		return JsonResult.success();
	}

	@RequiresPermissions("system:user:remove")
	@Log(title = "用户管理", businessType = BusinessType.DELETE)
	@PostMapping("/remove")
	@ResponseBody
	public JsonResult remove(String ids) {
		userService.deleteUserByIds(Convert.toStrArray(ids));
		return JsonResult.success();
	}

	/**
	 * 校验用户名
	 */
	@GetMapping("/checkLoginNameUnique")
	@ResponseBody
	public String checkLoginNameUnique(SysUser user) {
		return userService.checkLoginNameUnique(user) ? "1" : "0";
	}

	/**
	 * 校验手机号码
	 */
	@GetMapping("/checkPhoneUnique")
	@ResponseBody
	public String checkPhoneUnique(SysUser user) {
		return userService.checkPhoneUnique(user) ? "1" : "0";
	}

	/**
	 * 校验email邮箱
	 */
	@GetMapping("/checkEmailUnique")
	@ResponseBody
	public String checkEmailUnique(SysUser user) {
		return userService.checkEmailUnique(user) ? "1" : "0";
	}
}