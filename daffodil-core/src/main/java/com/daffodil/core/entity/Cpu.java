package com.daffodil.core.entity;

import com.daffodil.util.MathUtils;

/**
 * CPU相关信息
 * 
 * @author yweijian
 * @date 2019年8月22日
 * @version 1.0
 */
public class Cpu {
	/**
	 * 核心数
	 */
	private int cpuNum;

	/**
	 * CPU总的使用率
	 */
	private double total;

	/**
	 * CPU系统使用率
	 */
	private double sys;

	/**
	 * CPU用户使用率
	 */
	private double used;

	/**
	 * CPU当前等待率
	 */
	private double wait;

	/**
	 * CPU当前空闲率
	 */
	private double free;

	public int getCpuNum() {
		return cpuNum;
	}

	public void setCpuNum(int cpuNum) {
		this.cpuNum = cpuNum;
	}

	public double getTotal() {
		return MathUtils.round(MathUtils.mul(total, 100), 2);
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public double getSys() {
		return MathUtils.round(MathUtils.mul(sys / total, 100), 2);
	}

	public void setSys(double sys) {
		this.sys = sys;
	}

	public double getUsed() {
		return MathUtils.round(MathUtils.mul(used / total, 100), 2);
	}

	public void setUsed(double used) {
		this.used = used;
	}

	public double getWait() {
		return MathUtils.round(MathUtils.mul(wait / total, 100), 2);
	}

	public void setWait(double wait) {
		this.wait = wait;
	}

	public double getFree() {
		return MathUtils.round(MathUtils.mul(free / total, 100), 2);
	}

	public void setFree(double free) {
		this.free = free;
	}
}
