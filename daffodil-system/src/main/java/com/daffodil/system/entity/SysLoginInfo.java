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
 * 系统访问记录表
 * 
 * @author yweijian
 * @date 2019年8月16日
 * @version 1.0
 */
@Entity
@Table(name = "sys_login_info")
public class SysLoginInfo extends BaseEntity {
	private static final long serialVersionUID = 1L;

	/** 用户账号 */
	private String loginName;

	/** 登录状态 0成功 1失败 */
	private String status;

	/** 登录IP地址 */
	private String ipaddr;

	/** 登录地点 */
	private String loginLocation;

	/** 浏览器类型 */
	private String browser;

	/** 操作系统 */
	private String os;

	/** 提示消息 */
	private String msg;

	/** 访问时间 */
	private Date createTime;

	/** 登录信息编号 */
	@Id
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	@Column(name = "login_info_id")
	@Excel(name = "登录信息编号")
	@Override
	public String getId() {
		return super.getId();
	}

	@Column(name = "login_name")
	@Excel(name = "用户账号")
	@Hql(type = Logical.LIKE)
	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	@Column(name = "status")
	@Dict(value = "sys_success_status")
	@Excel(name = "登录状态", readConverterExp = "0=成功,1=失败")
	@Hql(type = Logical.EQ)
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Column(name = "ipaddr")
	@Excel(name = "登录地址")
	@Hql(type = Logical.LIKE)
	public String getIpaddr() {
		return ipaddr;
	}

	public void setIpaddr(String ipaddr) {
		this.ipaddr = ipaddr;
	}

	@Column(name = "login_location")
	@Excel(name = "登录地点")
	@Hql(type = Logical.LIKE)
	public String getLoginLocation() {
		return loginLocation;
	}

	public void setLoginLocation(String loginLocation) {
		this.loginLocation = loginLocation;
	}

	@Column(name = "browser")
	@Excel(name = "浏览器")
	@Hql(type = Logical.LIKE)
	public String getBrowser() {
		return browser;
	}

	public void setBrowser(String browser) {
		this.browser = browser;
	}

	@Column(name = "os")
	@Excel(name = "操作系统 ")
	@Hql(type = Logical.LIKE)
	public String getOs() {
		return os;
	}

	public void setOs(String os) {
		this.os = os;
	}

	@Column(name = "msg")
	@Excel(name = "提示消息")
	@Hql(type = Logical.LIKE)
	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	@Column(name = "create_time")
	@Excel(name = "访问时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
}