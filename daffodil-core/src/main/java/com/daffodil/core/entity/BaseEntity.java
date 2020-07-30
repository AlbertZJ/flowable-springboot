package com.daffodil.core.entity;

/**
 * Entity基类
 * 
 * @author yweijian
 * @date 2019年8月15日
 * @version 1.0
 */
public class BaseEntity implements java.io.Serializable {

	private static final long serialVersionUID = 1L;

	/** 实体编号*/
	private String id;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
}
