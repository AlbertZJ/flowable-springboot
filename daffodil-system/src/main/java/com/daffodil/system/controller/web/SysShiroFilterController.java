package com.daffodil.system.controller.web;

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
import com.daffodil.core.entity.JsonResult;
import com.daffodil.core.entity.Page;
import com.daffodil.core.entity.TableInfo;
import com.daffodil.system.controller.SystemController;
import com.daffodil.system.entity.SysShiroFilter;
import com.daffodil.system.service.ISysShiroFilterService;
import com.daffodil.util.text.Convert;

/**
 * 系统过滤约束配置 信息控制层
 * @author yweijian
 * @date 2020年2月15日
 * @version 1.0
 */
@Controller
@RequestMapping("/system/filter")
public class SysShiroFilterController extends SystemController {
	private String prefix = "system/filter";

	@Autowired
	private ISysShiroFilterService filterService;

	@RequiresPermissions("system:filter:view")
	@GetMapping()
	public String filter() {
		return prefix + "/filter";
	}

	/**
	 * 查询约束列表
	 */
	@SuppressWarnings("unchecked")
	@RequiresPermissions("system:filter:list")
	@GetMapping("/list")
	@ResponseBody
	public TableInfo list(SysShiroFilter filter) {
		initQuery(filter, new Page());
		List<SysShiroFilter> list = filterService.selectShiroFilterList(query);
		return initTableInfo(list, query);
	}

	/**
	 * 新增约束
	 */
	@FormToken
	@GetMapping("/add")
	public String add() {
		return prefix + "/add";
	}

	/**
	 * 新增保存约束
	 */
	@FormToken(TokenType.DESTROY)
	@RequiresPermissions("system:filter:add")
	@Log(title = "约束管理", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public JsonResult addSave(SysShiroFilter filter) {
		filterService.insertShiroFilter(filter);
		return JsonResult.success();
	}

	/**
	 * 修改约束
	 */
	@GetMapping("/edit/{filterId}")
	public String edit(@PathVariable("filterId") String filterId, ModelMap modelMap) {
		modelMap.put("filter", filterService.selectShiroFilterById(filterId));
		return prefix + "/edit";
	}

	/**
	 * 修改保存约束
	 */
	@RequiresPermissions("system:filter:edit")
	@Log(title = "约束管理", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public JsonResult editSave(SysShiroFilter filter) {
		filterService.updateShiroFilter(filter);
		return JsonResult.success();
	}

	/**
	 * 删除约束
	 */
	@RequiresPermissions("system:filter:remove")
	@Log(title = "约束管理", businessType = BusinessType.DELETE)
	@PostMapping("/remove")
	@ResponseBody
	public JsonResult remove(String ids) {
		filterService.deleteShiroFilterByIds(Convert.toStrArray(ids));
		return JsonResult.success();
	}
}
