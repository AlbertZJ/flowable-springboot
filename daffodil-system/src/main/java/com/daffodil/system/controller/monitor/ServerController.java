package com.daffodil.system.controller.monitor;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daffodil.core.entity.Server;

/**
 * 服务器监控
 * 
 * @author yweijian
 * @date 2019年8月23日
 * @version 1.0
 */
@Controller
@RequestMapping("/monitor/server")
public class ServerController {

	@RequiresPermissions("monitor:server:view")
	@GetMapping()
	public String server(ModelMap modelMap) throws Exception {
		Server server = new Server();
		modelMap.put("server", server);
		return "monitor/server/server";
	}
}
