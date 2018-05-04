package com.keyan.dao;

import java.util.List;
import java.util.Map;

import com.keyan.entity.Gathering;
import com.keyan.entity.GatheringView;

public interface GatheringMapper {
	// 查看相关项目总数
	Integer queryGatheringMessageCount(GatheringView gatheringView);

	// 查看相关项目
	List<GatheringView> queryGatheringMessage(GatheringView gatheringView);

	// 项目删除（批量删除）
	int deleteList(Map<String, Object> map);

	// 新添项目
	int saveGathering(Gathering gathering);
}
