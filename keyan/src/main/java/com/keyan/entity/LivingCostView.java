package com.keyan.entity;

public class LivingCostView extends LivingCost {
	// 开始数目
	private Integer startNumber;
	// 结束数目
	private Integer endNumber;
	// 每页显示数
	private Integer pageSize;
	// 数据总数
	private Integer dataCount;
	// 关键字
	private String keyValue;
	// 业主姓名
	private String userName;
	// 楼栋名称
	private String buildName;
	// 门牌号
	private String houseNumber;
	// 登记时间
	private String strRegisterTime;

	public String getStrRegisterTime() {
		return strRegisterTime;
	}

	public void setStrRegisterTime(String strRegisterTime) {
		this.strRegisterTime = strRegisterTime;
	}

	public String getBuildName() {
		return buildName;
	}

	public void setBuildName(String buildName) {
		this.buildName = buildName;
	}

	public String getHouseNumber() {
		return houseNumber;
	}

	public void setHouseNumber(String houseNumber) {
		this.houseNumber = houseNumber;
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

	public Integer getDataCount() {
		return dataCount;
	}

	public void setDataCount(Integer dataCount) {
		this.dataCount = dataCount;
	}

	public String getKeyValue() {
		return keyValue;
	}

	public void setKeyValue(String keyValue) {
		this.keyValue = keyValue;
	}

}
