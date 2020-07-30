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
import com.daffodil.system.entity.SysDictionary;
import com.daffodil.system.service.ISysDictionaryService;

/**
 * 字典信息控制层
 * @author yweijian
 * @date 2020年3月18日
 * @project com.jdy.system.controller.web.SysDictionaryController.java
 * @version 2.0
 */
@Controller
@RequestMapping("/system/dictionary")
public class SysDictionaryController extends SystemController {
	private String prefix = "system/dictionary";

	@Autowired
	private ISysDictionaryService dictionaryService;

	@RequiresPermissions("system:dictionary:view")
	@GetMapping()
	public String dictionary() {
		return prefix + "/dictionary";
	}

	/**
	 * 字典管理列表
	 * @param dictionary
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequiresPermissions("system:dictionary:list")
	@GetMapping("/list")
	@ResponseBody
	public TableInfo list(SysDictionary dictionary) {
		initQuery(dictionary);
		List<SysDictionary> list = dictionaryService.selectDictionaryList(query);
		return initTableInfo(list);
	}

	/**
	 * 删除字典
	 */
	@Log(title = "字典管理", businessType = BusinessType.DELETE)
	@RequiresPermissions("system:dictionary:remove")
	@PostMapping("/remove/{dictId}")
	@ResponseBody
	public JsonResult remove(@PathVariable("dictId") String dictId) {
		dictionaryService.deleteDictionaryById(dictId);
		return JsonResult.success();
	}

	/**
	 * 新增
	 */
	@FormToken
	@GetMapping("/add/{parentId}")
	public String add(@PathVariable("parentId") String parentId, ModelMap modelMap) {
		modelMap.put("dictionary", dictionaryService.selectDictionaryById(parentId));
		return prefix + "/add";
	}

	/**
	 * 新增保存字典
	 */
	@FormToken(TokenType.DESTROY)
	@Log(title = "字典管理", businessType = BusinessType.INSERT)
	@RequiresPermissions("system:dictionary:add")
	@PostMapping("/add")
	@ResponseBody
	public JsonResult addSave(@Validated SysDictionary dictionary) {
		dictionaryService.insertDictionary(dictionary);
		return JsonResult.success();
	}

	/**
	 * 修改字典
	 */
	@GetMapping("/edit/{dictId}")
	public String edit(@PathVariable("dictId") String dictId, ModelMap modelMap) {
		SysDictionary dictionary = dictionaryService.selectDictionaryById(dictId);
		modelMap.put("dictionary", dictionary);
		SysDictionary parent = dictionaryService.selectDictionaryById(dictionary.getParentId());
		modelMap.put("parent", parent);
		return prefix + "/edit";
	}

	/**
	 * 修改保存字典
	 */
	@Log(title = "字典管理", businessType = BusinessType.UPDATE)
	@RequiresPermissions("system:dictionary:edit")
	@PostMapping("/edit")
	@ResponseBody
	public JsonResult editSave(@Validated SysDictionary dictionary) {
		dictionaryService.updateDictionary(dictionary);
		return JsonResult.success();
	}

	/**
	 * 校验字典目录键值唯一
	 */
	@GetMapping("/checkDictionaryLabelUnique")
	@ResponseBody
	public String checkDictionaryLabelUnique(SysDictionary dictionary) {
		return dictionaryService.checkDictionaryLabelUnique(dictionary) ? "1" : "0";
	}

	/**
	 * 加载所有字典列表的目录类型树
	 */
	@SuppressWarnings("unchecked")
	@GetMapping("/treeData")
	@ResponseBody
	public List<Ztree> treeData(SysDictionary dictionary) {
		initQuery(dictionary);
		List<Ztree> ztrees = dictionaryService.dictionaryTreeData(query);
		return ztrees;
	}

	/**
	 * 选择字典树
	 * @param dictId 亦或是 dictLabel
	 * @param modelMap
	 * @return
	 */
	@GetMapping("/tree/{dictId}")
	public String tree(@PathVariable("dictId") String dictId, ModelMap modelMap) {
		modelMap.put("dictionary", dictionaryService.selectDictionaryById(dictId));
		return prefix + "/tree";
	}
}