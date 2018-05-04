package com.keyan.services;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.keyan.dao.PrivateRepairMapper;
import com.keyan.entity.PrivateRepair;
import com.keyan.entity.PrivateRepairView;

@Service
public class PrivateRepairService {

	@Resource
	private PrivateRepairMapper privateRepairMapper;

	// 查看相关项目信息
	public List<PrivateRepairView> queryPrivateRepairMessage(PrivateRepairView privateRepairView) {
		return privateRepairMapper.queryPrivateRepairMessage(privateRepairView);
	}

	// 查看相关项目信息总数
	public Integer queryPrivateRepairMessageCount(PrivateRepairView privateRepairView) {
		return privateRepairMapper.queryPrivateRepairMessageCount(privateRepairView);
	}

	// 项目删除
	public int deleteList(Map<String, Object> map) {
		return this.privateRepairMapper.deleteList(map);
	}

	// 新添项目
	public int savePrivateRepair(PrivateRepair privateRepair) {
		return this.privateRepairMapper.savePrivateRepair(privateRepair);
	}
	
	public int updatePrivateRepair(PrivateRepair privateRepair) {
		return this.privateRepairMapper.updatePrivateRepair(privateRepair);
	}
}
