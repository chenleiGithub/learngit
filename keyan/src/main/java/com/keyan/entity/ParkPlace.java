package com.keyan.entity;

import java.math.BigDecimal;

public class ParkPlace {
	// 主键id
	private Integer id;
	// 报修人员id
	private Integer userId;
	// 车位编号
	private String parkPlaceCode;
	// 停车面积
	private String parkPlaceArea;
	// 车牌号
	private String plateNumber;
	// 车位费用
	private BigDecimal price;
	// 缴纳状态（0：未支付，1：已支付）
	private Integer payStatus;

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public Integer getPayStatus() {
		return payStatus;
	}

	public void setPayStatus(Integer payStatus) {
		this.payStatus = payStatus;
	}

	public String getPlateNumber() {
		return plateNumber;
	}

	public void setPlateNumber(String plateNumber) {
		this.plateNumber = plateNumber;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getParkPlaceCode() {
		return parkPlaceCode;
	}

	public void setParkPlaceCode(String parkPlaceCode) {
		this.parkPlaceCode = parkPlaceCode;
	}

	public String getParkPlaceArea() {
		return parkPlaceArea;
	}

	public void setParkPlaceArea(String parkPlaceArea) {
		this.parkPlaceArea = parkPlaceArea;
	}

}
