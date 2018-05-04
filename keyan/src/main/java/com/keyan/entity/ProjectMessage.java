package com.keyan.entity;

import java.util.Date;

public class ProjectMessage {
	// 项目id
	private Integer projectId;
	// 项目类型
	private String projectType;
	// 项目名称
	private String projectName;
	// 项目申请人
	private Integer responsePerson;
	// 申请时间
	Date applyTime;
	// 申请时间（String类型）
	String strApplyTime;
	// 项目申请人姓名
	private String userName;
	// 项目内容
	private String projectContent;
	// 预算
	private Integer projectBudget;
	// 截止日期
	private String projectDeadline;
	// 审核情况
	private Integer projectApprove;
	// 回收站状态
	private Integer recycleStatus;
	// 开始数目
	private Integer startNumber;
	// 结束数目
	private Integer endNumber;
	// 每页显示数
	private Integer pageSize;
	// 项目成员
	private String projectMembers;

	public String getStrApplyTime() {
		return strApplyTime;
	}

	public void setStrApplyTime(String strApplyTime) {
		this.strApplyTime = strApplyTime;
	}

	public String getProjectMembers() {
		return projectMembers;
	}

	public void setProjectMembers(String projectMembers) {
		this.projectMembers = projectMembers;
	}

	public Date getApplyTime() {
		return applyTime;
	}

	public void setApplyTime(Date applyTime) {
		this.applyTime = applyTime;
	}

	public Integer getRecycleStatus() {
		return recycleStatus;
	}

	public void setRecycleStatus(Integer recycleStatus) {
		this.recycleStatus = recycleStatus;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Integer getStartNumber() {
		return startNumber;
	}

	public void setStartNumber(Integer startNumber) {
		this.startNumber = startNumber;
	}

	public Integer getEndNumber() {
		return endNumber;
	}

	public void setEndNumber(Integer endNumber) {
		this.endNumber = endNumber;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getProjectId() {
		return projectId;
	}

	public void setProjectId(Integer projectId) {
		this.projectId = projectId;
	}

	public String getProjectType() {
		return projectType;
	}

	public void setProjectType(String projectType) {
		this.projectType = projectType;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public Integer getResponsePerson() {
		return responsePerson;
	}

	public void setResponsePerson(Integer responsePerson) {
		this.responsePerson = responsePerson;
	}

	public String getProjectContent() {
		return projectContent;
	}

	public void setProjectContent(String projectContent) {
		this.projectContent = projectContent;
	}

	public Integer getProjectBudget() {
		return projectBudget;
	}

	public void setProjectBudget(Integer projectBudget) {
		this.projectBudget = projectBudget;
	}

	public String getProjectDeadline() {
		return projectDeadline;
	}

	public void setProjectDeadline(String projectDeadline) {
		this.projectDeadline = projectDeadline;
	}

	public Integer getProjectApprove() {
		return projectApprove;
	}

	public void setProjectApprove(Integer projectApprove) {
		this.projectApprove = projectApprove;
	}

}
