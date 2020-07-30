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
import com.daffodil.core.entity.Page;
import com.daffodil.core.entity.TableInfo;
import com.daffodil.system.controller.SystemController;
import com.daffodil.system.entity.SysConfig;
import com.daffodil.system.service.ISysConfigService;
import com.daffodil.util.ExcelUtils;
import com.daffodil.util.text.Convert;

/**
 * 参数配置控制层
 * @author yweijian
 * @date 2019年8月18日
 * @version 1.0
 */
@Controller
@RequestMapping("/system/config")
public class SysConfigController extends SystemController {
	private String prefix = "system/config";

	@Autowired
	private ISysConfigService configService;

	@RequiresPermissions("system:config:view")
	@GetMapping()
	public String config() {
		return prefix + "/config";
	}

	/**
	 * 查询参数配置列表
	 */
	@SuppressWarnings("unchecked")
	@RequiresPermissions("system:config:list")
	@GetMapping("/list")
	@ResponseBody
	public TableInfo list(SysConfig config) {
		initQuery(config, new Page());
		List<SysConfig> list = configService.selectConfigList(query);
		return initTableInfo(list, query);
	}

	@SuppressWarnings("unchecked")
	@Log(title = "参数管理", businessType = BusinessType.EXPORT)
	@RequiresPermissions("system:config:export")
	@GetMapping("/export")
	@ResponseBody
	public JsonResult export(SysConfig config) {
		initQuery(config);
		List<SysConfig> list = configService.selectConfigList(query);
		ExcelUtils<SysConfig> util = new ExcelUtils<SysConfig>(SysConfig.class);
		return util.exportExcel(list, "参数数据");
	}

	/**
	 * 新增参数配置
	 */
	@FormToken
	@GetMapping("/add")
	public String add() {
		return prefix + "/add";
	}

	/**
	 * 新增保存参数配置
	 */
	@FormToken(TokenType.DESTROY)
	@RequiresPermissions("system:config:add")
	@Log(title = "参数管理", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public JsonResult addSave(@Validated SysConfig config) {
		configService.insertConfig(config);
		return JsonResult.success();
	}

	/**
	 * 修改参数配置
	 */
	@GetMapping("/edit/{configId}")
	public String edit(@PathVariable("configId") String configId, ModelMap mmap) {
		mmap.put("config", configService.selectConfigById(configId));
		return prefix + "/edit";
	}

	/**
	 * 修改保存参数配置
	 */
	@RequiresPermissions("system:config:edit")
	@Log(title = "参数管理", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public JsonResult editSave(@Validated SysConfig config) {
		configService.updateConfig(config);
		return JsonResult.success();
	}

	/**
	 * 删除参数配置
	 */
	@RequiresPermissions("system:config:remove")
	@Log(title = "参数管理", businessType = BusinessType.DELETE)
	@PostMapping("/remove")
	@ResponseBody
	public JsonResult remove(String ids) {
		configService.deleteConfigByIds(Convert.toStrArray(ids));
		return JsonResult.success();
	}

	/**
	 * 校验参数键名
	 */
	@GetMapping("/checkConfigKeyUnique")
	@ResponseBody
	public String checkConfigKeyUnique(SysConfig config) {
		return configService.checkConfigKeyUnique(config) ? "1" : "0";
	}
}
