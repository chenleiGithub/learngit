package com.keyan.entity;

import java.math.BigDecimal;
import java.util.Date;

public class Gathering {
	// 主键id
	private Integer id;
	// 收款编号
	private String gatheringCode;
	// 收款日期
	private Date gatheringDate;
	// 付款人员id
	private Integer paymentUserId;
	// 收款金额
	private BigDecimal gatheringMoney;
	// 收款方式（0：现金，1：转账）
	private Integer gatheringStyle;
	// 收款人员呢id
	private Integer gatheringUserId;
	// 收款事由（0：水电费，1：物管费
	private Integer gatheringReason;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getGatheringCode() {
		return gatheringCode;
	}

	public void setGatheringCode(String gatheringCode) {
		this.gatheringCode = gatheringCode;
	}

	public Date getGatheringDate() {
		return gatheringDate;
	}

	public void setGatheringDate(Date gatheringDate) {
		this.gatheringDate = gatheringDate;
	}

	public Integer getPaymentUserId() {
		return paymentUserId;
	}

	public void setPaymentUserId(Integer paymentUserId) {
		this.paymentUserId = paymentUserId;
	}

	public BigDecimal getGatheringMoney() {
		return gatheringMoney;
	}

	public void setGatheringMoney(BigDecimal gatheringMoney) {
		this.gatheringMoney = gatheringMoney;
	}

	public Integer getGatheringStyle() {
		return gatheringStyle;
	}

	public void setGatheringStyle(Integer gatheringStyle) {
		this.gatheringStyle = gatheringStyle;
	}

	public Integer getGatheringUserId() {
		return gatheringUserId;
	}

	public void setGatheringUserId(Integer gatheringUserId) {
		this.gatheringUserId = gatheringUserId;
	}

	public Integer getGatheringReason() {
		return gatheringReason;
	}

	public void setGatheringReason(Integer gatheringReason) {
		this.gatheringReason = gatheringReason;
	}

}
