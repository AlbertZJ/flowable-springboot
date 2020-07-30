package com.daffodil.system.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.daffodil.core.constant.Constants;
import com.daffodil.core.dao.JpaDao;
import com.daffodil.core.entity.Ztree;
import com.daffodil.core.exception.BaseException;
import com.daffodil.framework.shiro.util.ShiroUtils;
import com.daffodil.system.entity.SysMenu;
import com.daffodil.system.entity.SysRole;
import com.daffodil.system.entity.SysUser;
import com.daffodil.system.service.ISysMenuService;
import com.daffodil.util.HqlUtils;
import com.daffodil.util.StringUtils;

/**
 * 菜单 业务层服务实现
 * @author yweijian
 * @date 2019年12月19日
 * @version 1.0
 */
@Service
public class SysMenuServiceImpl implements ISysMenuService {
	
	@Autowired
	private JpaDao jpaDao;

	@Override
	public List<SysMenu> selectMenuList(SysMenu menu, String userId) {
		StringBuffer hql = new StringBuffer();
		List<Object> paras = new ArrayList<Object>();
		SysUser sysUser = jpaDao.find(SysUser.class, userId);
		// 超级管理员显示所有菜单信息
		if (ShiroUtils.isAdmin(sysUser)) {
			hql.append("select m from SysMenu m where 1=1 ");
		} else {
			hql.append("select m from SysMenu m, SysRoleMenu rm, SysUserRole ur where m.id = rm.menuId and ur.roleId = rm.roleId and ur.userId = ? ");
			paras.add(userId);
		}
		HqlUtils.createHql(hql, paras, menu, "m");
		hql.append("order by m.orderNum asc, m.parentId desc");
		return jpaDao.search(hql.toString(), paras, SysMenu.class);
	}
	
	@Override
	public List<SysMenu> selectMenuList() {
		List<SysMenu> menus = new LinkedList<SysMenu>();
		// 管理员显示所有菜单信息
		if (ShiroUtils.isAdmin()) {
			String hql = "from SysMenu m where m.menuType in ('catalog', 'menu') and m.visible = '0' order by m.orderNum asc, m.parentId desc";
			menus = jpaDao.search(hql, SysMenu.class);
		} else {
			String hql = "select m from SysMenu m " +
					"left join SysRoleMenu rm on m.id = rm.menuId " +
					"left join SysUserRole ur on rm.roleId = ur.roleId " +
					"left join SysRole r on ur.roleId = r.id " +
					"where m.menuType in ('catalog', 'menu') and m.visible = '0' AND r.status = '0' and ur.userId = ? " +
					"order by m.orderNum asc, m.parentId desc";
			menus = jpaDao.search(hql, ShiroUtils.getUserId(), SysMenu.class);
		}
		return this.getChildPerms(menus, "root");
	}

	@Override
	public Set<String> selectPermsByUserId(String userId) {
		String hql = "select m from SysMenu m " +
				"left join SysRoleMenu rm on m.id = rm.menuId " +
				"left join SysUserRole ur on rm.roleId = ur.roleId " +
				"left join SysRole r on ur.roleId = r.id " +
				"where m.visible = '0' AND r.status = '0' and ur.userId = ? ";
		List<SysMenu> menus = jpaDao.search(hql, userId, SysMenu.class);
		Set<String> perms = new HashSet<>();
		for (SysMenu menu : menus) {
			if (StringUtils.isNotEmpty(menu.getPerms()) && !perms.contains(menu.getPerms().trim())) {
				perms.add(menu.getPerms().trim());
			}
		}
		return perms;
	}

	@Override
	public List<Ztree> roleMenuTreeData(SysRole role, String userId) {
		List<Ztree> ztrees = new ArrayList<Ztree>();
		List<SysMenu> menus = this.selectMenuList(new SysMenu(), userId);
		if (StringUtils.isNotNull(role.getId())) {
			String hql = "select m from SysMenu m left join SysRoleMenu rm on m.id = rm.menuId where rm.roleId = ?";
			List<SysMenu> roleMenus = jpaDao.search(hql, role.getId(), SysMenu.class);
			List<String> perms = new ArrayList<String>();
			if(StringUtils.isNotEmpty(roleMenus)){
				for(SysMenu menu : roleMenus){
					perms.add(menu.getId() + " " + menu.getPerms());
				}
			}
			ztrees = initZtree(menus, perms);
		} else {
			ztrees = initZtree(menus, null);
		}
		return ztrees;
	}

	@Override
	public List<Ztree> menuTreeData(String userId) {
		List<SysMenu> menus = this.selectMenuList(new SysMenu(), userId);
		List<Ztree> ztrees = this.initZtree(menus, null);
		return ztrees;
	}

	/**
	 * 初始化zTree
	 * @param menus 菜单列表
	 * @param perms 角色已存在权限的菜单列表
	 * @return 树结构列表
	 */
	public List<Ztree> initZtree(List<SysMenu> menus, List<String> perms) {
		List<Ztree> ztrees = new ArrayList<Ztree>();
		boolean isCheck = StringUtils.isNotNull(perms);
		for (SysMenu menu : menus) {
			Ztree ztree = new Ztree();
			ztree.setId(menu.getId());
			ztree.setpId(menu.getParentId());
			ztree.setName(menu.getMenuName() + menu.getPerms());
			ztree.setTitle(menu.getMenuName());
			if (isCheck) {
				ztree.setChecked(perms.contains(menu.getId() + " " + menu.getPerms()));
			}
			ztrees.add(ztree);
		}
		return ztrees;
	}

	@Override
	@Transactional
	public void deleteMenuById(String menuId) {
		if (this.selectCountMenuByParentId(menuId) > 0) {
			throw new BaseException("删除菜单失败，存在子菜单，不允许删除");
		}
		if (this.selectCountRoleMenuByMenuId(menuId) > 0) {
			throw new BaseException("删除菜单失败，菜单已分配，不允许删除");
		}
		jpaDao.delete(SysMenu.class, menuId);
	}

	@Override
	public SysMenu selectMenuById(String menuId) {
		if(Constants.ROOT.equals(menuId)){
			SysMenu menu = new SysMenu();
			menu.setId(Constants.ROOT);
			menu.setMenuName("目录菜单");
			menu.setAncestors("");
			return menu;
		}
		return jpaDao.find(SysMenu.class, menuId);
	}

	@Override
	public int selectCountMenuByParentId(String parentId) {
		return jpaDao.count("from SysMenu where parentId = ?", parentId);
	}

	@Override
	public int selectCountRoleMenuByMenuId(String menuId) {
		return jpaDao.count("from SysRoleMenu where menuId = ?", menuId);
	}

	@Override
	@Transactional
	public void insertMenu(SysMenu menu) {
		if (this.checkMenuNameUnique(menu)) {
			throw new BaseException("新增菜单【" + menu.getMenuName() + "】失败，菜单名称已存在");
		}
		SysMenu parent = this.selectMenuById(menu.getParentId());
		if (StringUtils.isNotNull(parent)){
			String ancestors = parent.getAncestors() + "," + parent.getId();
			menu.setAncestors(ancestors);
		}
		menu.setCreateBy(ShiroUtils.getLoginName());
		menu.setCreateTime(new Date());
		jpaDao.save(menu);
	}

	@Override
	@Transactional
	public void updateMenu(SysMenu menu) {
		if (this.checkMenuNameUnique(menu)) {
			throw new BaseException("修改菜单【" + menu.getMenuName() + "】失败，菜单名称已存在");
		}
		if(this.checkMenuIsSelfOrChildren(menu)){
			throw new BaseException("修改菜单【" + menu.getMenuName() + "】失败，上级菜单不能是自己或自己的子菜单");
		}
		SysMenu sysMenu = this.selectMenuById(menu.getId());
		SysMenu parent = this.selectMenuById(menu.getParentId());
		if (StringUtils.isNotNull(parent) && StringUtils.isNotNull(sysMenu)) {
			String newAncestors = parent.getAncestors() + "," + parent.getId();
			String oldAncestors = sysMenu.getAncestors();
			menu.setAncestors(newAncestors);
			this.updateChildrenMenu(menu, newAncestors, oldAncestors);
		}
		menu.setUpdateBy(ShiroUtils.getLoginName());
		menu.setUpdateTime(new Date());
		jpaDao.update(menu);
	}

	public boolean checkMenuIsSelfOrChildren(SysMenu menu){
		List<Object> paras = new ArrayList<Object>();
		String hql = "from SysMenu where id = ? or ancestors like ?";
		paras.add(menu.getId());
		paras.add("%" + menu.getId() + "%");
		List<SysMenu> menus = jpaDao.search(hql, paras, SysMenu.class);
		for(SysMenu sysMenu : menus){
			if(menu.getParentId().equals(sysMenu.getId())){
				return true;
			}
		}
		return false;
	}
	
	@Transactional
	public void updateChildrenMenu(SysMenu menu, String newAncestors, String oldAncestors){
		//查询旧的前缀的所有子组织机构
		List<SysMenu> childrens = jpaDao.search("from SysMenu where ancestors like ?", "%" + menu.getId() + "%", SysMenu.class);
		for (SysMenu child : childrens) {
			//替换掉所有子组织机构的前缀
			child.setAncestors(child.getAncestors().replace(oldAncestors, newAncestors));
			jpaDao.update(child);
		}
	}
	
	@Override
	public boolean checkMenuNameUnique(SysMenu menu) {
		List<Object> paras = new ArrayList<Object>();
		String hql = "from SysMenu where menuName = ? and parentId = ? ";
		paras.add(menu.getMenuName());
		paras.add(menu.getParentId());
		if(StringUtils.isNotEmpty(menu.getId())){
			hql += "and id != ?";
			paras.add(menu.getId());
		}
		SysMenu sysMenu = jpaDao.find(hql, paras, SysMenu.class);
		if (StringUtils.isNotNull(sysMenu)) {
			return Constants.NOT_UNIQUE;
		}
		return Constants.IS_UNIQUE;
	}

	/**
	 * 根据父节点的ID获取所有子节点
	 * @param list 菜单列表
	 * @param parentId 传入的父节点ID
	 * @return String
	 */
	private List<SysMenu> getChildPerms(List<SysMenu> list, String parentId) {
		List<SysMenu> menus = new ArrayList<SysMenu>();
		for (Iterator<SysMenu> iterator = list.iterator(); iterator.hasNext();) {
			SysMenu t = (SysMenu) iterator.next();
			// 一、根据传入的某个父节点ID,遍历该父节点的所有子节点
			if (parentId.equals(t.getParentId()) && !menus.contains(t)) {
				this.recursionFn(list, t);
				menus.add(t);
			}
		}
		return menus;
	}

	/**
	 * 递归列表
	 * 
	 * @param list
	 * @param t
	 */
	private void recursionFn(List<SysMenu> list, SysMenu menu) {
		// 得到子节点列表
		List<SysMenu> childs = this.getChildList(list, menu);
		menu.setChildren(childs);
		for (SysMenu sysMenu : childs) {
			if (this.hasChild(list, sysMenu)) {
				// 判断是否有子节点
				Iterator<SysMenu> it = childs.iterator();
				while (it.hasNext()) {
					this.recursionFn(list, (SysMenu) it.next());
				}
			}
		}
	}

	/**
	 * 得到子节点列表
	 */
	private List<SysMenu> getChildList(List<SysMenu> list, SysMenu menu) {
		List<SysMenu> menus = new ArrayList<SysMenu>();
		Iterator<SysMenu> it = list.iterator();
		while (it.hasNext()) {
			SysMenu n = (SysMenu) it.next();
			if (n.getParentId().equals(menu.getId())  && !menus.contains(n)) {
				menus.add(n);
			}
		}
		return menus;
	}

	/**
	 * 判断是否有子节点
	 */
	private boolean hasChild(List<SysMenu> list, SysMenu menu) {
		return getChildList(list, menu).size() > 0 ? true : false;
	}

}
