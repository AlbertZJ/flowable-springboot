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
import com.daffodil.system.entity.SysPost;
import com.daffodil.system.service.ISysPostService;
import com.daffodil.util.ExcelUtils;
import com.daffodil.util.text.Convert;

/**
 *  岗位信息控制层
 * @author yweijian
 * @date 2019年8月18日
 * @version 1.0
 */
@Controller
@RequestMapping("/system/post")
public class SysPostController extends SystemController {
	private String prefix = "system/post";

	@Autowired
	private ISysPostService postService;

	@RequiresPermissions("system:post:view")
	@GetMapping()
	public String operlog() {
		return prefix + "/post";
	}

	@SuppressWarnings("unchecked")
	@RequiresPermissions("system:post:list")
	@GetMapping("/list")
	@ResponseBody
	public TableInfo list(SysPost post) {
		initQuery(post, new Page());
		List<SysPost> list = postService.selectPostList(query);
		return initTableInfo(list, query);
	}

	@SuppressWarnings("unchecked")
	@Log(title = "岗位管理", businessType = BusinessType.EXPORT)
	@RequiresPermissions("system:post:export")
	@GetMapping("/export")
	@ResponseBody
	public JsonResult export(SysPost post) {
		initQuery(post);
		List<SysPost> list = postService.selectPostList(query);
		ExcelUtils<SysPost> util = new ExcelUtils<SysPost>(SysPost.class);
		return util.exportExcel(list, "岗位数据");
	}

	@RequiresPermissions("system:post:remove")
	@Log(title = "岗位管理", businessType = BusinessType.DELETE)
	@PostMapping("/remove")
	@ResponseBody
	public JsonResult remove(String ids) {
		postService.deletePostByIds(Convert.toStrArray(ids));
		return JsonResult.success();
	}

	/**
	 * 新增岗位
	 */
	@FormToken
	@GetMapping("/add")
	public String add() {
		return prefix + "/add";
	}

	/**
	 * 新增保存岗位
	 */
	@FormToken(TokenType.DESTROY)
	@RequiresPermissions("system:post:add")
	@Log(title = "岗位管理", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public JsonResult addSave(@Validated SysPost post) {
		postService.insertPost(post);
		return JsonResult.success();
	}

	/**
	 * 修改岗位
	 */
	@GetMapping("/edit/{postId}")
	public String edit(@PathVariable("postId") String postId, ModelMap modelMap) {
		modelMap.put("post", postService.selectPostById(postId));
		return prefix + "/edit";
	}

	/**
	 * 修改保存岗位
	 */
	@RequiresPermissions("system:post:edit")
	@Log(title = "岗位管理", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public JsonResult editSave(@Validated SysPost post) {
		postService.updatePost(post);
		return JsonResult.success();
	}

	/**
	 * 校验岗位名称
	 */
	@GetMapping("/checkPostNameUnique")
	@ResponseBody
	public String checkPostNameUnique(SysPost post) {
		return postService.checkPostNameUnique(post) ? "1" : "0";
	}

	/**
	 * 校验岗位编码
	 */
	@GetMapping("/checkPostCodeUnique")
	@ResponseBody
	public String checkPostCodeUnique(SysPost post) {
		return postService.checkPostCodeUnique(post) ? "1" : "0";
	}
}
