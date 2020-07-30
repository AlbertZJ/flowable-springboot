package com.daffodil.flowable.entity;

import java.util.Date;

import org.flowable.ui.modeler.domain.Model;

import com.daffodil.core.entity.BaseEntity;
import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 流程模型信息
 * 
 * @author yweijian
 * @date 2020年2月11日
 * @version 1.0
 */
public class ActCnModel extends BaseEntity {

	private static final long serialVersionUID = 1L;

	/** 流程名称 */
	private String name;

	/** 流程标识 */
	private String modelKey;

	/** 流程版本 */
	private Integer version;
	
	/** 创建时间 */
	private Date createTime;

	public ActCnModel() {
		super();
	}

	public ActCnModel(Model model) {
		this.setId(model.getId());
		name = model.getName();
		modelKey = model.getKey();
		version = model.getVersion();
		createTime = model.getCreated();
	}

	@Override
	public String getId() {
		return super.getId();
	}

	@Override
	public void setId(String id) {
		super.setId(id);
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getModelKey() {
		return modelKey;
	}

	public void setModelKey(String modelKey) {
		this.modelKey = modelKey;
	}

	public Integer getVersion() {
		return version;
	}

	public void setVersion(Integer version) {
		this.version = version;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

}
