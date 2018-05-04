package com.keyan.entity;

public class ServiceComplainView extends ServiceComplain {
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
	// 投诉日期
	private String strComplainDate;
	// 处理日期
	private String strHandleDate;
	// 投诉人姓名
	private String complainName;

	public String getComplainName() {
		return complainName;
	}

	public void setComplainName(String complainName) {
		this.complainName = complainName;
	}

	public String getStrComplainDate() {
		return strComplainDate;
	}

	public void setStrComplainDate(String strComplainDate) {
		this.strComplainDate = strComplainDate;
	}

	public String getStrHandleDate() {
		return strHandleDate;
	}

	public void setStrHandleDate(String strHandleDate) {
		this.strHandleDate = strHandleDate;
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
