package com.daffodil.generator.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.annotations.GenericGenerator;

import com.daffodil.core.annotation.Hql;
import com.daffodil.core.annotation.Hql.Logical;
import com.daffodil.core.constant.Constants;
import com.daffodil.core.entity.BaseEntity;
import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 代码生成-表-字段映射表
 * @author yweijian
 * @date 2020年5月15日
 * @version 1.0
 */
@Entity
@Table(name = "gen_table_column")
public class GenTableColumn extends BaseEntity {
	private static final long serialVersionUID = 1L;
	
	private String tableId;

	/** 列名称 */
	private String columnName;

	/** 列描述 */
	private String columnComment;

	/** 列类型 */
	private String columnType;

	/** JAVA字段名 */
	private String javaField;

	/** 是否主键（Y是） */
	private String isPk;

	/** 是否必填（Y是） */
	private String isRequired;

	/** 是否为插入字段（Y是） */
	private String isInsert;

	/** 是否编辑字段（Y是） */
	private String isEdit;

	/** 是否列表字段（Y是） */
	private String isList;

	/** 是否查询字段（Y是） */
	private String isQuery;

	/** 查询方式 LIKE("like"), EQ("="), NEQ("!="), LEQ("<="), LT("<"), REQ(">="), RT(">") */
	private String queryType;

	/** 显示类型（input文本框、textarea文本域、select下拉框、checkbox复选框、radio单选框、datetime日期控件） */
	private String htmlType;

	/** 字典类型 */
	private String dictType;

	/** 排序 */
	private Integer sort;
	
	/** 创建者 */
	private String createBy;

	/** 创建时间 */
	private Date createTime;

	/** 更新者 */
	private String updateBy;

	/** 更新时间 */
	private Date updateTime;

	/** 备注 */
	private String remark;

	@Id
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	@Column(name = "column_id")
	@Override
	public String getId() {
		return super.getId();
	}

	@Column(name = "table_id")
	@Hql(type = Logical.EQ)
	public String getTableId() {
		return tableId;
	}

	public void setTableId(String tableId) {
		this.tableId = tableId;
	}

	@Column(name = "column_name")
	public String getColumnName() {
		return columnName;
	}

	public void setColumnName(String columnName) {
		this.columnName = columnName;
	}

	@Column(name = "column_comment")
	public String getColumnComment() {
		return columnComment;
	}

	public void setColumnComment(String columnComment) {
		this.columnComment = columnComment;
	}

	@Column(name = "column_type")
	public String getColumnType() {
		return columnType;
	}

	public void setColumnType(String columnType) {
		this.columnType = columnType;
	}

	@Column(name = "java_field")
	public String getJavaField() {
		return javaField;
	}

	public void setJavaField(String javaField) {
		this.javaField = javaField;
	}

	@Column(name = "create_by")
	public String getCreateBy() {
		return createBy;
	}

	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}

	@Column(name = "create_time")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Column(name = "update_by")
	public String getUpdateBy() {
		return updateBy;
	}

	public void setUpdateBy(String updateBy) {
		this.updateBy = updateBy;
	}

	@Column(name = "update_time")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	@Column(name = "remark")
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Column(name = "is_pk")
	public String getIsPk() {
		return isPk;
	}
	
	public void setIsPk(String isPk) {
		this.isPk = isPk;
	}

	@Transient
	public boolean isPk() {
		return isPk(this.isPk);
	}

	public static boolean isPk(String isPk) {
		return isPk != null && StringUtils.equals(Constants.YES, isPk);
	}

	@Column(name = "is_required")
	public String getIsRequired() {
		return isRequired;
	}
	
	public void setIsRequired(String isRequired) {
		this.isRequired = isRequired;
	}

	@Transient
	public boolean isRequired() {
		return isRequired(this.isRequired);
	}

	public static boolean isRequired(String isRequired) {
		return isRequired != null && StringUtils.equals(Constants.YES, isRequired);
	}

	@Column(name = "is_insert")
	public String getIsInsert() {
		return isInsert;
	}
	
	public void setIsInsert(String isInsert) {
		this.isInsert = isInsert;
	}

	@Transient
	public boolean isInsert() {
		return isInsert(this.isInsert);
	}

	public static boolean isInsert(String isInsert) {
		return isInsert != null && StringUtils.equals(Constants.YES, isInsert);
	}

	@Column(name = "is_edit")
	public String getIsEdit() {
		return isEdit;
	}
	
	public void setIsEdit(String isEdit) {
		this.isEdit = isEdit;
	}

	@Transient
	public boolean isEdit() {
		return isInsert(this.isEdit);
	}

	public static boolean isEdit(String isEdit) {
		return isEdit != null && StringUtils.equals(Constants.YES, isEdit);
	}

	@Column(name = "is_list")
	public String getIsList() {
		return isList;
	}
	
	public void setIsList(String isList) {
		this.isList = isList;
	}

	@Transient
	public boolean isList() {
		return isList(this.isList);
	}

	public static boolean isList(String isList) {
		return isList != null && StringUtils.equals(Constants.YES, isList);
	}

	@Column(name = "is_query")
	public String getIsQuery() {
		return isQuery;
	}
	
	public void setIsQuery(String isQuery) {
		this.isQuery = isQuery;
	}

	@Transient
	public boolean isQuery() {
		return isQuery(this.isQuery);
	}

	public static boolean isQuery(String isQuery) {
		return isQuery != null && StringUtils.equals(Constants.YES, isQuery);
	}

	@Column(name = "query_type")
	public String getQueryType() {
		return queryType;
	}
	
	public void setQueryType(String queryType) {
		this.queryType = queryType;
	}

	@Column(name = "html_type")
	public String getHtmlType() {
		return htmlType;
	}

	public void setHtmlType(String htmlType) {
		this.htmlType = htmlType;
	}

	@Column(name = "dict_type")
	public String getDictType() {
		return dictType;
	}

	public void setDictType(String dictType) {
		this.dictType = dictType;
	}
	
	@Column(name = "sort")
	public Integer getSort() {
		return sort;
	}
	
	public void setSort(Integer sort) {
		this.sort = sort;
	}

	public String readConverterExp() {
		String remarks = StringUtils.substringBetween(this.columnComment, "（", "）");
		StringBuffer sb = new StringBuffer();
		if (StringUtils.isNotEmpty(remarks)) {
			for (String value : remarks.split(" ")) {
				if (StringUtils.isNotEmpty(value)) {
					Object startStr = value.subSequence(0, 1);
					String endStr = value.substring(1);
					sb.append("").append(startStr).append("=").append(endStr).append(",");
				}
			}
			return sb.deleteCharAt(sb.length() - 1).toString();
		} else {
			return this.columnComment;
		}
	}
}