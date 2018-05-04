package com.keyan.services;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.keyan.dao.EmergencyMapper;
import com.keyan.entity.Emergency;
import com.keyan.entity.EmergencyView;

@Service
public class EmergencyService {

	@Resource
	private EmergencyMapper emergencyMapper;

	// 查看相关项目信息
	public List<EmergencyView> queryEmergencyMessage(EmergencyView emergencyView) {
		return emergencyMapper.queryEmergencyMessage(emergencyView);
	}

	// 查看相关项目信息总数
	public Integer queryEmergencyMessageCount(EmergencyView emergencyView) {
		return emergencyMapper.queryEmergencyMessageCount(emergencyView);
	}

	// 项目删除
	public int deleteList(Map<String, Object> map) {
		return this.emergencyMapper.deleteList(map);
	}

	// 新添项目
	public int saveEmergency(Emergency emergency) {
		return this.emergencyMapper.saveEmergency(emergency);
	}
}
