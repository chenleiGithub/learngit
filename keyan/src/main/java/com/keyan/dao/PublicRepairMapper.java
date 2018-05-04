package com.keyan.dao;

import java.util.List;
import java.util.Map;

import com.keyan.entity.PublicRepair;
import com.keyan.entity.PublicRepairView;

public interface PublicRepairMapper {
	// 查看相关项目总数
	Integer queryPublicRepairMessageCount(PublicRepairView PublicRepairView);

	// 查看相关项目
	List<PublicRepairView> queryPublicRepairMessage(PublicRepairView PublicRepairView);

	// 项目删除（批量删除）
	int deleteList(Map<String, Object> map);

	// 新添项目
	int savePublicRepair(PublicRepair PublicRepair);

	int updatePublicRepair(PublicRepair PublicRepair);
}
