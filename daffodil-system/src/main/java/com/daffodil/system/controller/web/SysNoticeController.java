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
import com.daffodil.system.entity.SysNotice;
import com.daffodil.system.service.ISysNoticeService;
import com.daffodil.util.text.Convert;

/**
 * 公告 信息控制层
 * 
 * @author yweijian
 * @date 2019年8月18日
 * @version 1.0
 */
@Controller
@RequestMapping("/system/notice")
public class SysNoticeController extends SystemController {
	private String prefix = "system/notice";

	@Autowired
	private ISysNoticeService noticeService;

	@RequiresPermissions("system:notice:view")
	@GetMapping()
	public String notice() {
		return prefix + "/notice";
	}

	/**
	 * 查询公告列表
	 */
	@SuppressWarnings("unchecked")
	@RequiresPermissions("system:notice:list")
	@GetMapping("/list")
	@ResponseBody
	public TableInfo list(SysNotice notice) {
		initQuery(notice, new Page());
		List<SysNotice> list = noticeService.selectNoticeList(query);
		return initTableInfo(list, query);
	}

	/**
	 * 新增公告
	 */
	@FormToken
	@GetMapping("/add")
	public String add() {
		return prefix + "/add";
	}

	/**
	 * 新增保存公告
	 */
	@FormToken(TokenType.DESTROY)
	@RequiresPermissions("system:notice:add")
	@Log(title = "通知公告", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public JsonResult addSave(SysNotice notice) {
		noticeService.insertNotice(notice);
		return JsonResult.success();
	}

	/**
	 * 修改公告
	 */
	@GetMapping("/edit/{noticeId}")
	public String edit(@PathVariable("noticeId") String noticeId, ModelMap modelMap) {
		modelMap.put("notice", noticeService.selectNoticeById(noticeId));
		return prefix + "/edit";
	}

	/**
	 * 修改保存公告
	 */
	@RequiresPermissions("system:notice:edit")
	@Log(title = "通知公告", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public JsonResult editSave(SysNotice notice) {
		noticeService.updateNotice(notice);
		return JsonResult.success();
	}

	/**
	 * 删除公告
	 */
	@RequiresPermissions("system:notice:remove")
	@Log(title = "通知公告", businessType = BusinessType.DELETE)
	@PostMapping("/remove")
	@ResponseBody
	public JsonResult remove(String ids) {
		noticeService.deleteNoticeByIds(Convert.toStrArray(ids));
		return JsonResult.success();
	}
}
