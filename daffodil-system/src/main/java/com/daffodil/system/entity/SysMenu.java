package com.daffodil.system.entity;

import java.util.List;
import java.util.ArrayList;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.*;

import org.hibernate.annotations.GenericGenerator;

import com.daffodil.core.annotation.Dict;
import com.daffodil.core.annotation.Hql;
import com.daffodil.core.annotation.Hql.Logical;
import com.daffodil.core.entity.BaseEntity;
import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 菜单权限表
 * 
 * @author yweijian
 * @date 2019年8月16日
 * @version 1.0
 */
@Entity
@Table(name = "sys_menu")
public class SysMenu extends BaseEntity {
	private static final long serialVersionUID = 1L;

	/** 菜单名称 */
	private String menuName;

	/** 父菜单ID */
	private String parentId;

	/** 祖级列表 */
	private String ancestors;

	/** 显示顺序 */
	private Long orderNum;

	/** 菜单URL */
	private String url;

	/** 打开方式：menuItem页签 menuBlank新窗口 */
	private String target;

	/** 类型:0目录,1菜单,2按钮 */
	private String menuType;

	/** 菜单状态:0显示,1隐藏 */
	private String visible;

	/** 权限字符串 */
	private String perms;

	/** 菜单图标 */
	private String icon;

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

	/** 子菜单 */
	private List<SysMenu> children = new ArrayList<SysMenu>();

	/** 菜单编号 */
	@Id
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	@Column(name = "menu_id")
	@Override
	public String getId() {
		return super.getId();
	}

	@Column(name = "menu_name")
	@NotBlank(message = "菜单名称不能为空")
	@Size(min = 0, max = 50, message = "菜单名称长度不能超过50个字符")
	@Hql(type = Logical.LIKE)
	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	@Column(name = "parent_id")
	@Hql(type = Logical.EQ)
	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	@Column(name = "ancestors")
	public String getAncestors() {
		return ancestors;
	}

	public void setAncestors(String ancestors) {
		this.ancestors = ancestors;
	}

	@Column(name = "order_num")
	public Long getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(Long orderNum) {
		this.orderNum = orderNum;
	}

	@Column(name = "url")
	@Size(min = 0, max = 200, message = "请求地址不能超过200个字符")
	@Hql(type = Logical.LIKE)
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@Column(name = "target")
	@Hql(type = Logical.EQ)
	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	@Column(name = "menu_type")
	@Dict(value = "sys_menu_type")
	@NotBlank(message = "菜单类型不能为空")
	@Hql(type = Logical.EQ)
	public String getMenuType() {
		return menuType;
	}

	public void setMenuType(String menuType) {
		this.menuType = menuType;
	}

	@Column(name = "visible")
	@Dict(value = "sys_show_hide")
	@Hql(type = Logical.EQ)
	
	public String getVisible() {
		return visible;
	}

	public void setVisible(String visible) {
		this.visible = visible;
	}

	@Column(name = "perms")
	@Size(min = 0, max = 100, message = "权限标识长度不能超过100个字符")
	@Hql(type = Logical.LIKE)
	public String getPerms() {
		return perms;
	}

	public void setPerms(String perms) {
		this.perms = perms;
	}

	@Column(name = "icon")
	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	@Column(name = "create_by")
	@Hql(type = Logical.LIKE)
	public String getCreateBy() {
		return createBy;
	}

	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}

	@Column(name = "create_time")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Column(name = "update_by")
	@Hql(type = Logical.LIKE)
	public String getUpdateBy() {
		return updateBy;
	}

	public void setUpdateBy(String updateBy) {
		this.updateBy = updateBy;
	}

	@Column(name = "update_time")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	@Column(name = "remark")
	@Hql(type = Logical.LIKE)
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Transient
	public List<SysMenu> getChildren() {
		return children;
	}

	public void setChildren(List<SysMenu> children) {
		this.children = children;
	}

}
