package com.daffodil.generator.controller;

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
import com.daffodil.generator.entity.GenMetaData;
import com.daffodil.generator.service.IGenMetaDataService;
import com.daffodil.util.text.Convert;

/**
 * 元数据 信息控制层
 * @author yweijian
 * @date 2020年5月15日
 * @version 1.0
 */
@Controller
@RequestMapping("/devtool/metadata")
public class GenMetaDataController extends BaseController {
	private String prefix = "devtool/metadata";

	@Autowired
	private IGenMetaDataService metaDataService;

	@RequiresPermissions("devtool:metadata:view")
	@GetMapping()
	public String metaData() {
		return prefix + "/metadata";
	}
	
	/**
	 * 添加字段
	 * @return
	 */
	@RequiresPermissions("devtool:metadata:view")
	@GetMapping("/select/{tableId}")
	public String selectMetaData(@PathVariable("tableId") String tableId, ModelMap modelMap) {
		modelMap.put("tableId", tableId);
		return prefix + "/metadata";
	}

	/**
	 * 查询元数据列表
	 */
	@SuppressWarnings("unchecked")
	@RequiresPermissions("devtool:metadata:list")
	@GetMapping("/list")
	@ResponseBody
	public TableInfo list(GenMetaData metaData) {
		initQuery(metaData, new Page());
		List<GenMetaData> list = metaDataService.selectGenMetaDataList(query);
		return initTableInfo(list, query);
	}

	/**
	 * 新增元数据
	 */
	@FormToken
	@GetMapping("/add")
	public String add() {
		return prefix + "/add";
	}

	/**
	 * 新增保存元数据
	 */
	@FormToken(TokenType.DESTROY)
	@RequiresPermissions("devtool:metadata:add")
	@Log(title = "元数据", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public JsonResult addSave(GenMetaData metaData) {
		metaDataService.insertGenMetaData(metaData);
		return JsonResult.success();
	}

	/**
	 * 修改元数据
	 */
	@GetMapping("/edit/{metaDataId}")
	public String edit(@PathVariable("metaDataId") String metaDataId, ModelMap modelMap) {
		modelMap.put("metaData", metaDataService.selectGenMetaDataById(metaDataId));
		return prefix + "/edit";
	}

	/**
	 * 修改保存元数据
	 */
	@RequiresPermissions("devtool:metadata:edit")
	@Log(title = "元数据", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public JsonResult editSave(GenMetaData metaData) {
		metaDataService.updateGenMetaData(metaData);
		return JsonResult.success();
	}

	/**
	 * 删除元数据
	 */
	@RequiresPermissions("devtool:metadata:remove")
	@Log(title = "元数据", businessType = BusinessType.DELETE)
	@PostMapping("/remove")
	@ResponseBody
	public JsonResult remove(String ids) {
		metaDataService.deleteGenMetaDataByIds(Convert.toStrArray(ids));
		return JsonResult.success();
	}
}
