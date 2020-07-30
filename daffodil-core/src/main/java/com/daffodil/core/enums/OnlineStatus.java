package com.daffodil.core.enums;

/**
 * 用户会话状态枚举类
 * 
 * @author yweijian
 * @date 2019年8月16日
 * @version 1.0
 */
public enum OnlineStatus {
	/** 用户状态 */
	ON_LINE("在线"), OFF_LINE("离线");

	private final String info;

	private OnlineStatus(String info) {
		this.info = info;
	}

	public String getInfo() {
		return info;
	}
}
