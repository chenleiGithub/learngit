package com.keyan.entity;

public class Emergency {
	// 主键id
	private Integer id;
	// 事件编号
	private String eventCode;
	// 事件主题
	private String eventTheme;
	// 处理人员
	private String handUser;
	// 处理结果
	private String result;
	// 事件内容
	private String eventContent;

	public String getEventContent() {
		return eventContent;
	}

	public void setEventContent(String eventContent) {
		this.eventContent = eventContent;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getEventCode() {
		return eventCode;
	}

	public void setEventCode(String eventCode) {
		this.eventCode = eventCode;
	}

	public String getEventTheme() {
		return eventTheme;
	}

	public void setEventTheme(String eventTheme) {
		this.eventTheme = eventTheme;
	}

	public String getHandUser() {
		return handUser;
	}

	public void setHandUser(String handUser) {
		this.handUser = handUser;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

}
