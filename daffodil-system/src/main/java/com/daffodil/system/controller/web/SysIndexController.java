package com.daffodil.system.controller.web;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import com.daffodil.system.controller.SystemController;
import com.daffodil.system.entity.SysMenu;
import com.daffodil.system.entity.SysUser;
import com.daffodil.system.service.ISysMenuService;
import com.daffodil.framework.shiro.util.ShiroUtils;

/**
 * 首页控制层
 * @author yweijian
 * @date 2019年8月18日
 * @version 1.0
 */
@Controller
public class SysIndexController extends SystemController{
	
	@Autowired
	private ISysMenuService menuService;

	/**
	 * 系统首页
	 * @param modelMap
	 * @return
	 */
	@GetMapping("/index")
	public String index(ModelMap modelMap) {
		SysUser user = ShiroUtils.getSysUser();
		List<SysMenu> menus = menuService.selectMenuList();
		modelMap.put("menus", menus);
		modelMap.put("user", user);
		return "index";
	}

	/**
	 * 系统简介
	 * @param modelMap
	 * @return
	 */
	@GetMapping("/system/main")
	public String main(ModelMap modelMap) {
		return "main";
	}
	
}
