package com.daffodil.core.entity;

/**
 * Tree基类
 * @author yweijian
 * @date 2019年12月12日
 * @version 1.0
 */
public class TreeEntity extends BaseEntity {
	
	private static final long serialVersionUID = 1L;

	/** 父菜单名称 */
	private String parentName;

	/** 父菜单ID */
	private String parentId;
	
	/** 祖级列表 */
	private String ancestors;

	/** 显示顺序 */
	private Long orderNum;

	public String getParentName() {
		return parentName;
	}

	public void setParentName(String parentName) {
		this.parentName = parentName;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getAncestors() {
		return ancestors;
	}

	public void setAncestors(String ancestors) {
		this.ancestors = ancestors;
	}

	public Long getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(Long orderNum) {
		this.orderNum = orderNum;
	}

}