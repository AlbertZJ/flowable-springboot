package com.daffodil.system.controller.monitor;

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

import com.daffodil.core.annotation.Log;
import com.daffodil.core.annotation.Log.BusinessType;
import com.daffodil.core.entity.JsonResult;
import com.daffodil.core.entity.Page;
import com.daffodil.core.entity.TableInfo;
import com.daffodil.util.ExcelUtils;
import com.daffodil.system.controller.SystemController;
import com.daffodil.system.entity.SysOperLog;
import com.daffodil.system.service.ISysOperLogService;
import com.daffodil.util.text.Convert;

/**
 * 操作日志记录
 * 
 * @author yweijian
 * @date 2019年8月23日
 * @version 1.0
 */
@Controller
@RequestMapping("/monitor/operlog")
public class SysOperlogController extends SystemController {
	private String prefix = "monitor/operlog";

	@Autowired
	private ISysOperLogService operLogService;

	@RequiresPermissions("monitor:operlog:view")
	@GetMapping()
	public String operlog() {
		return prefix + "/operlog";
	}

	@SuppressWarnings("unchecked")
	@RequiresPermissions("monitor:operlog:list")
	@GetMapping("/list")
	@ResponseBody
	public TableInfo list(SysOperLog operLog) {
		initQuery(operLog, new Page());
		List<SysOperLog> list = operLogService.selectOperLogList(query);
		return initTableInfo(list, query);
	}

	@SuppressWarnings("unchecked")
	@Log(title = "操作日志", businessType = BusinessType.EXPORT)
	@RequiresPermissions("monitor:operlog:export")
	@GetMapping("/export")
	@ResponseBody
	public JsonResult export(SysOperLog operLog) {
		initQuery(operLog);
		List<SysOperLog> list = operLogService.selectOperLogList(query);
		ExcelUtils<SysOperLog> util = new ExcelUtils<SysOperLog>(SysOperLog.class);
		return util.exportExcel(list, "操作日志");
	}

	@RequiresPermissions("monitor:operlog:remove")
	@PostMapping("/remove")
	@ResponseBody
	public JsonResult remove(String ids) {
		operLogService.deleteOperLogByIds(Convert.toStrArray(ids));
		return JsonResult.success();
	}

	@RequiresPermissions("monitor:operlog:detail")
	@GetMapping("/detail/{operId}")
	public String detail(@PathVariable("operId") String operId, ModelMap mmap) {
		mmap.put("operLog", operLogService.selectOperLogById(operId));
		return prefix + "/detail";
	}

	@Log(title = "操作日志", businessType = BusinessType.CLEAN)
	@RequiresPermissions("monitor:operlog:remove")
	@PostMapping("/clean")
	@ResponseBody
	public JsonResult clean() {
		operLogService.cleanOperLog();
		return JsonResult.success();
	}
}
