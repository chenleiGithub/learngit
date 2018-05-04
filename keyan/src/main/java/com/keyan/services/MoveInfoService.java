package com.keyan.services;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.keyan.dao.MoveInfoMapper;
import com.keyan.entity.MoveInfo;
import com.keyan.entity.MoveInfoView;

@Service
public class MoveInfoService {

	@Resource
	private MoveInfoMapper moveInfoMapper;

	// 查看相关项目信息
	public List<MoveInfoView> queryMoveInfo(MoveInfoView moveInfoView) {
		return moveInfoMapper.queryMoveInfo(moveInfoView);
	}

	// 查看相关项目信息总数
	public Integer queryMoveInfoCount(MoveInfoView moveInfoView) {
		return moveInfoMapper.queryMoveInfoCount(moveInfoView);
	}

	// 项目删除
	public int deleteList(Map<String, Object> map) {
		return this.moveInfoMapper.deleteList(map);
	}

	// 新添项目
	public int saveMoveInfo(MoveInfo moveInfo) {
		return this.moveInfoMapper.saveMoveInfo(moveInfo);
	}
}
