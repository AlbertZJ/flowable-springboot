package com.daffodil.system.controller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.daffodil.core.annotation.Log;
import com.daffodil.core.annotation.Log.BusinessType;
import com.daffodil.core.entity.JsonResult;
import com.daffodil.system.controller.SystemController;
import com.daffodil.system.entity.SysUser;
import com.daffodil.system.service.ISysUserService;
import com.daffodil.framework.shiro.util.ShiroUtils;
import com.daffodil.util.StringUtils;
import com.daffodil.util.file.FileUploadUtils;

/**
 * 个人信息控制层
 * 
 * @author yweijian
 * @date 2019年8月18日
 * @version 1.0
 */
@Controller
@RequestMapping("/system/user/profile")
public class SysProfileController extends SystemController {

	private String prefix = "system/user/profile";

	@Autowired
	private ISysUserService userService;

	/**
	 * 个人信息
	 */
	@GetMapping()
	public String profile(ModelMap modelMap) {
		SysUser user = ShiroUtils.getSysUser();
		modelMap.put("user", user);
		modelMap.put("roleGroup", userService.selectUserRoleGroup(user.getId()));
		modelMap.put("postGroup", userService.selectUserPostGroup(user.getId()));
		return prefix + "/profile";
	}

	@GetMapping("/checkPassword")
	@ResponseBody
	public boolean checkPassword(String password) {
		SysUser user = ShiroUtils.getSysUser();
		password = ShiroUtils.encryptPassword(user.getLoginName(), password, user.getSalt());
		if (user.getPassword().equals(password)) {
			return true;
		}
		return false;
	}

	@GetMapping("/resetPwd")
	public String resetPwd(ModelMap modelMap) {
		SysUser user = ShiroUtils.getSysUser();
		modelMap.put("user", userService.selectUserById(user.getId()));
		return prefix + "/resetPwd";
	}

	@Log(title = "重置密码", businessType = BusinessType.UPDATE)
	@PostMapping("/resetPwd")
	@ResponseBody
	public JsonResult resetPwd(String oldPassword, String newPassword) {
		SysUser user = ShiroUtils.getSysUser();
		oldPassword = ShiroUtils.encryptPassword(user.getLoginName(), oldPassword, user.getSalt());
		if (StringUtils.isNotEmpty(newPassword) && user.getPassword().equals(oldPassword)) {
			user.setSalt(ShiroUtils.randomSalt());
			user.setPassword(ShiroUtils.encryptPassword(user.getLoginName(), newPassword, user.getSalt()));
			userService.resetUserPwd(user);
			ShiroUtils.setSysUser(userService.selectUserById(user.getId()));
			return JsonResult.success();
		} else {
			return JsonResult.warn("修改密码失败，原始密码错误");
		}
	}

	/**
	 * 修改用户
	 */
	@GetMapping("/edit")
	public String edit(ModelMap modelMap) {
		SysUser user = ShiroUtils.getSysUser();
		modelMap.put("user", userService.selectUserById(user.getId()));
		return prefix + "/edit";
	}

	/**
	 * 修改头像
	 */
	@GetMapping("/avatar")
	public String avatar(ModelMap modelMap) {
		SysUser user = ShiroUtils.getSysUser();
		modelMap.put("user", userService.selectUserById(user.getId()));
		return prefix + "/avatar";
	}

	/**
	 * 修改用户
	 */
	@Log(title = "个人信息", businessType = BusinessType.UPDATE)
	@PostMapping("/update")
	@ResponseBody
	public JsonResult update(SysUser user) {
		SysUser currentUser = ShiroUtils.getSysUser();
		currentUser.setUserName(user.getUserName());
		currentUser.setEmail(user.getEmail());
		currentUser.setPhone(user.getPhone());
		currentUser.setSex(user.getSex());
		userService.updateUserInfo(currentUser);
		ShiroUtils.setSysUser(userService.selectUserById(currentUser.getId()));
		return JsonResult.success();
	}

	/**
	 * 保存头像
	 */
	@Log(title = "个人信息", businessType = BusinessType.UPDATE)
	@PostMapping("/updateAvatar")
	@ResponseBody
	public JsonResult updateAvatar(@RequestParam("avatarfile") MultipartFile file) {
		SysUser currentUser = ShiroUtils.getSysUser();
		try {
			if (!file.isEmpty()) {
				String avatar = FileUploadUtils.upload(file);
				currentUser.setAvatar(avatar);
				userService.updateUserInfo(currentUser);
				ShiroUtils.setSysUser(userService.selectUserById(currentUser.getId()));
				return JsonResult.success();
			}
			return JsonResult.error();
		} catch (Exception e) {
			return JsonResult.error(e.getMessage());
		}
	}
}
