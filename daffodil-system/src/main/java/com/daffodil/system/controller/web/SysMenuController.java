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

import com.daffodil.core.annotation.FormToken;
import com.daffodil.core.annotation.FormToken.TokenType;
import com.daffodil.core.annotation.Log;
import com.daffodil.core.annotation.Log.BusinessType;
import com.daffodil.core.entity.JsonResult;
import com.daffodil.core.entity.TableInfo;
import com.daffodil.core.entity.Ztree;
import com.daffodil.system.controller.SystemController;
import com.daffodil.system.entity.SysMenu;
import com.daffodil.system.entity.SysRole;
import com.daffodil.system.service.ISysMenuService;
import com.daffodil.framework.shiro.util.ShiroUtils;

/**
 * 菜单信息控制层
 * 
 * @author yweijian
 * @date 2019年8月18日
 * @version 1.0
 */
@Controller
@RequestMapping("/system/menu")
public class SysMenuController extends SystemController {
	private String prefix = "system/menu";

	@Autowired
	private ISysMenuService menuService;

	@RequiresPermissions("system:menu:view")
	@GetMapping()
	public String menu() {
		return prefix + "/menu";
	}

	/**
	 * 菜单管理列表
	 * @param menu
	 * @return
	 */
	@RequiresPermissions("system:menu:list")
	@GetMapping("/list")
	@ResponseBody
	public TableInfo list(SysMenu menu) {
		String userId = ShiroUtils.getUserId();
		List<SysMenu> menuList = menuService.selectMenuList(menu, userId);
		return initTableInfo(menuList);
	}

	/**
	 * 删除菜单
	 */
	@Log(title = "菜单管理", businessType = BusinessType.DELETE)
	@RequiresPermissions("system:menu:remove")
	@PostMapping("/remove/{menuId}")
	@ResponseBody
	public JsonResult remove(@PathVariable("menuId") String menuId) {
		menuService.deleteMenuById(menuId);
		ShiroUtils.clearCachedAuthorizationInfo();
		return JsonResult.success();
	}

	/**
	 * 新增
	 */
	@FormToken
	@GetMapping("/add/{parentId}")
	public String add(@PathVariable("parentId") String parentId, ModelMap modelMap) {
		modelMap.put("menu", menuService.selectMenuById(parentId));
		return prefix + "/add";
	}

	/**
	 * 新增保存菜单
	 */
	@FormToken(TokenType.DESTROY)
	@Log(title = "菜单管理", businessType = BusinessType.INSERT)
	@RequiresPermissions("system:menu:add")
	@PostMapping("/add")
	@ResponseBody
	public JsonResult addSave(@Validated SysMenu menu) {
		menuService.insertMenu(menu);
		ShiroUtils.clearCachedAuthorizationInfo();
		return JsonResult.success();
	}

	/**
	 * 修改菜单
	 */
	@GetMapping("/edit/{menuId}")
	public String edit(@PathVariable("menuId") String menuId, ModelMap modelMap) {
		SysMenu menu = menuService.selectMenuById(menuId);
		modelMap.put("menu", menu);
		SysMenu parent = menuService.selectMenuById(menu.getParentId());
		modelMap.put("parent", parent);
		return prefix + "/edit";
	}

	/**
	 * 修改保存菜单
	 */
	@Log(title = "菜单管理", businessType = BusinessType.UPDATE)
	@RequiresPermissions("system:menu:edit")
	@PostMapping("/edit")
	@ResponseBody
	public JsonResult editSave(@Validated SysMenu menu) {
		menuService.updateMenu(menu);
		ShiroUtils.clearCachedAuthorizationInfo();
		return JsonResult.success();
	}

	/**
	 * 选择菜单图标
	 */
	@GetMapping("/icon")
	public String icon() {
		return prefix + "/icon";
	}

	/**
	 * 校验菜单名称
	 */
	@GetMapping("/checkMenuNameUnique")
	@ResponseBody
	public String checkMenuNameUnique(SysMenu menu) {
		return menuService.checkMenuNameUnique(menu) ? "1" : "0";
	}

	/**
	 * 加载角色菜单列表树
	 */
	@GetMapping("/roleMenuTreeData")
	@ResponseBody
	public List<Ztree> roleMenuTreeData(SysRole role) {
		String userId = ShiroUtils.getUserId();
		List<Ztree> ztrees = menuService.roleMenuTreeData(role, userId);
		return ztrees;
	}

	/**
	 * 加载所有菜单列表树
	 */
	@GetMapping("/menuTreeData")
	@ResponseBody
	public List<Ztree> menuTreeData() {
		String userId = ShiroUtils.getUserId();
		List<Ztree> ztrees = menuService.menuTreeData(userId);
		return ztrees;
	}

	/**
	 * 选择菜单树
	 */
	@GetMapping("/selectMenuTree/{menuId}")
	public String selectMenuTree(@PathVariable("menuId") String menuId, ModelMap modelMap) {
		modelMap.put("menu", menuService.selectMenuById(menuId));
		return prefix + "/tree";
	}
}