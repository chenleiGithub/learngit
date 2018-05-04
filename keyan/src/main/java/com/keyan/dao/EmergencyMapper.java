package com.keyan.dao;

import java.util.List;
import java.util.Map;

import com.keyan.entity.Emergency;
import com.keyan.entity.EmergencyView;

public interface EmergencyMapper {
	// 查看相关项目总数
	Integer queryEmergencyMessageCount(EmergencyView emergencyView);

	// 查看相关项目
	List<EmergencyView> queryEmergencyMessage(EmergencyView emergencyView);

	// 项目删除（批量删除）
	int deleteList(Map<String, Object> map);

	// 新添项目
	int saveEmergency(Emergency emergency);
}
