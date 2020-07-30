package com.daffodil.system.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.*;

import org.hibernate.annotations.GenericGenerator;

import com.daffodil.core.annotation.Dict;
import com.daffodil.core.annotation.Hql;
import com.daffodil.core.annotation.Hql.Logical;
import com.daffodil.core.entity.BaseEntity;
import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 通知公告表
 * 
 * @author yweijian
 * @date 2019年8月16日
 * @version 1.0
 */
@Entity
@Table(name = "sys_notice")
public class SysNotice extends BaseEntity {
	private static final long serialVersionUID = 1L;

	/** 公告标题 */
	private String noticeTitle;

	/** 公告类型（1通知 2公告） */
	private String noticeType;

	/** 公告内容 */
	private String noticeContent;

	/** 公告状态（0正常 1关闭） */
	private String status;
	
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

	/** 公告编号 */
	@Id
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	@Column(name = "notice_id")
	@Override
	public String getId() {
		return super.getId();
	}

	@Column(name = "notice_title")
	@NotBlank(message = "公告标题不能为空")
	@Size(min = 0, max = 50, message = "公告标题不能超过50个字符")
	@Hql(type = Logical.LIKE)
	public String getNoticeTitle() {
		return noticeTitle;
	}
	
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	@Column(name = "notice_type")
	@Dict(value = "sys_notice_type")
	@Hql(type = Logical.EQ)
	public String getNoticeType() {
		return noticeType;
	}
	
	public void setNoticeType(String noticeType) {
		this.noticeType = noticeType;
	}

	@Column(name = "notice_content", length=4000)
	@Hql(type = Logical.LIKE)
	public String getNoticeContent() {
		return noticeContent;
	}
	
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	@Column(name = "status")
	@Dict(value = "sys_data_status")
	@Hql(type = Logical.EQ)
	public String getStatus() {
		return status;
	}
	
	public void setStatus(String status) {
		this.status = status;
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
}
