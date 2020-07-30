package com.daffodil.system.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.daffodil.core.annotation.Dict;
import com.daffodil.core.annotation.Excel;
import com.daffodil.core.annotation.Hql;
import com.daffodil.core.annotation.Hql.Logical;
import com.daffodil.core.entity.BaseEntity;

/**
 * 操作日志记录表
 * @author yweijian
 * @date 2019年12月16日
 * @version 1.0
 */
@Entity
@Table(name = "sys_oper_log")
public class SysOperLog extends BaseEntity {
	private static final long serialVersionUID = 1L;

	/** 操作模块 */
	private String title;

	/** 业务类型（0其它,1新增,2修改,3删除,4授权,5导出,6导入,7强退,8生成代码,9清空数据） */
	private String businessType;

	/** 请求方法 */
	private String method;

	/** 操作类别（0其它 1PC端 2移动端） */
	private String operatorType;

	/** 操作人员 */
	private String operName;

	/** 部门名称 */
	private String deptName;

	/** 请求url */
	private String operUrl;

	/** 操作地址 */
	private String operIp;

	/** 操作地点 */
	private String operLocation;

	/** 请求参数 */
	private String operParam;

	/** 操作状态（0正常 1异常） */
	private String status;

	/** 错误消息 */
	private String errorMsg;

	/** 操作时间 */
	private Date createTime;

	/** 操作编号 */
	@Id
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	@Column(name = "oper_log_id")
	@Excel(name = "操作编号")
	@Override
	public String getId() {
		return super.getId();
	}

	@Column(name = "title")
	@Excel(name = "操作模块")
	@Hql(type = Logical.LIKE)
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "business_type")
	@Dict(value = "sys_business_type")
	@Excel(name = "业务类型", readConverterExp = "0=其它,1=新增,2=修改,3=删除,4=授权,5=导出,6=导入,7=强退,8=生成代码,9=清空数据")
	@Hql(type = Logical.IN)
	public String getBusinessType() {
		return businessType;
	}

	public void setBusinessType(String businessType) {
		this.businessType = businessType;
	}

	@Column(name = "method")
	@Excel(name = "请求方法")
	@Hql(type = Logical.EQ)
	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	@Column(name = "operator_type")
	@Dict(value = "sys_client_type")
	@Excel(name = "操作类别", readConverterExp = "0=其它,1=PC端,2=移动端")
	@Hql(type = Logical.EQ)
	public String getOperatorType() {
		return operatorType;
	}

	public void setOperatorType(String operatorType) {
		this.operatorType = operatorType;
	}

	@Column(name = "oper_name")
	@Excel(name = "操作人员")
	@Hql(type = Logical.LIKE)
	public String getOperName() {
		return operName;
	}

	public void setOperName(String operName) {
		this.operName = operName;
	}

	@Column(name = "dept_name")
	@Excel(name = "部门名称")
	@Hql(type = Logical.LIKE)
	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	@Column(name = "oper_url",length=1024)
	@Excel(name = "请求地址")
	@Hql(type = Logical.LIKE)
	public String getOperUrl() {
		return operUrl;
	}

	public void setOperUrl(String operUrl) {
		this.operUrl = operUrl;
	}

	@Column(name = "oper_ip")
	@Excel(name = "操作地址")
	@Hql(type = Logical.LIKE)
	public String getOperIp() {
		return operIp;
	}

	public void setOperIp(String operIp) {
		this.operIp = operIp;
	}

	@Column(name = "oper_location")
	@Excel(name = "操作地点")
	@Hql(type = Logical.LIKE)
	public String getOperLocation() {
		return operLocation;
	}

	public void setOperLocation(String operLocation) {
		this.operLocation = operLocation;
	}

	@Column(name = "oper_param", length=4000)
	@Excel(name = "请求参数")
	@Hql(type = Logical.LIKE)
	public String getOperParam() {
		return operParam;
	}

	public void setOperParam(String operParam) {
		this.operParam = operParam;
	}

	@Column(name = "status")
	@Dict(value = "sys_success_status")
	@Excel(name = "状态", readConverterExp = "0=成功,1=失败")
	@Hql(type = Logical.EQ)
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Column(name = "error_msg", length=4000)
	@Excel(name = "错误消息")
	@Hql(type = Logical.LIKE)
	public String getErrorMsg() {
		return errorMsg;
	}

	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}

	@Column(name = "create_time")
	@Excel(name = "操作时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

}
