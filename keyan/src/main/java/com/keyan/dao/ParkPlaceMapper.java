package com.keyan.dao;

import java.util.List;
import java.util.Map;

import com.keyan.entity.ParkPlace;
import com.keyan.entity.ParkPlaceView;

public interface ParkPlaceMapper {
	// 查看相关项目总数
	Integer queryParkPlaceMessageCount(ParkPlaceView parkPlaceView);

	// 查看相关项目
	List<ParkPlaceView> queryParkPlaceMessage(ParkPlaceView parkPlaceView);

	// 项目删除（批量删除）
	int deleteList(Map<String, Object> map);

	// 新添项目
	int saveParkPlace(ParkPlace parkPlace);
}
