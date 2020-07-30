package com.daffodil.system.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.daffodil.core.dao.JpaDao;
import com.daffodil.core.entity.Query;
import com.daffodil.core.annotation.DataScope;
import com.daffodil.core.constant.Constants;
import com.daffodil.core.exception.BaseException;
import com.daffodil.framework.shiro.util.ShiroUtils;
import com.daffodil.system.entity.SysRole;
import com.daffodil.system.entity.SysRoleDept;
import com.daffodil.system.entity.SysRoleMenu;
import com.daffodil.system.entity.SysUserRole;
import com.daffodil.system.service.ISysRoleService;
import com.daffodil.util.HqlUtils;
import com.daffodil.util.StringUtils;

/**
 * 角色 业务层处理
 * 
 * @author yweijian
 * @date 2019年8月16日
 * @version 1.0
 */
@Service
public class SysRoleServiceImpl implements ISysRoleService {

	@Autowired
	private JpaDao jpaDao;

	@Override
	@DataScope(deptAlias = "d")
	public List<SysRole> selectRoleList(Query<SysRole> query) {
		StringBuffer hql = new StringBuffer("from SysRole where 1=1 ");
		List<Object> paras = new ArrayList<Object>();
		HqlUtils.createHql(hql, paras, query);
		return jpaDao.search(hql.toString(), paras, SysRole.class, query.getPage());
	}

	@Override
	public Set<String> selectRoleKeysByUserId(String userId) {
		List<SysRole> roles = this.selectRolesByUserId(userId);
		Set<String> perms = new HashSet<String>();
		for (SysRole role : roles) {
			if (StringUtils.isNotNull(role)) {
				perms.addAll(Arrays.asList(role.getRoleKey().trim().split(",")));
			}
		}
		return perms;
	}

	@Override
	public List<SysRole> selectRolesByUserId(String userId) {
		String hql = "select r from SysRole r, SysUserRole ur where ur.roleId = r.id and r.status != '2' and ur.userId = ? ";
		List<SysRole> userRoles = jpaDao.search(hql, userId, SysRole.class);
		Query<SysRole> query = new Query<SysRole>();
		query.setEntity(new SysRole());
		List<SysRole> roles = this.selectRoleList(query);
		for (SysRole role : roles) {
			for (SysRole userRole : userRoles) {
				if (role.getId().equals(userRole.getId())) {
					role.setFlag(true);
					break;
				}
			}
		}
		return roles;
	}

	@Override
	public SysRole selectRoleById(String roleId) {
		return jpaDao.find(SysRole.class, roleId);
	}

	@Override
	@Transactional
	public void deleteRoleByIds(String[] ids) {
		for (String roleId : ids) {
			int count = jpaDao.count("from SysUserRole where roleId = ? ", roleId);
			if (count > 0) {
				throw new BaseException("删除角色失败，角色已分配，不能删除");
			}
			// 删除角色与部门关联
			jpaDao.delete("delete from SysRoleDept where roleId = ?", roleId);
			// 删除角色与菜单关联
			jpaDao.delete("delete from SysRoleMenu where roleId = ?", roleId);
			// 删除角色
			jpaDao.delete(SysRole.class, roleId);
		}
	}

	@Override
	@Transactional
	public void insertRole(SysRole role) {
		if (this.checkRoleNameUnique(role)) {
			throw new BaseException("新增角色【" + role.getRoleName() + "】失败，角色名称已存在");
		} else if (this.checkRoleKeyUnique(role)) {
			throw new BaseException("新增角色【" + role.getRoleName() + "】失败，角色权限已存在");
		}
		// 新增角色信息
		role.setCreateBy(ShiroUtils.getLoginName());
		role.setCreateTime(new Date());
		jpaDao.save(role);
		// 新增角色与菜单管理
		if(StringUtils.isNotEmpty(role.getMenuIds())){
			for (String menuId : role.getMenuIds()) {
				SysRoleMenu sysRoleMenu = new SysRoleMenu();
				sysRoleMenu.setRoleId(role.getId());
				sysRoleMenu.setMenuId(menuId);
				jpaDao.save(sysRoleMenu);
			}
		}
	}

	@Override
	@Transactional
	public void updateRole(SysRole role) {
		if (this.checkRoleNameUnique(role)) {
			throw new BaseException("修改角色【" + role.getRoleName() + "】失败，角色名称已存在");
		} else if (this.checkRoleKeyUnique(role)) {
			throw new BaseException("修改角色【" + role.getRoleName() + "】失败，角色权限已存在");
		}
		// 修改角色信息
		role.setUpdateBy(ShiroUtils.getLoginName());
		role.setUpdateTime(new Date());
		jpaDao.update(role);
		// 删除角色与菜单关联
		jpaDao.delete("delete from SysRoleMenu where roleId = ? ", role.getId());
		// 新增用户与角色管理
		for (String menuId : role.getMenuIds()) {
			SysRoleMenu sysRoleMenu = new SysRoleMenu();
			sysRoleMenu.setRoleId(role.getId());
			sysRoleMenu.setMenuId(menuId);
			jpaDao.save(sysRoleMenu);
		}
	}

	@Override
	@Transactional
	public void authRoleDataScope(SysRole role) {
		// 修改角色信息
		jpaDao.update(role);
		// 删除角色与部门关联
		jpaDao.delete("delete from SysRoleDept where roleId = ? ", role.getId());
		// 新增角色和部门信息（数据权限）
		for (String deptId : role.getDeptIds()) {
			SysRoleDept sysRoleDept = new SysRoleDept();
			sysRoleDept.setRoleId(role.getId());
			sysRoleDept.setDeptId(deptId);
			jpaDao.save(sysRoleDept);
		}
	}

	@Override
	public boolean checkRoleNameUnique(SysRole role) {
		List<Object> paras = new ArrayList<Object>();
		String hql = "from SysRole where status != '2' and roleName = ? ";
		paras.add(role.getRoleName());
		if(StringUtils.isNotEmpty(role.getId())){
			hql += "and id != ? ";
			paras.add(role.getId());
		}
		SysRole sysRole = jpaDao.find(hql, paras, SysRole.class);
		if (null != sysRole) {
			return Constants.NOT_UNIQUE;
		}
		return Constants.IS_UNIQUE;
	}

	@Override
	public boolean checkRoleKeyUnique(SysRole role) {
		List<Object> paras = new ArrayList<Object>();
		String hql = "from SysRole where status != '2' and roleKey = ? ";
		paras.add(role.getRoleKey());
		if(StringUtils.isNotEmpty(role.getId())){
			hql += "and id != ? ";
			paras.add(role.getId());
		}
		SysRole sysRole = jpaDao.find(hql, paras, SysRole.class);
		if (null != sysRole) {
			return Constants.NOT_UNIQUE;
		}
		return Constants.IS_UNIQUE;
	}

	@Override
	public void changeRoleStatus(SysRole role) {
		jpaDao.update(role);
	}

	@Override
	@Transactional
	public void deleteAuthUser(SysUserRole userRole) {
		List<Object> paras = new ArrayList<Object>();
		paras.add(userRole.getUserId());
		paras.add(userRole.getRoleId());
		jpaDao.delete("delete from SysUserRole where userId = ? and roleId = ?", paras);
	}

	@Override
	@Transactional
	public void deleteAuthUsers(String roleId, String[] userIds) {
		for(String userId : userIds){
			List<Object> paras = new ArrayList<Object>();
			paras.add(userId);
			paras.add(roleId);
			jpaDao.delete("delete from SysUserRole where userId = ? and roleId = ?", paras);
		}
	}

	@Override
	@Transactional
	public void insertAuthUsers(String roleId, String[] userIds) {
		// 新增用户与角色管理
		for (String userId : userIds) {
			SysUserRole sysUserRole = new SysUserRole();
			sysUserRole.setUserId(userId);
			sysUserRole.setRoleId(roleId);
			jpaDao.save(sysUserRole);
		}
	}
}
