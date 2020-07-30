package com.daffodil.system.controller.monitor;

import java.util.List;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.daffodil.core.annotation.Log;
import com.daffodil.core.annotation.Log.BusinessType;
import com.daffodil.core.entity.JsonResult;
import com.daffodil.core.entity.Page;
import com.daffodil.core.entity.TableInfo;
import com.daffodil.core.enums.OnlineStatus;
import com.daffodil.system.controller.SystemController;
import com.daffodil.system.entity.SysUserOnline;
import com.daffodil.system.service.ISysUserOnlineService;
import com.daffodil.framework.shiro.session.OnlineSession;
import com.daffodil.framework.shiro.session.OnlineSessionDao;
import com.daffodil.framework.shiro.util.ShiroUtils;

/**
 * 在线用户监控
 * 
 * @author yweijian
 * @date 2019年8月23日
 * @version 1.0
 */
@Controller
@RequestMapping("/monitor/online")
public class SysUserOnlineController extends SystemController {
	private String prefix = "monitor/online";

	@Autowired
	private ISysUserOnlineService onlineService;

	@Autowired
	private OnlineSessionDao sessionService;

	@RequiresPermissions("monitor:online:view")
	@GetMapping()
	public String online() {
		return prefix + "/online";
	}

	@SuppressWarnings("unchecked")
	@RequiresPermissions("monitor:online:list")
	@GetMapping("/list")
	@ResponseBody
	public TableInfo list(SysUserOnline userOnline) {
		initQuery(userOnline, new Page());
		List<SysUserOnline> list = onlineService.selectUserOnlineList(query);
		return initTableInfo(list, query);
	}

	@RequiresPermissions("monitor:online:batchForceLogout")
	@Log(title = "在线用户", businessType = BusinessType.FORCE)
	@PostMapping("/batchForceLogout")
	@ResponseBody
	public JsonResult batchForceLogout(@RequestParam("ids[]") String[] ids) {
		for (String sessionId : ids) {
			SysUserOnline online = onlineService.selectOnlineById(sessionId);
			if (online == null) {
				return JsonResult.error("用户已下线");
			}
			OnlineSession onlineSession = (OnlineSession) sessionService.readSession(online.getId());
			if (onlineSession == null) {
				return JsonResult.error("用户已下线");
			}
			if (sessionId.equals(ShiroUtils.getSessionId())) {
				return JsonResult.error("当前登陆用户无法强退");
			}
			
			onlineSession.setStatus(OnlineStatus.OFF_LINE);
			sessionService.update(onlineSession);
			
			online.setStatus(OnlineStatus.OFF_LINE);
			onlineService.insertOnline(online);
		}
		return JsonResult.success();
	}

	@RequiresPermissions("monitor:online:forceLogout")
	@Log(title = "在线用户", businessType = BusinessType.FORCE)
	@PostMapping("/forceLogout")
	@ResponseBody
	public JsonResult forceLogout(String sessionId) {
		SysUserOnline online = onlineService.selectOnlineById(sessionId);
		if (sessionId.equals(ShiroUtils.getSessionId())) {
			return JsonResult.error("当前登陆用户无法强退");
		}
		if (online == null) {
			return JsonResult.error("用户已下线");
		}
		OnlineSession onlineSession = (OnlineSession) sessionService.readSession(online.getId());
		if (onlineSession == null) {
			return JsonResult.error("用户已下线");
		}
		
		onlineSession.setStatus(OnlineStatus.OFF_LINE);
		sessionService.update(onlineSession);
		
		online.setStatus(OnlineStatus.OFF_LINE);
		onlineService.updateOnline(online);
		
		return JsonResult.success();
	}
}
