package com.daffodil.system.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.hibernate.annotations.GenericGenerator;

import com.daffodil.core.annotation.Dict;
import com.daffodil.core.annotation.Excel;
import com.daffodil.core.annotation.Hql;
import com.daffodil.core.annotation.Hql.Logical;
import com.daffodil.core.entity.BaseEntity;
import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 角色表
 * 
 * @author yweijian
 * @date 2019年12月12日
 * @version 1.0
 */
@Entity
@Table(name="sys_role")
public class SysRole extends BaseEntity {
	private static final long serialVersionUID = 1L;
	
	/** 角色名称 */
	private String roleName;

	/** 角色权限 */
	private String roleKey;

	/** 角色排序 */
	private Long orderNum;

	/** 数据范围 */
	private String dataScope;

	/** 角色状态（0正常 1停用 2删除） */
	private String status;
	
	/** 创建者 */
	private String createBy;

	/** 创建时间 */
	private Date createTime;

	/** 更新者 */
	private String updateBy;

	/** 更新时间 */
	private Date updateTime;

	/** 备注 */
	private String remark;

	/** 菜单组 */
	private String[] menuIds;

	/** 部门组（数据权限） */
	private String[] deptIds;
	
	/** 用户是否拥有该角色，默认false */
	private boolean flag;

	/** 角色ID */
	@Id
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	@Column(name = "role_id")
	@Excel(name = "角色编号")
	@Override
	public String getId() {
		return super.getId();
	}

	/** 数据范围（1：所有数据权限；2：自定义数据权限；3：本部门数据权限；4：本部门及以下数据权限；5：仅本用户数据权限） */
	@Column(name = "role_scope")
	@Excel(name = "数据范围", readConverterExp = "1=所有数据权限,2=自定义数据权限,3=本部门数据权限,4=本部门及以下数据权限,5=仅本用户数据权限")
	@Hql(type = Logical.EQ)
	public String getDataScope() {
		return dataScope;
	}

	public void setDataScope(String dataScope) {
		this.dataScope = dataScope;
	}

	@Column(name = "role_name")
	@Excel(name = "角色名称")
	@NotBlank(message = "角色名称不能为空")
	@Size(min = 0, max = 30, message = "角色名称长度不能超过30个字符")
	@Hql(type = Logical.LIKE)
	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	@Column(name = "role_key")
	@Excel(name = "角色权限")
	@NotBlank(message = "权限字符不能为空")
	@Size(min = 0, max = 100, message = "权限字符长度不能超过100个字符")
	@Hql(type = Logical.LIKE)
	public String getRoleKey() {
		return roleKey;
	}

	public void setRoleKey(String roleKey) {
		this.roleKey = roleKey;
	}

	@Column(name = "order_num")
	public Long getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(Long orderNum) {
		this.orderNum = orderNum;
	}

	@Column(name = "status")
	@Dict(value = "sys_data_status")
	@Excel(name = "角色状态", readConverterExp = "0=正常,1=停用,2=删除")
	@Hql(type = Logical.EQ)
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	@Column(name="create_by")
	@Hql(type = Logical.LIKE)
	public String getCreateBy() {
		return createBy;
	}

	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}

	@Column(name="create_time")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Column(name="update_by")
	@Hql(type = Logical.LIKE)
	public String getUpdateBy() {
		return updateBy;
	}

	public void setUpdateBy(String updateBy) {
		this.updateBy = updateBy;
	}

	@Column(name="update_time")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	@Column(name="remark")
	@Hql(type = Logical.LIKE)
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Transient
	public String[] getMenuIds() {
		return menuIds;
	}

	public void setMenuIds(String[] menuIds) {
		this.menuIds = menuIds;
	}

	@Transient
	public String[] getDeptIds() {
		return deptIds;
	}

	public void setDeptIds(String[] deptIds) {
		this.deptIds = deptIds;
	}
	
	@Transient
	public boolean isFlag() {
		return flag;
	}

	public void setFlag(boolean flag) {
		this.flag = flag;
	}
}
