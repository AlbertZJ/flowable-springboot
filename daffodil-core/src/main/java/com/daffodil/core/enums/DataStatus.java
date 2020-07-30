package com.daffodil.core.enums;

/**
 * 数据状态
 * 
 * @author yweijian
 * @date 2019年8月18日
 * @version 1.0
 */
public enum DataStatus {
	
	NORMAL("0", "正常"), DISABLE("1", "停用"), DELETED("2", "删除");

	private final String code;
	private final String info;

	DataStatus(String code, String info) {
		this.code = code;
		this.info = info;
	}

	public String getCode() {
		return code;
	}

	public String getInfo() {
		return info;
	}
}
