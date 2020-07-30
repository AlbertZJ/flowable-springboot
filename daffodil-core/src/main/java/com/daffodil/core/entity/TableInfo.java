package com.daffodil.core.entity;

import java.io.Serializable;
import java.util.List;

/**
 * 表格分页数据对象
 * 
 * @author yweijian
 * @date 2019年8月18日
 * @version 1.0
 */
public class TableInfo implements Serializable {
	
	private static final long serialVersionUID = 1L;

	/** 总记录数 */
	private long total;

	/** 列表数据 兼容其它前端组件使用*/
	private List<?> rows;
	
	/** 列表数据 兼容其它前端组件使用*/
	private List<?> data;

	/** 消息状态码 */
	private int code;

	/** 消息内容 */
	private int msg;

	/**
	 * 表格数据对象
	 */
	public TableInfo() {
		
	}

	/**
	 * 分页
	 * 
	 * @param list
	 *            列表数据
	 * @param total
	 *            总记录数
	 */
	public TableInfo(List<?> list, int total) {
		this.rows = list;
		this.total = total;
	}

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}

	public List<?> getRows() {
		return rows;
	}

	public void setRows(List<?> rows) {
		this.rows = rows;
	}

	public List<?> getData() {
		return data;
	}

	public void setData(List<?> data) {
		this.data = data;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public int getMsg() {
		return msg;
	}

	public void setMsg(int msg) {
		this.msg = msg;
	}
}