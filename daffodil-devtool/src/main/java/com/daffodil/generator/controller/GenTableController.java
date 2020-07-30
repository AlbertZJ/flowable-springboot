package com.daffodil.generator.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
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
import com.daffodil.generator.entity.GenTable;
import com.daffodil.generator.service.IGenTableService;
import com.daffodil.util.text.Convert;

/**
 * 数据库表 信息控制层
 * @author yweijian
 * @date 2020年5月15日
 * @version 1.0
 */
@Controller
@RequestMapping("/devtool/table")
public class GenTableController extends BaseController {
	private String prefix = "devtool/table";

	@Autowired
	private IGenTableService tableService;

	@RequiresPermissions("devtool:table:view")
	@GetMapping()
	public String table() {
		return prefix + "/table";
	}

	/**
	 * 查询数据库表列表
	 */
	@SuppressWarnings("unchecked")
	@RequiresPermissions("devtool:table:list")
	@GetMapping("/list")
	@ResponseBody
	public TableInfo list(GenTable table) {
		initQuery(table, new Page());
		List<GenTable> list = tableService.selectGenTableList(query);
		return initTableInfo(list, query);
	}

	/**
	 * 新增数据库表
	 */
	@FormToken
	@GetMapping("/add")
	public String add() {
		return prefix + "/add";
	}

	/**
	 * 新增保存数据库表
	 */
	@FormToken(TokenType.DESTROY)
	@RequiresPermissions("devtool:table:add")
	@Log(title = "数据库表", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public JsonResult addSave(GenTable table) {
		tableService.insertGenTable(table);
		return JsonResult.success();
	}

	/**
	 * 修改数据库表
	 */
	@GetMapping("/edit/{tableId}")
	public String edit(@PathVariable("tableId") String tableId, ModelMap modelMap) {
		modelMap.put("table", tableService.selectGenTableById(tableId));
		return prefix + "/edit";
	}

	/**
	 * 修改保存数据库表
	 */
	@RequiresPermissions("devtool:table:edit")
	@Log(title = "数据库表", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public JsonResult editSave(GenTable table) {
		tableService.updateGenTable(table);
		return JsonResult.success();
	}

	/**
	 * 删除数据库表
	 */
	@RequiresPermissions("devtool:table:remove")
	@Log(title = "数据库表", businessType = BusinessType.DELETE)
	@PostMapping("/remove")
	@ResponseBody
	public JsonResult remove(String ids) {
		tableService.deleteGenTableByIds(Convert.toStrArray(ids));
		return JsonResult.success();
	}
	
	/**
	 * 预览代码
	 */
	@RequiresPermissions("devtool:table:preview")
	@GetMapping("/preview/{tableId}")
	@ResponseBody
	public JsonResult preview(@PathVariable("tableId") String tableId){
		Map<String, String> data = tableService.previewGenTableCode(tableId);
		return JsonResult.success(data);
	}
	
	/**
	 * 生成代码
	 */
	@RequiresPermissions("devtool:table:generate")
	@GetMapping("/generate/{tableId}")
	@ResponseBody
	public void generate(@PathVariable("tableId") String tableId, HttpServletResponse response) throws IOException {
		byte[] data = tableService.generateGenTableCode(tableId);
		response.reset();
		response.setHeader("Content-Disposition", "attachment; filename=\"code_V_" + new Date().getTime() + ".zip\"");
		response.addHeader("Content-Length", "" + data.length);
		response.setContentType("application/octet-stream; charset=UTF-8");
		IOUtils.write(data, response.getOutputStream());
	}
}
