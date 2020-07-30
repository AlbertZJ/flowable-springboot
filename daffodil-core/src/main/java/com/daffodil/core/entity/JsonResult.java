package com.daffodil.core.entity;

import java.util.HashMap;

/**
 * 操作消息提醒
 * 
 * @author yweijian
 * @date 2019年8月18日
 * @version 1.0
 */
public class JsonResult extends HashMap<String, Object> {
	
	private static final long serialVersionUID = 1L;

	/** 状态码 */
	public static final String CODE_TAG = "code";

	/** 返回内容 */
	public static final String MSG_TAG = "msg";

	/** 数据对象 */
	public static final String DATA_TAG = "data";

	/**
	 * 状态类型
	 */
	public enum Type {
		/** 成功 */
		SUCCESS(0),
		/** 警告 */
		WARN(301),
		/** 错误 */
		ERROR(500);
		
		private final int value;

		Type(int value) {
			this.value = value;
		}

		public int value() {
			return this.value;
		}
	}

	/**
	 * 初始化一个新创建的 JsonResult 对象，使其表示一个空消息。
	 */
	public JsonResult() {
	}

	/**
	 * 初始化一个新创建的 JsonResult 对象
	 * @param type
	 * @param msg
	 */
	public JsonResult(Type type, String msg) {
		super.put(CODE_TAG, type.value);
		super.put(MSG_TAG, msg);
	}

	/**
	 * 初始化一个新创建的 JsonResult 对象
	 * @param type
	 * @param msg
	 * @param data
	 */
	public JsonResult(Type type, String msg, Object data) {
		super.put(CODE_TAG, type.value);
		super.put(MSG_TAG, msg);
		if (data != null) {
			super.put(DATA_TAG, data);
		}
	}
	
	/**
	 * 初始化一个新创建的 JsonResult 对象
	 * @param code 状态码
	 * @param msg 信息
	 * @param data 数据
	 */
	public JsonResult(String code, String msg, Object data) {
		super.put(CODE_TAG, code);
		super.put(MSG_TAG, msg);
		if (data != null) {
			super.put(DATA_TAG, data);
		}
	}

	/**
	 * 返回成功消息
	 * 
	 * @return 成功消息
	 */
	public static JsonResult success() {
		return JsonResult.success("操作成功");
	}

	/**
	 * 返回成功数据
	 * 
	 * @return 成功消息
	 */
	public static JsonResult success(Object data) {
		return JsonResult.success("操作成功", data);
	}

	/**
	 * 返回成功消息
	 * @param msg
	 * @return
	 */
	public static JsonResult success(String msg) {
		return JsonResult.success(msg, null);
	}

	/**
	 * 返回成功消息
	 * @param msg
	 * @param data
	 * @return
	 */
	public static JsonResult success(String msg, Object data) {
		return new JsonResult(Type.SUCCESS, msg, data);
	}

	/**
	 * 返回警告消息
	 * @param msg
	 * @return
	 */
	public static JsonResult warn(String msg) {
		return JsonResult.warn(msg, null);
	}

	/**
	 * 返回警告消息
	 * @param msg
	 * @param data
	 * @return
	 */
	public static JsonResult warn(String msg, Object data) {
		return new JsonResult(Type.WARN, msg, data);
	}

	/**
	 * 返回错误消息
	 * 
	 * @return
	 */
	public static JsonResult error() {
		return JsonResult.error("操作失败");
	}

	/**
	 * 返回错误消息
	 * @param msg
	 * @return
	 */
	public static JsonResult error(String msg) {
		return JsonResult.error(msg, null);
	}

	/**
	 * 返回错误消息
	 * @param msg
	 * @param data
	 * @return
	 */
	public static JsonResult error(String msg, Object data) {
		return new JsonResult(Type.ERROR, msg, data);
	}
}
