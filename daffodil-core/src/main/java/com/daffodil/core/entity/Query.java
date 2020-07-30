package com.daffodil.core.entity;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * 
 * @author yweijian
 * @date 2019年12月16日
 * @version 1.0
 */
public class Query<T> {
	
	/**
	 * 分页
	 */
	private Page page;
	
	/**
	 * 请求参数
	 */
	private Map<String, Object> params;
	
	/**
	 * 实体对象
	 */
	private T entity;
	
	/**
	 * 数据范围
	 */
	private String dataScope;
	
	/**
	 * 开始时间
	 */
	private Date startTime;
	
	/**
	 * 结束时间
	 */
	private Date endTime;
	
	/**
	 * 排序
	 */
	private String orderBy;
	
	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public Map<String, Object> getParams() {
		if (params == null) {
			params = new HashMap<>();
		}
		return params;
	}

	public void setParams(Map<String, Object> params) {
		this.params = params;
	}
	
	public T getEntity() {
		return entity;
	}

	public void setEntity(T entity) {
		this.entity = entity;
	}
	
	public String getDataScope() {
		return dataScope;
	}

	public void setDataScope(String dataScope) {
		this.dataScope = dataScope;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public String getOrderBy() {
		return orderBy;
	}

	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}
}
