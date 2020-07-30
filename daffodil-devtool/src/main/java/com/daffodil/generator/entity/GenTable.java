package com.daffodil.generator.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotBlank;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.annotations.GenericGenerator;

import com.daffodil.core.annotation.Hql;
import com.daffodil.core.annotation.Hql.Logical;
import com.daffodil.core.constant.GenConstants;
import com.daffodil.core.entity.BaseEntity;
import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 数据库表
 * @author weiji
 * @date 2020年5月13日
 * @version 1.0
 */
@Entity
@Table(name = "gen_table")
public class GenTable extends BaseEntity {
	private static final long serialVersionUID = 1L;

	/** 表名称 */
	private String tableName;

	/** 表描述 */
	private String tableComment;

	/** 实体类名称(首字母大写) */
	private String className;

	/** 使用的模板（crud单表操作 tree树表操作） */
	private String tplCategory;

	/** 生成包路径 */
	private String packageName;

	/** 生成模块名 */
	private String moduleName;

	/** 生成业务名 */
	private String businessName;

	/** 生成功能名 */
	private String functionName;

	/** 生成作者 */
	private String functionAuthor;

	/** 树编码字段 */
	private String treeCode;

	/** 树父编码字段 */
	private String treeParentCode;

	/** 树名称字段 */
	private String treeName;
	
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
	
	/** 主键信息 */
	private GenTableColumn pkColumn;

	/** 表列信息 */
	private List<GenTableColumn> columns;

	@Id
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	@Column(name = "table_id")
	@Override
	public String getId() {
		return super.getId();
	}

	@NotBlank(message = "表名称不能为空")
	@Column(name = "table_name")
	@Hql(type = Logical.LIKE)
	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	@NotBlank(message = "表描述不能为空")
	@Column(name = "table_comment")
	@Hql(type = Logical.LIKE)
	public String getTableComment() {
		return tableComment;
	}

	public void setTableComment(String tableComment) {
		this.tableComment = tableComment;
	}

	@NotBlank(message = "实体类名称不能为空")
	@Column(name = "class_name")
	@Hql(type = Logical.LIKE)
	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	@Column(name = "tpl_category")
	@Hql(type = Logical.EQ)
	public String getTplCategory() {
		return tplCategory;
	}

	public void setTplCategory(String tplCategory) {
		this.tplCategory = tplCategory;
	}

	//@NotBlank(message = "生成包路径不能为空")
	@Column(name = "package_name")
	public String getPackageName() {
		return packageName;
	}

	public void setPackageName(String packageName) {
		this.packageName = packageName;
	}

	//@NotBlank(message = "生成模块名不能为空")
	@Column(name = "module_name")
	public String getModuleName() {
		return moduleName;
	}

	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}

	//@NotBlank(message = "生成业务名不能为空")
	@Column(name = "business_name")
	public String getBusinessName() {
		return businessName;
	}

	public void setBusinessName(String businessName) {
		this.businessName = businessName;
	}

	//@NotBlank(message = "生成功能名不能为空")
	@Column(name = "function_name")
	public String getFunctionName() {
		return functionName;
	}

	public void setFunctionName(String functionName) {
		this.functionName = functionName;
	}

	@NotBlank(message = "作者不能为空")
	@Column(name = "function_author")
	public String getFunctionAuthor() {
		return functionAuthor;
	}

	public void setFunctionAuthor(String functionAuthor) {
		this.functionAuthor = functionAuthor;
	}

	@Column(name = "tree_code")
	public String getTreeCode() {
		return treeCode;
	}

	public void setTreeCode(String treeCode) {
		this.treeCode = treeCode;
	}

	@Column(name = "tree_parent_code")
	public String getTreeParentCode() {
		return treeParentCode;
	}

	public void setTreeParentCode(String treeParentCode) {
		this.treeParentCode = treeParentCode;
	}

	@Column(name = "tree_name")
	public String getTreeName() {
		return treeName;
	}

	public void setTreeName(String treeName) {
		this.treeName = treeName;
	}

	@Column(name = "create_by")
	public String getCreateBy() {
		return createBy;
	}

	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@Column(name = "create_time")
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

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@Column(name = "update_time")
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

	@Transient
	public GenTableColumn getPkColumn() {
		return pkColumn;
	}

	public void setPkColumn(GenTableColumn pkColumn) {
		this.pkColumn = pkColumn;
	}

	@Transient
	public List<GenTableColumn> getColumns() {
		return columns;
	}

	public void setColumns(List<GenTableColumn> columns) {
		this.columns = columns;
	}
	
	@Transient
	public boolean isTree() {
		return isTree(this.tplCategory);
	}

	public static boolean isTree(String tplCategory) {
		return tplCategory != null && StringUtils.equals(GenConstants.TPL_TREE, tplCategory);
	}

	@Transient
	public boolean isCrud() {
		return isCrud(this.tplCategory);
	}

	public static boolean isCrud(String tplCategory) {
		return tplCategory != null && StringUtils.equals(GenConstants.TPL_CRUD, tplCategory);
	}
}