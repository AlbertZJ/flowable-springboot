package com.daffodil.system.service;

import java.util.List;

import com.daffodil.core.entity.Query;
import com.daffodil.core.entity.Ztree;
import com.daffodil.system.entity.SysDept;

/**
 * 部门管理
 * 
 * @author yweijian
 * @date 2019年8月16日
 * @version 1.0
 */
public interface ISysDeptService {
	
	/**
	 * 根据查询条件查询部门
	 * @param query
	 * @return
	 */
	public List<SysDept> selectDeptList(Query<SysDept> query);

	/**
	 * 按树结构查询部门
	 * @param dept
	 * @return
	 */
	public List<Ztree> deptTreeData(Query<SysDept> query);

	/**
	 * 根据角色ID查询菜单
	 * @param roleId
	 * @return
	 */
	public List<Ztree> roleDeptTreeData(String roleId);

	/**
	 * 删除部门管理信息
	 * @param deptId
	 */
	public void deleteDeptById(String deptId);

	/**
	 * 新增保存部门信息
	 * @param dept
	 */
	public void insertDept(SysDept dept);

	/**
	 * 修改保存部门信息
	 * @param dept
	 */
	public void updateDept(SysDept dept);

	/**
	 * 根据部门ID查询信息
	 * @param deptId
	 * @return
	 */
	public SysDept selectDeptById(String deptId);

	/**
	 * 校验部门名称是否唯一
	 * @param dept
	 * @return
	 */
	public boolean checkDeptNameUnique(SysDept dept);
}
