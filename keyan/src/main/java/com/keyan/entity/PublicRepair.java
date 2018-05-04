package com.keyan.entity;

import java.math.BigDecimal;
import java.util.Date;

public class PublicRepair {
	// 主键id
	private Integer id;
	// 公共财物名称
	private String goodsName;
	// 存放位置
	private String position;
	// 报修人员id
	private Integer userId;
	// 报修日期
	private Date repairDate;
	// 报修原因
	private String reason;
	// 维修人员
	private String repairUser;
	// 维修费用
	private BigDecimal repairMoney;
	// 维修结果
	private String repairResult;

	public String getRepairUser() {
		return repairUser;
	}

	public void setRepairUser(String repairUser) {
		this.repairUser = repairUser;
	}

	public BigDecimal getRepairMoney() {
		return repairMoney;
	}

	public void setRepairMoney(BigDecimal repairMoney) {
		this.repairMoney = repairMoney;
	}

	public String getRepairResult() {
		return repairResult;
	}

	public void setRepairResult(String repairResult) {
		this.repairResult = repairResult;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Date getRepairDate() {
		return repairDate;
	}

	public void setRepairDate(Date repairDate) {
		this.repairDate = repairDate;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

}