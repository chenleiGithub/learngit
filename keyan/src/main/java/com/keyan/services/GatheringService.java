package com.keyan.services;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.keyan.dao.GatheringMapper;
import com.keyan.entity.Gathering;
import com.keyan.entity.GatheringView;

@Service
public class GatheringService {

	@Resource
	private GatheringMapper gatheringMapper;

	// 查看相关项目信息
	public List<GatheringView> queryGatheringMessage(GatheringView gatheringView) {
		return gatheringMapper.queryGatheringMessage(gatheringView);
	}

	// 查看相关项目信息总数
	public Integer queryGatheringMessageCount(GatheringView gatheringView) {
		return gatheringMapper.queryGatheringMessageCount(gatheringView);
	}

	// 项目删除
	public int deleteList(Map<String, Object> map) {
		return this.gatheringMapper.deleteList(map);
	}

	// 新添项目
	public int saveGathering(Gathering gathering) {
		return this.gatheringMapper.saveGathering(gathering);
	}
}
