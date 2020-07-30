package com.daffodil.system.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.daffodil.core.annotation.Hql;
import com.daffodil.core.annotation.Hql.Logical;
import com.daffodil.core.entity.BaseEntity;
import com.daffodil.core.enums.OnlineStatus;

/**
 * 当前在线会话
 * 
 * @author yweijian
 * @date 2019年8月16日
 * @version 1.0
 */
@Entity
@Table(name = "sys_user_online")
public class SysUserOnline extends BaseEntity {
	private static final long serialVersionUID = 1L;

	/** 部门名称 */
	private String deptName;

	/** 登录名称 */
	private String loginName;

	/** 登录IP地址 */
	private String ipaddr;

	/** 登录地址 */
	private String loginLocation;

	/** 浏览器类型 */
	private String browser;

	/** 操作系统 */
	private String os;

	/** session创建时间 */
	private Date startTimestamp;

	/** session最后访问时间 */
	private Date lastAccessTime;

	/** 超时时间，单位为分钟 */
	private Long expireTime;

	/** 在线状态 */
	private OnlineStatus status = OnlineStatus.ON_LINE;

	/** 用户会话编号 */
	@Id
	@Column(name = "session_id")
	@Override
	public String getId() {
		return super.getId();
	}

	@Column(name = "dept_name")
	@Hql(type = Logical.LIKE)
	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	@Column(name = "login_name")
	@Hql(type = Logical.LIKE)
	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	@Column(name = "ipaddr")
	@Hql(type = Logical.LIKE)
	public String getIpaddr() {
		return ipaddr;
	}

	public void setIpaddr(String ipaddr) {
		this.ipaddr = ipaddr;
	}

	@Column(name = "login_location")
	@Hql(type = Logical.LIKE)
	public String getLoginLocation() {
		return loginLocation;
	}

	public void setLoginLocation(String loginLocation) {
		this.loginLocation = loginLocation;
	}

	@Column(name = "browser")
	@Hql(type = Logical.LIKE)
	public String getBrowser() {
		return browser;
	}

	public void setBrowser(String browser) {
		this.browser = browser;
	}

	@Column(name = "os")
	@Hql(type = Logical.LIKE)
	public String getOs() {
		return os;
	}

	public void setOs(String os) {
		this.os = os;
	}

	@Column(name = "start_timestamp")
	public Date getStartTimestamp() {
		return startTimestamp;
	}

	public void setStartTimestamp(Date startTimestamp) {
		this.startTimestamp = startTimestamp;
	}

	@Column(name = "last_access_time")
	public Date getLastAccessTime() {
		return lastAccessTime;
	}

	public void setLastAccessTime(Date lastAccessTime) {
		this.lastAccessTime = lastAccessTime;
	}

	@Column(name = "expire_time")
	public Long getExpireTime() {
		return expireTime;
	}

	public void setExpireTime(Long expireTime) {
		this.expireTime = expireTime;
	}

	@Column(name = "status")
	public OnlineStatus getStatus() {
		return status;
	}

	public void setStatus(OnlineStatus status) {
		this.status = status;
	}

}
