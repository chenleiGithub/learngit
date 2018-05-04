package com.keyan.dao;

import java.util.List;
import java.util.Map;

import com.keyan.entity.PrivateRepair;
import com.keyan.entity.PrivateRepairView;

public interface PrivateRepairMapper {
	// 查看相关项目总数
	Integer queryPrivateRepairMessageCount(PrivateRepairView privateRepairView);

	// 查看相关项目
	List<PrivateRepairView> queryPrivateRepairMessage(PrivateRepairView privateRepairView);

	// 项目删除（批量删除）
	int deleteList(Map<String, Object> map);

	// 新添项目
	int savePrivateRepair(PrivateRepair privateRepair);
	
	int updatePrivateRepair(PrivateRepair privateRepair);
}
