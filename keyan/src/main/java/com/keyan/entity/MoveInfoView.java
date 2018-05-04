package com.keyan.entity;

public class MoveInfoView extends MoveInfo {
	// 用户姓名
	private String name;
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
	// 迁移日期
	private String strMoveDate;

	public String getStrMoveDate() {
		return strMoveDate;
	}

	public void setStrMoveDate(String strMoveDate) {
		this.strMoveDate = strMoveDate;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
