package com.daffodil.core.entity;

import com.daffodil.util.MathUtils;

/**
 * 內存相关信息
 * 
 * @author yweijian
 * @date 2019年8月22日
 * @version 1.0
 */
public class Mem {
	/**
	 * 内存总量
	 */
	private double total;

	/**
	 * 已用内存
	 */
	private double used;

	/**
	 * 剩余内存
	 */
	private double free;

	public double getTotal() {
		return MathUtils.div(total, (1024 * 1024 * 1024), 2);
	}

	public void setTotal(long total) {
		this.total = total;
	}

	public double getUsed() {
		return MathUtils.div(used, (1024 * 1024 * 1024), 2);
	}

	public void setUsed(long used) {
		this.used = used;
	}

	public double getFree() {
		return MathUtils.div(free, (1024 * 1024 * 1024), 2);
	}

	public void setFree(long free) {
		this.free = free;
	}

	public double getUsage() {
		return MathUtils.mul(MathUtils.div(used, total, 4), 100);
	}
}
