package com.keyan.dao;

import java.util.List;
import java.util.Map;

import com.keyan.entity.LivingCost;
import com.keyan.entity.LivingCostView;

public interface LivingCostMapper {
	// 查看相关项目总数
	Integer queryLivingCostMessageCount(LivingCostView livingCostView);

	// 查看相关项目
	List<LivingCostView> queryLivingCostMessage(LivingCostView livingCostView);

	// 项目删除（批量删除）
	int deleteList(Map<String, Object> map);

	// 新添项目
	int saveLivingCost(LivingCost livingCost);
	
	int updateList(Map<String, Object> map);
}
