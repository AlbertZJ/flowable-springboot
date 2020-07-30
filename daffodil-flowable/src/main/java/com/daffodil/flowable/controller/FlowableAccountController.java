package com.daffodil.flowable.controller;

import java.util.ArrayList;
import java.util.List;

import org.flowable.idm.api.User;
import org.flowable.ui.common.model.GroupRepresentation;
import org.flowable.ui.common.model.RemoteGroup;
import org.flowable.ui.common.model.RemoteUser;
import org.flowable.ui.common.model.ResultListDataRepresentation;
import org.flowable.ui.common.model.UserRepresentation;
import org.flowable.ui.common.security.DefaultPrivileges;
import org.flowable.ui.common.security.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.daffodil.core.entity.Query;
import com.daffodil.flowable.service.IFlowableAccountService;
import com.daffodil.framework.shiro.util.ShiroUtils;
import com.daffodil.system.entity.SysRole;
import com.daffodil.system.entity.SysUser;
import com.daffodil.util.StringUtils;

/**
 * 
 * @author yweijian
 * @date 2020年1月9日
 * @version 1.0
 */
@Controller
@RequestMapping("/flowable")
public class FlowableAccountController {

	@Autowired
	private IFlowableAccountService accountService;
	
	/**
	 * flowable的账户认证
	 * @return
	 */
	@GetMapping(value="/rest/account")
	@ResponseBody
	public UserRepresentation getAccount() {
		SysUser sysUser = ShiroUtils.getSysUser();
		UserRepresentation userRepresentation = this.getUserRepresentation(sysUser);
		return userRepresentation;
	}

	/**
	 * 获取用户
	 * @param filter
	 * @return
	 */
	@GetMapping(value = "/rest/editor-users")
	@ResponseBody
	public ResultListDataRepresentation getUsers(@RequestParam(value = "filter", required = false) String filter) {
		Query<SysUser> query = new Query<SysUser>();
		SysUser sysUser = new SysUser();
		sysUser.setLoginName(filter);
		query.setEntity(sysUser);
		List<SysUser> list = accountService.selectUserList(query);
		List<UserRepresentation> userRepresentations = new ArrayList<UserRepresentation>();
		if(StringUtils.isNotEmpty(list)){
			for(int i = 0; i < list.size(); i++){
				UserRepresentation userRepresentation = this.getUserRepresentation(list.get(i));
				userRepresentations.add(userRepresentation);
			}
		}
		return new ResultListDataRepresentation(userRepresentations);
	}

	/**
	 * 获取用户组-相当于系统角色
	 * @param filter
	 * @return
	 */
	@GetMapping(value = "/rest/editor-groups")
	@ResponseBody
	public ResultListDataRepresentation getGroups(@RequestParam(value = "filter",required = false) String filter) {

		Query<SysRole> query = new Query<SysRole>();
		SysRole sysRole = new SysRole();
		sysRole.setRoleName(filter);
		query.setEntity(sysRole);
		List<SysRole> list = accountService.selectRoleList(query);
		List<GroupRepresentation> groupRepresentations = new ArrayList<GroupRepresentation>();
		if(StringUtils.isNotEmpty(list)){
			for(int i = 0; i < list.size(); i++){
				GroupRepresentation groupRepresentation = this.getGroupRepresentation(list.get(i));
				groupRepresentations.add(groupRepresentation);
			}
		}
		return new ResultListDataRepresentation(groupRepresentations);
	}

	/**
	 * 系统用户转换成功flowable的用户
	 * @param sysUser
	 * @return
	 */
	private UserRepresentation getUserRepresentation(SysUser sysUser){
		if(StringUtils.isNull(sysUser)){
			return null;
		}
		//设置用户即sysuer->user
		User user = new RemoteUser();
		user.setId(sysUser.getLoginName());
		user.setFirstName(sysUser.getLoginName());
		user.setEmail(sysUser.getEmail());
		SecurityUtils.assumeUser(user);
		UserRepresentation userRepresentation = new UserRepresentation(user);

		List<String> privileges = new ArrayList<String>();
		privileges.add(DefaultPrivileges.ACCESS_IDM);
		privileges.add(DefaultPrivileges.ACCESS_MODELER);
		privileges.add(DefaultPrivileges.ACCESS_TASK);
		privileges.add(DefaultPrivileges.ACCESS_ADMIN);
		privileges.add(DefaultPrivileges.ACCESS_REST_API);
		userRepresentation.setPrivileges(privileges);

		List<GroupRepresentation> groups = new ArrayList<GroupRepresentation>();
		List<SysRole> roles = sysUser.getRoles();
		if(StringUtils.isNotEmpty(roles)){
			for(int i = 0; i < roles.size(); i++){
				GroupRepresentation groupRepresentation = this.getGroupRepresentation(roles.get(i));
				groups.add(groupRepresentation);
			}
		}
		userRepresentation.setGroups(groups);

		return userRepresentation;
	}

	/**
	 * 系统角色转换成flowable的group组
	 * @param sysRole
	 * @return
	 */
	private GroupRepresentation getGroupRepresentation(SysRole sysRole){
		if(StringUtils.isNull(sysRole)){
			return null;
		}
		//设置用户组即SysRole->group
		RemoteGroup group = new RemoteGroup();
		group.setId(sysRole.getId());
		group.setName(sysRole.getRoleName());
		group.setType(sysRole.getRoleKey());
		GroupRepresentation groupRepresentation = new GroupRepresentation(group);

		return groupRepresentation;
	}
}
