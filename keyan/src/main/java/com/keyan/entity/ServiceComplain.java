package com.keyan.entity;

import java.util.Date;

public class ServiceComplain {
	// 主键id
	private Integer id;
	// 投诉人id
	private Integer complainUserid;
	// 投诉日期
	private Date complainDate;
	// 投诉内容
	private String complainContent;
	// 处理人员
	private String handleUserName;
	// 处理日期
	private Date handleDate;
	// 处理意见
	private String handleAdvice;
	// 处理结果
	private Integer result;
	// 投诉标题
	private String complainTitle;

	public String getComplainTitle() {
		return complainTitle;
	}

	public void setComplainTitle(String complainTitle) {
		this.complainTitle = complainTitle;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getComplainUserid() {
		return complainUserid;
	}

	public void setComplainUserid(Integer complainUserid) {
		this.complainUserid = complainUserid;
	}

	public Date getComplainDate() {
		return complainDate;
	}

	public void setComplainDate(Date complainDate) {
		this.complainDate = complainDate;
	}

	public String getComplainContent() {
		return complainContent;
	}

	public void setComplainContent(String complainContent) {
		this.complainContent = complainContent;
	}

	public String getHandleUserName() {
		return handleUserName;
	}

	public void setHandleUserName(String handleUserName) {
		this.handleUserName = handleUserName;
	}

	public Date getHandleDate() {
		return handleDate;
	}

	public void setHandleDate(Date handleDate) {
		this.handleDate = handleDate;
	}

	public String getHandleAdvice() {
		return handleAdvice;
	}

	public void setHandleAdvice(String handleAdvice) {
		this.handleAdvice = handleAdvice;
	}

	public Integer getResult() {
		return result;
	}

	public void setResult(Integer result) {
		this.result = result;
	}

}
