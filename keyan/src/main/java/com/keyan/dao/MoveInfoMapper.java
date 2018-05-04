package com.keyan.dao;

import java.util.List;
import java.util.Map;

import com.keyan.entity.MoveInfo;
import com.keyan.entity.MoveInfoView;

public interface MoveInfoMapper {
	// 查看相关项目总数
	Integer queryMoveInfoCount(MoveInfoView moveInfoView);

	// 查看相关项目
	List<MoveInfoView> queryMoveInfo(MoveInfoView moveInfoView);

	// 项目删除（批量删除）
	int deleteList(Map<String, Object> map);

	// 新添项目
	int saveMoveInfo(MoveInfo moveInfo);
}
