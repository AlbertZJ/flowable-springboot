package com.daffodil.generator.controller;

import java.util.List;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.daffodil.core.annotation.Log;
import com.daffodil.core.annotation.Log.BusinessType;
import com.daffodil.core.controller.BaseController;
import com.daffodil.core.entity.JsonResult;
import com.daffodil.core.entity.TableInfo;
import com.daffodil.generator.entity.GenTableColumn;
import com.daffodil.generator.service.IGenTableColumnService;
import com.daffodil.util.text.Convert;

/**
 * 数据库表字段 信息控制层
 * @author yweijian
 * @date 2020年5月19日
 * @version 1.0
 */
@Controller
@RequestMapping("/devtool/table/column")
public class GenTableColumnController extends BaseController {
	
	@Autowired
	private IGenTableColumnService tableColumnService;

	/**
	 * 查询数据库字段表列表
	 */
	@SuppressWarnings("unchecked")
	@RequiresPermissions("devtool:column:list")
	@GetMapping("/list")
	@ResponseBody
	public TableInfo list(GenTableColumn tableColumn) {
		initQuery(tableColumn);
		List<GenTableColumn> list = tableColumnService.selectGenTableColumnList(query);
		return initTableInfo(list);
	}

	/**
	 * 新增保存数据库字段表
	 * @param ids 元数据ID
	 * @param tableId 数据库表ID
	 * @return
	 */
	@RequiresPermissions("devtool:column:add")
	@Log(title = "数据库字段表", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public JsonResult addSave(String[] columnIds, String tableId) {
		tableColumnService.insertGenTableColumnByIds(columnIds, tableId);
		return JsonResult.success();
	}

	/**
	 * 修改保存数据库字段表
	 */
	@RequiresPermissions("devtool:column:edit")
	@Log(title = "数据库字段表", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public JsonResult editSave(GenTableColumn tableColumn) {
		tableColumnService.updateGenTableColumn(tableColumn);
		return JsonResult.success();
	}

	/**
	 * 删除数据库字段表
	 */
	@RequiresPermissions("devtool:column:remove")
	@Log(title = "数据库字段表", businessType = BusinessType.DELETE)
	@PostMapping("/remove")
	@ResponseBody
	public JsonResult remove(String ids) {
		tableColumnService.deleteGenTableColumnByIds(Convert.toStrArray(ids));
		return JsonResult.success();
	}
}
