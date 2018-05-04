package com.keyan.entity;

import java.util.Date;

public class MoveInfo {
	//主键id
	private Integer id;
	//用户id
	private Integer userId;
	//迁移日期
	private Date moveDate;
	//迁移原因
	private String moveReason;
	//管理楼长
	private String manager;
	//联系电话
	private String phone;
	//补充说明
	private String note;
	
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
	public Date getMoveDate() {
		return moveDate;
	}
	public void setMoveDate(Date moveDate) {
		this.moveDate = moveDate;
	}
	public String getMoveReason() {
		return moveReason;
	}
	public void setMoveReason(String moveReason) {
		this.moveReason = moveReason;
	}
	public String getManager() {
		return manager;
	}
	public void setManager(String manager) {
		this.manager = manager;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	
	

}
