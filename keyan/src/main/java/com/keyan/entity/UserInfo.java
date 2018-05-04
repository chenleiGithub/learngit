package com.keyan.entity;

public class UserInfo {
	// 用户ID
	private Integer userId;
	// 登录名
	private String userName;
	// 密码
	private String password;
	// 用户姓名
	private String name;
	// 性别（0：男，1：女，3：保密）
	private Integer sex;
	// 门牌号
	private String houseNumber;
	// 用户类型（0：超级管理员 1：普通管理员 2:普通用户）
	private Integer userType;
	// 居住状态（0：未迁出 1：已迁出）
	private Integer liveType;
	// 联系电话
	private String phone;
	// 是否认证
	private Integer isAuthentication;
	// 身份证编号
	private String cardId;
	// 楼栋id
	private Integer buildIngId;

	public String getCardId() {
		return cardId;
	}

	public void setCardId(String cardId) {
		this.cardId = cardId;
	}

	public Integer getBuildIngId() {
		return buildIngId;
	}

	public void setBuildIngId(Integer buildIngId) {
		this.buildIngId = buildIngId;
	}

	public Integer getIsAuthentication() {
		return isAuthentication;
	}

	public void setIsAuthentication(Integer isAuthentication) {
		this.isAuthentication = isAuthentication;
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public String getHouseNumber() {
		return houseNumber;
	}

	public void setHouseNumber(String houseNumber) {
		this.houseNumber = houseNumber;
	}

	public Integer getUserType() {
		return userType;
	}

	public void setUserType(Integer userType) {
		this.userType = userType;
	}

	public Integer getLiveType() {
		return liveType;
	}

	public void setLiveType(Integer liveType) {
		this.liveType = liveType;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

}
