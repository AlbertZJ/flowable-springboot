package com.daffodil.system.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.hibernate.annotations.GenericGenerator;

import java.util.Date;

import com.daffodil.core.annotation.Dict;
import com.daffodil.core.annotation.Hql;
import com.daffodil.core.annotation.Hql.Logical;
import com.daffodil.core.entity.BaseEntity;
import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 字典表
 * @author weiji
 * @date 2020年4月30日
 * @version 1.0
 */
@Entity
@Table(name="sys_dictionary")
public class SysDictionary extends BaseEntity {
	
	private static final long serialVersionUID = 1L;

	/** 字典（目录）名称 */
	private String dictName;
	
	/** 字典类型（catalog目录 dictionary字典） */
	private String dictType;
	
	/** 目录键值 */
	private String dictLabel;
	
	/** 字典键值 */
	private String dictValue;
	
	/** 是否默认（Y是 N否） */
	private String isDefault;
	
	/** 父字典ID */
	private String parentId;
	
	/** 祖级列表 */
	private String ancestors;

	/** 显示顺序 */
	private Long orderNum;
	
	/** 字典状态 */
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

	/** 字典编号 */
	@Id
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	@Column(name = "dict_id")
	@Override
	public String getId() {
		return super.getId();
	}
	
	@NotBlank(message = "字典名称不能为空")
	@Size(min = 0, max = 50, message = "字典名称长度不能超过50个字符")
	@Hql(type = Logical.LIKE)
	@Column(name = "dict_name")
	public String getDictName() {
		return dictName;
	}

	public void setDictName(String dictName) {
		this.dictName = dictName;
	}
	
	@Dict("sys_dict_type")
	@Hql(type = Logical.EQ)
	@Column(name = "dict_type")
	public String getDictType() {
		return dictType;
	}

	public void setDictType(String dictType) {
		this.dictType = dictType;
	}

	@Size(min = 0, max = 50, message = "字典键值长度不能超过50个字符")
	@Hql(type = Logical.EQ)
	@Column(name = "dict_label")
	public String getDictLabel() {
		return dictLabel;
	}

	public void setDictLabel(String dictLabel) {
		this.dictLabel = dictLabel;
	}

	@Hql(type = Logical.EQ)
	@Column(name = "dict_value")
	public String getDictValue() {
		return dictValue;
	}

	public void setDictValue(String dictValue) {
		this.dictValue = dictValue;
	}

	@Dict("sys_yes_no")
	@Hql(type = Logical.EQ)
	@Column(name = "is_default")
	public String getIsDefault() {
		return isDefault;
	}

	public void setIsDefault(String isDefault) {
		this.isDefault = isDefault;
	}

	@Hql(type = Logical.EQ)
	@Column(name = "parent_id")
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

	@Dict("sys_data_status")
	@Hql(type = Logical.EQ)
	@Column(name = "status")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Column(name = "create_by")
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
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}
