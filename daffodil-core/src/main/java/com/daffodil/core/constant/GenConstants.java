package com.daffodil.core.constant;

/**
 * 代码生成通用常量
 * 
 * @author yweijian
 * @date 2019年9月2日
 * @version 1.0
 */
public class GenConstants {
	
	/** 单表（增删改查） */
	public static final String TPL_CRUD = "crud";

	/** 树表（增删改查） */
	public static final String TPL_TREE = "tree";

	/** 树编码字段 */
	public static final String TREE_CODE = "treeCode";

	/** 树父编码字段 */
	public static final String TREE_PARENT_CODE = "treeParentCode";

	/** 树名称字段 */
	public static final String TREE_NAME = "treeName";

	/** 数据库字符串类型 */
	public static final String[] COLUMNTYPE_STR = { "char", "varchar", "narchar", "varchar2", "tinytext", "text", "mediumtext", "longtext" };

	/** 数据库时间类型 */
	public static final String[] COLUMNTYPE_TIME = { "datetime", "time", "date", "timestamp" };

	/** 数据库数字类型 */
	public static final String[] COLUMNTYPE_NUMBER = { "tinyint", "smallint", "mediumint", "int", "number", "integer", "bigint", "float", "float", "double", "decimal" };

	/** 页面不需要编辑字段 */
	public static final String[] COLUMNNAME_NOT_EDIT = { "id", "create_by", "create_time", "status", "update_by", "update_time" };

	/** 页面不需要显示的列表字段 */
	public static final String[] COLUMNNAME_NOT_LIST = { "id", "create_by", "create_time", "status", "update_by", "update_time", "remark" };

	/** 页面不需要查询字段 */
	public static final String[] COLUMNNAME_NOT_QUERY = { "id", "sort", "create_by", "create_time", "status", "update_by", "update_time", "remark" };

	/** 字符串类型 */
	public static final String TYPE_STRING = "String";

	/** 整型 */
	public static final String TYPE_INTEGER = "Integer";

	/** 长整型 */
	public static final String TYPE_LONG = "Long";

	/** 浮点型 */
	public static final String TYPE_DOUBLE = "Double";

	/** 高精度计算类型 */
	public static final String TYPE_BIGDECIMAL = "BigDecimal";

	/** 时间类型 */
	public static final String TYPE_DATE = "Date";
	
	/**
	 * 显示类型（input文本框、textarea文本域、select下拉框、checkbox复选框、radio单选框、datetime日期控件）
	 * @author yweijian
	 * @date 2020年5月20日
	 * @version 1.0
	 */
	public enum HtmlType {
		INPUT("input"), TEXTAREA("textarea"), SELECT("select"), RADIO("radio"), CHECKBOX("checkbox"), DATETIME("datetime");
		private final String value;

		HtmlType(String value) {
			this.value = value;
		}

		public String value() {
			return this.value;
		}
	}
	
	/**
	 * 逻辑运算符
	 * @author yweijian
	 * @date 2020年5月20日
	 * @version 1.0
	 */
	public enum QueryType {
		LIKE("like"), EQ("="), NEQ("!="), LEQ("<="), LT("<"), REQ(">="), RT(">"), NONE("");
		private final String value;

		QueryType(String value) {
			this.value = value;
		}

		public String value() {
			return this.value;
		}
	}

}
