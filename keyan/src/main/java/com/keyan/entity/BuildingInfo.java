package com.keyan.entity;

public class BuildingInfo {
	// 主键id
	private Integer id;
	// 楼栋名称
	private String buildName;
	// 住宅户数
	private Integer total;
	// 商用户数
	private Integer buCount;
	// 管理楼长
	private String manager;
	// 联系电话
	private String phone;
	// 补充说明
	private String note;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getBuildName() {
		return buildName;
	}

	public void setBuildName(String buildName) {
		this.buildName = buildName;
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	public Integer getBuCount() {
		return buCount;
	}

	public void setBuCount(Integer buCount) {
		this.buCount = buCount;
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
