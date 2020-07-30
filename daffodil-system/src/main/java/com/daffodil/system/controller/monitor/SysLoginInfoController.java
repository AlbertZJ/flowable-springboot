package com.daffodil.system.controller.monitor;

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
import com.daffodil.core.entity.JsonResult;
import com.daffodil.core.entity.Page;
import com.daffodil.core.entity.TableInfo;
import com.daffodil.util.ExcelUtils;
import com.daffodil.system.controller.SystemController;
import com.daffodil.system.entity.SysLoginInfo;
import com.daffodil.system.service.ISysLoginInfoService;
import com.daffodil.util.text.Convert;

/**
 * 系统访问记录
 * 
 * @author yweijian
 * @date 2019年8月23日
 * @version 1.0
 */
@Controller
@RequestMapping("/monitor/logininfo")
public class SysLoginInfoController extends SystemController {
	private String prefix = "monitor/logininfo";

	@Autowired
	private ISysLoginInfoService loginInfoService;

	@RequiresPermissions("monitor:logininfo:view")
	@GetMapping()
	public String logininfo() {
		return prefix + "/logininfo";
	}

	@SuppressWarnings("unchecked")
	@RequiresPermissions("monitor:logininfo:list")
	@GetMapping("/list")
	@ResponseBody
	public TableInfo list(SysLoginInfo loginInfo) {
		initQuery(loginInfo, new Page());
		List<SysLoginInfo> list = loginInfoService.selectLoginInfoList(query);
		return initTableInfo(list, query);
	}

	@SuppressWarnings("unchecked")
	@Log(title = "登陆日志", businessType = BusinessType.EXPORT)
	@RequiresPermissions("monitor:logininfo:export")
	@GetMapping("/export")
	@ResponseBody
	public JsonResult export(SysLoginInfo loginInfo) {
		initQuery(loginInfo);
		List<SysLoginInfo> list = loginInfoService.selectLoginInfoList(query);
		ExcelUtils<SysLoginInfo> util = new ExcelUtils<SysLoginInfo>(SysLoginInfo.class);
		return util.exportExcel(list, "登陆日志");
	}

	@RequiresPermissions("monitor:logininfo:remove")
	@Log(title = "登陆日志", businessType = BusinessType.DELETE)
	@PostMapping("/remove")
	@ResponseBody
	public JsonResult remove(String ids) {
		loginInfoService.deleteLoginInfoByIds(Convert.toStrArray(ids));
		return JsonResult.success();
	}

	@RequiresPermissions("monitor:logininfo:remove")
	@Log(title = "登陆日志", businessType = BusinessType.CLEAN)
	@PostMapping("/clean")
	@ResponseBody
	public JsonResult clean() {
		loginInfoService.cleanLoginInfo();
		return JsonResult.success();
	}
}
