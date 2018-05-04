package com.keyan.entity;

public class GatheringView extends Gathering {
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
	// 收款日期
	private String strGatheringDate;
	private String paymentUserName;
	private String gatheringUserName;

	public String getStrGatheringDate() {
		return strGatheringDate;
	}

	public void setStrGatheringDate(String strGatheringDate) {
		this.strGatheringDate = strGatheringDate;
	}

	public String getPaymentUserName() {
		return paymentUserName;
	}

	public void setPaymentUserName(String paymentUserName) {
		this.paymentUserName = paymentUserName;
	}

	public String getGatheringUserName() {
		return gatheringUserName;
	}

	public void setGatheringUserName(String gatheringUserName) {
		this.gatheringUserName = gatheringUserName;
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
