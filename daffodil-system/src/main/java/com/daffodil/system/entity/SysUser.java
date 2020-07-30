package com.daffodil.system.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.hibernate.annotations.GenericGenerator;

import com.daffodil.core.annotation.Dict;
import com.daffodil.core.annotation.Excel;
import com.daffodil.core.annotation.Excel.Type;
import com.daffodil.core.annotation.Hql;
import com.daffodil.core.annotation.Hql.Logical;
import com.daffodil.core.entity.BaseEntity;
import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 用户表
 * 
 * @author yweijian
 * @date 2019年12月12日
 * @version 1.0
 */
@Entity
@Table(name = "sys_user")
public class SysUser extends BaseEntity {
	
	private static final long serialVersionUID = 1L;
	
	/** 是否是管理员 (Y=是,N=否)*/
	private String isAdmin;

	/** 部门ID */
	private String deptId;

	/** 部门父ID */
	private String parentId;

	/** 登录名称 */
	private String loginName;

	/** 用户名称 */
	private String userName;

	/** 用户邮箱 */
	private String email;

	/** 手机号码 */
	private String phone;

	/** 用户性别 */
	private String sex;

	/** 用户头像 */
	private String avatar;

	/** 密码 */
	private String password;

	/** 盐加密 */
	private String salt;

	/** 帐号状态（0正常 1停用 2删除） */
	private String status;

	/** 最后登陆IP */
	private String loginIp;

	/** 最后登陆时间 */
	private Date loginTime;

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
	
	/** 部门对象 */
	private SysDept dept;

	/** 角色对象 */
	private List<SysRole> roles;

	/** 角色组id */
	private String[] roleIds;
	
	/** 岗位对象 */
	private List<SysPost> posts;

	/** 岗位组id */
	private String[] postIds;

	/** 用户ID */
	@Id
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	@Column(name = "user_id")
	@Excel(name = "用户编号", type = Type.EXPORT)
	@Override
	public String getId() {
		return super.getId();
	}

	@Column(name = "is_admin")
	@Hql(type = Logical.EQ)
	public String getIsAdmin() {
		return isAdmin;
	}

	public void setIsAdmin(String isAdmin) {
		this.isAdmin = isAdmin;
	}
	
	@Column(name = "dept_id")
	@Excel(name = "部门编号", type = Type.IMPORT)
	public String getDeptId() {
		return deptId;
	}

	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}

	@Column(name = "parent_id")
	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	@Column(name = "login_name")
	@Excel(name = "登录名称")
	@NotBlank(message = "登录账号不能为空")
	@Size(min = 0, max = 30, message = "登录账号长度不能超过30个字符")
	@Hql(type = Logical.LIKE)
	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	@Column(name = "user_name")
	@Excel(name = "用户名称")
	@Size(min = 0, max = 30, message = "用户昵称长度不能超过30个字符")
	@Hql(type = Logical.LIKE)
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Column(name = "email")
	@Excel(name = "用户邮箱")
	@Email(message = "邮箱格式不正确")
	@Size(min = 0, max = 50, message = "邮箱长度不能超过50个字符")
	@Hql(type = Logical.LIKE)
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "phone")
	@Excel(name = "手机号码")
	@Size(min = 0, max = 11, message = "手机号码长度不能超过11个字符")
	@Hql(type = Logical.LIKE)
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Column(name = "sex")
	@Dict(value = "sys_user_sex")
	@Excel(name = "用户性别", readConverterExp = "0=男,1=女,2=未知")
	@Hql(type = Logical.EQ)
	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	@Column(name = "avatar")
	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	@Column(name = "password")
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "salt")
	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	@Column(name = "status")
	@Dict(value = "sys_data_status")
	@Excel(name = "帐号状态", readConverterExp = "0=正常,1=停用,2=删除")
	@Hql(type = Logical.EQ)
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Column(name = "login_ip")
	@Excel(name = "最后登陆IP", type = Type.EXPORT)
	@Hql(type = Logical.LIKE)
	public String getLoginIp() {
		return loginIp;
	}

	public void setLoginIp(String loginIp) {
		this.loginIp = loginIp;
	}

	@Column(name = "login_time")
	@Excel(name = "最后登陆时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss", type = Type.EXPORT)
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getLoginTime() {
		return loginTime;
	}

	public void setLoginTime(Date loginTime) {
		this.loginTime = loginTime;
	}
	
	@Column(name="create_by")
	@Hql(type = Logical.LIKE)
	public String getCreateBy() {
		return createBy;
	}

	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}

	@Column(name="create_time")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Column(name="update_by")
	@Hql(type = Logical.LIKE)
	public String getUpdateBy() {
		return updateBy;
	}

	public void setUpdateBy(String updateBy) {
		this.updateBy = updateBy;
	}

	@Column(name="update_time")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	@Column(name="remark")
	@Hql(type = Logical.LIKE)
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Transient
	public SysDept getDept() {
		if (dept == null) {
			dept = new SysDept();
		}
		return dept;
	}

	public void setDept(SysDept dept) {
		this.dept = dept;
	}

	@Transient
	public List<SysRole> getRoles() {
		return roles;
	}

	public void setRoles(List<SysRole> roles) {
		this.roles = roles;
	}

	@Transient
	public String[] getRoleIds() {
		return roleIds;
	}

	public void setRoleIds(String[] roleIds) {
		this.roleIds = roleIds;
	}

	@Transient
	public List<SysPost> getPosts() {
		return posts;
	}

	public void setPosts(List<SysPost> posts) {
		this.posts = posts;
	}

	@Transient
	public String[] getPostIds() {
		return postIds;
	}

	public void setPostIds(String[] postIds) {
		this.postIds = postIds;
	}

}
