package com.keyan.services;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.keyan.dao.PublicRepairMapper;
import com.keyan.entity.PublicRepair;
import com.keyan.entity.PublicRepairView;

@Service
public class PublicRepairService {

	@Resource
	private PublicRepairMapper publicRepairMapper;

	// 查看相关项目信息
	public List<PublicRepairView> queryPublicRepairMessage(PublicRepairView PublicRepairView) {
		return publicRepairMapper.queryPublicRepairMessage(PublicRepairView);
	}

	// 查看相关项目信息总数
	public Integer queryPublicRepairMessageCount(PublicRepairView PublicRepairView) {
		return publicRepairMapper.queryPublicRepairMessageCount(PublicRepairView);
	}

	// 项目删除
	public int deleteList(Map<String, Object> map) {
		return this.publicRepairMapper.deleteList(map);
	}

	// 新添项目
	public int savePublicRepair(PublicRepair PublicRepair) {
		return this.publicRepairMapper.savePublicRepair(PublicRepair);
	}
	
	public int updatePublicRepair(PublicRepair PublicRepair) {
		return this.publicRepairMapper.updatePublicRepair(PublicRepair);
	}
}
