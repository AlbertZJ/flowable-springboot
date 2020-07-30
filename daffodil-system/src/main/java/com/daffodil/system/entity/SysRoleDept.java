package com.daffodil.system.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.daffodil.core.entity.BaseEntity;

/**
 * 角色和部门关联
 * 
 * @author yweijian
 * @date 2019年8月16日
 * @version 1.0
 */
@Entity
@Table(name = "sys_role_dept")
public class SysRoleDept extends BaseEntity{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/** 角色ID */
	private String roleId;

	/** 部门ID */
	private String deptId;
	
	/** 角色和部门关联编号 */
	@Id
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	@Column(name = "role_dept_id")
	@Override
	public String getId() {
		return super.getId();
	}

	@Column(name = "role_id")
	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
	@Column(name = "dept_id")
	public String getDeptId() {
		return deptId;
	}

	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}

}
