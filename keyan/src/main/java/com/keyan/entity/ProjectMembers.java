package com.keyan.entity;

public class ProjectMembers {
	// 项目id
	private Integer projectId;
	// 成员id
	private Integer userId;
	// 成员名称
	private String userName;

	public Integer getProjectId() {
		return projectId;
	}

	public void setProjectId(Integer projectId) {
		this.projectId = projectId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

}
