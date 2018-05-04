package com.keyan.entity;

import java.math.BigDecimal;
import java.util.Date;

public class LivingCost {
	// 主键id
	private Integer id;
	// 户主id
	private Integer userId;
	// 水费
	private BigDecimal waterCost;
	// 电费
	private BigDecimal powerCost;
	// 气费
	private BigDecimal gasCost;
	// 总费用
	private BigDecimal allCost;
	// 缴纳状态（0：未缴纳，1：已缴纳）
	private Integer payStatus;
	// 类型(0:水电费，1：物管费)
	private Integer type;
	// 登记时间
	private Date registerTime;

	public Date getRegisterTime() {
		return registerTime;
	}

	public void setRegisterTime(Date registerTime) {
		this.registerTime = registerTime;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
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

	public BigDecimal getWaterCost() {
		return waterCost;
	}

	public void setWaterCost(BigDecimal waterCost) {
		this.waterCost = waterCost;
	}

	public BigDecimal getPowerCost() {
		return powerCost;
	}

	public void setPowerCost(BigDecimal powerCost) {
		this.powerCost = powerCost;
	}

	public BigDecimal getGasCost() {
		return gasCost;
	}

	public void setGasCost(BigDecimal gasCost) {
		this.gasCost = gasCost;
	}

	public BigDecimal getAllCost() {
		return allCost;
	}

	public void setAllCost(BigDecimal allCost) {
		this.allCost = allCost;
	}

	public Integer getPayStatus() {
		return payStatus;
	}

	public void setPayStatus(Integer payStatus) {
		this.payStatus = payStatus;
	}

}
