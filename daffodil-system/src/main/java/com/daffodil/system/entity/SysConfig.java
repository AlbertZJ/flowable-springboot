package com.daffodil.system.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.*;

import org.hibernate.annotations.GenericGenerator;

import com.daffodil.core.annotation.Dict;
import com.daffodil.core.annotation.Excel;
import com.daffodil.core.annotation.Hql;
import com.daffodil.core.annotation.Hql.Logical;
import com.daffodil.core.entity.BaseEntity;
import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 参数配置表
 * 
 * @author yweijian
 * @date 2019年8月15日
 * @version 1.0
 */
@Entity
@Table(name = "sys_config")
public class SysConfig extends BaseEntity {
	private static final long serialVersionUID = 1L;

	/** 参数名称 */
	private String configName;

	/** 参数键名 */
	private String configKey;

	/** 参数键值 */
	private String configValue;

	/** 系统内置（Y是 N否） */
	private String configType;
	
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

	/** 参数编号 */
	@Id
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	@Column(name = "config_id")
	@Excel(name = "参数编号")
	@Override
	public String getId() {
		return super.getId();
	}

	@Column(name = "config_name")
	@Excel(name = "参数名称")
	@NotBlank(message = "参数名称不能为空")
	@Size(min = 0, max = 100, message = "参数名称不能超过100个字符")
	@Hql(type = Logical.LIKE)
	public String getConfigName() {
		return configName;
	}

	public void setConfigName(String configName) {
		this.configName = configName;
	}

	@Column(name = "config_key")
	@Excel(name = "参数键名")
	@NotBlank(message = "参数键名长度不能为空")
	@Size(min = 0, max = 100, message = "参数键名长度不能超过100个字符")
	@Hql(type = Logical.LIKE)
	public String getConfigKey() {
		return configKey;
	}

	public void setConfigKey(String configKey) {
		this.configKey = configKey;
	}

	@Column(name = "config_value")
	@Excel(name = "参数键值")
	@Size(min = 0, max = 500, message = "参数键值长度不能超过500个字符")
	@Hql(type = Logical.LIKE)
	public String getConfigValue() {
		return configValue;
	}

	public void setConfigValue(String configValue) {
		this.configValue = configValue;
	}

	@Column(name = "config_type")
	@Dict(value= "sys_yes_no")
	@Excel(name = "系统内置", readConverterExp = "Y=是,N=否")
	@Hql(type = Logical.EQ)
	public String getConfigType() {
		return configType;
	}

	public void setConfigType(String configType) {
		this.configType = configType;
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
}
