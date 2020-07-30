package com.daffodil.core.constant;

/**
 * 通用常量信息
 * 
 * @author yweijian
 * @date 2019年8月18日
 * @version 1.0
 */
public class Constants {
	
	/** 平台内系统根组织 */
	public static final String ROOT = "root";
	
	/** 平台内系统超级管理员关键字 */
	public static final String SYSADMIN = "SysAdmin";

	/** 正常状态 */
	public static final String NORMAL = "0";

	/** 异常状态 */
	public static final String EXCEPTION = "1";
	
	/** 在办状态 */
	public static final String UNFINISHED = "0";
	
	/** 已办状态 */
	public static final String FINISHED = "1";

	/** 删除状态 */
	public static final String DELETED = "2";
	
	/** 成功标识  */
	public static final String SUCCESS = "0";

	/** 失败标识 */
	public static final String FAIL = "1";
	
	/** 登录成功 */
	public static final String LOGIN_SUCCESS = "success";

	/** 注销 */
	public static final String LOGOUT = "logout";

	/** 登录失败 */
	public static final String LOGIN_FAIL = "error";

	/** 是 */
	public static final String YES = "Y";
	
	/** 否 */
	public static final String NO = "N";

	/** 用户名长度限制最小长度2个字符 */
	public static final int USERNAME_MIN_LENGTH = 2;
	
	/** 用户名长度限制最大长度20个字符 */
	public static final int USERNAME_MAX_LENGTH = 20;

	/** 唯一结果码 :false（数据不存在即唯一）*/
	public final static boolean IS_UNIQUE = false;
	
	/** 唯一结果码:ture（数据存在即不唯一） */
	public final static boolean NOT_UNIQUE = true;

	/** 密码长度限制最小长度6个字符 */
	public static final int PASSWORD_MIN_LENGTH = 6;
	
	/** 密码长度限制最大长度20个字符 */
	public static final int PASSWORD_MAX_LENGTH = 20;

	/**手机号码格式限制 */
	public static final String MOBILE_PHONE_NUMBER_PATTERN = "^0{0,1}(13[0-9]|15[0-9]|14[0-9]|18[0-9])[0-9]{8}$";

	/** 邮箱格式限制 */
	public static final String EMAIL_PATTERN = "^((([a-z]|\\d|[!#\\$%&'\\*\\+\\-\\/=\\?\\^_`{\\|}~]|[\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF])+(\\.([a-z]|\\d|[!#\\$%&'\\*\\+\\-\\/=\\?\\^_`{\\|}~]|[\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF])+)*)|((\\x22)((((\\x20|\\x09)*(\\x0d\\x0a))?(\\x20|\\x09)+)?(([\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x7f]|\\x21|[\\x23-\\x5b]|[\\x5d-\\x7e]|[\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF])|(\\\\([\\x01-\\x09\\x0b\\x0c\\x0d-\\x7f]|[\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF]))))*(((\\x20|\\x09)*(\\x0d\\x0a))?(\\x20|\\x09)+)?(\\x22)))@((([a-z]|\\d|[\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF])|(([a-z]|\\d|[\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF])([a-z]|\\d|-|\\.|_|~|[\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF])*([a-z]|\\d|[\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF])))\\.)+(([a-z]|[\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF])|(([a-z]|[\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF])([a-z]|\\d|-|\\.|_|~|[\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF])*([a-z]|[\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF])))\\.?";

	/** 当前页码 */
	public static final String PAGE_NUM = "pageNum";

	/** 每页显示记录数 */
	public static final String PAGE_SIZE = "pageSize";

	/** 排序关键字 */
	public static final String ORDER_BY_KEY = "order by";
	
	/** 排序列 */
	public static final String ORDER_BY_COLUMN = "orderByColumn";
	
	/** 排序 倒序 =desc，正序=asc */
	public static final String IS_ASC = "isAsc";
	
	/** 开始时间 */
	public static final String START_TIME = "startTime";
	
	public static final String START_TIME_BRACKET = "query[startTime]";
	
	/** 结束时间 */
	public static final String END_TIME = "endTime";
	
	public static final String END_TIME_BRACKET = "query[endTime]";
	
	/** 时间后缀 */
	public static final String DATE_TIME_SUBFIX = " 00:00:00";
	
	/** 全部数据权限 */
	public static final String DATA_SCOPE_ALL = "1";

	/** 自定数据权限 */
	public static final String DATA_SCOPE_CUSTOM = "2";

	/** 部门数据权限 */
	public static final String DATA_SCOPE_DEPT = "3";

	/** 部门及以下数据权限 */
	public static final String DATA_SCOPE_DEPT_AND_CHILD = "4";

	/** 仅本用户数据权限 */
	public static final String DATA_SCOPE_SELF = "5";
	
	/** 待发布状态 */
	public static final String UNPUBLISH = "0";
	
	/** 已发布状态 */
	public static final String PUBLISH = "1";
}
