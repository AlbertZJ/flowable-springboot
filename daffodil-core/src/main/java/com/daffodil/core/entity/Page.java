package com.daffodil.core.entity;

/**
 * 分页组件
 * @author yweijian
 * @date 2019年12月12日
 * @version 1.0
 */
public class Page {
	
	/**
	 * 记录数长度
	 */
	private int length;
	/**
	 * 游标
	 */
	private int start = -1;
	/**
	 * 每页记录数
	 */
	private int pageSize;
	/**
	 * 当前页
	 */
	private int pageNumber;
	/**
	 * 总记录数
	 */
	private int totalRow;
	/**
	 * 总页数
	 */
	@SuppressWarnings("unused")
	private int totalPage;
	
	public int getLength() {
		return this.length;
	}

	public void setLength(int length) {
		this.length = length;
		set(this.start, length);
	}

	public int getStart() {
		return this.start;
	}

	public void setStart(int start) {
		this.start = start;
		set(start, this.length);
	}

	public void set(int start, int length) {
		if ((start == -1) || (length == 0)) {
			return;
		}
		this.pageNumber = (start / length + 1);
		this.pageSize = length;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public int getTotalRow() {
		return totalRow;
	}

	public void setTotalRow(int totalRow) {
		this.totalRow = totalRow;
	}

	public int getTotalPage() {
		int size = this.totalRow / this.pageSize;
		int mod = this.totalRow % this.pageSize;
		if (mod != 0) {
			size++;
		}
		if (size == 0) {
			size = 1;
		}
		return size;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	/**
	 * 分页游标起始
	 * @return
	 */
	public int getFromIndex() {
		return (getPageNumber() - 1) * this.pageSize;
	}

	/**
	 * 分页游标起止
	 * @return
	 */
	public int getToIndex() {
		return getPageNumber() * this.pageSize;
	}
	
}
