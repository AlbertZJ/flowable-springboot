package com.daffodil.system.service;

import java.util.List;
import java.util.Set;

import com.daffodil.core.entity.Ztree;
import com.daffodil.system.entity.SysMenu;
import com.daffodil.system.entity.SysRole;

/**
 * 菜单 业务层服务
 * @author yweijian
 * @date 2019年12月18日
 * @version 1.0
 */
public interface ISysMenuService {

	/**
	 * 查询系统菜单列表
	 * @param menu
	 * @param userId
	 * @return
	 */
	public List<SysMenu> selectMenuList(SysMenu menu, String userId);
	
	/**
	 * 根据登录的用户查询菜单
	 * @return
	 */
	public List<SysMenu> selectMenuList();

	/**
	 * 根据用户ID查询权限
	 * @param userId
	 * @return
	 */
	public Set<String> selectPermsByUserId(String userId);

	/**
	 * 根据角色ID查询菜单
	 * @param role
	 * @param userId
	 * @return
	 */
	public List<Ztree> roleMenuTreeData(SysRole role, String userId);

	/**
	 * 查询所有菜单信息
	 * @param userId
	 * @return
	 */
	public List<Ztree> menuTreeData(String userId);

	/**
	 * 删除菜单管理信息
	 * @param menuId
	 */
	public void deleteMenuById(String menuId);

	/**
	 * 根据菜单ID查询信息
	 * @param menuId
	 * @return
	 */
	public SysMenu selectMenuById(String menuId);

	/**
	 * 查询菜单数量
	 * @param parentId
	 * @return
	 */
	public int selectCountMenuByParentId(String parentId);

	/**
	 * 查询菜单使用数量
	 * @param menuId
	 * @return
	 */
	public int selectCountRoleMenuByMenuId(String menuId);

	/**
	 * 新增保存菜单信息
	 * @param menu
	 */
	public void insertMenu(SysMenu menu);

	/**
	 * 修改保存菜单信息
	 * @param menu
	 */
	public void updateMenu(SysMenu menu);

	/**
	 * 校验菜单名称是否唯一
	 * @param menuName
	 * @return
	 */
	public boolean checkMenuNameUnique(SysMenu menu);

}
