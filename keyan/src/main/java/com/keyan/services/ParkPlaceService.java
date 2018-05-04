package com.keyan.services;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.keyan.dao.ParkPlaceMapper;
import com.keyan.entity.ParkPlace;
import com.keyan.entity.ParkPlaceView;

@Service
public class ParkPlaceService {

	@Resource
	private ParkPlaceMapper parkPlaceMapper;

	// 查看相关项目信息
	public List<ParkPlaceView> queryParkPlaceMessage(ParkPlaceView parkPlaceView) {
		return parkPlaceMapper.queryParkPlaceMessage(parkPlaceView);
	}

	// 查看相关项目信息总数
	public Integer queryParkPlaceMessageCount(ParkPlaceView parkPlaceView) {
		return parkPlaceMapper.queryParkPlaceMessageCount(parkPlaceView);
	}

	// 项目删除
	public int deleteList(Map<String, Object> map) {
		return this.parkPlaceMapper.deleteList(map);
	}

	// 新添项目
	public int saveParkPlace(ParkPlace parkPlace) {
		return this.parkPlaceMapper.saveParkPlace(parkPlace);
	}
}
