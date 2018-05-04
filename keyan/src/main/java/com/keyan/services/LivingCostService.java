package com.keyan.services;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.keyan.dao.LivingCostMapper;
import com.keyan.entity.LivingCost;
import com.keyan.entity.LivingCostView;

@Service
public class LivingCostService {

	@Resource
	private LivingCostMapper livingCostMapper;

	// 查看相关项目信息
	public List<LivingCostView> queryLivingCostMessage(LivingCostView livingCostView) {
		return livingCostMapper.queryLivingCostMessage(livingCostView);
	}

	// 查看相关项目信息总数
	public Integer queryLivingCostMessageCount(LivingCostView livingCostView) {
		return livingCostMapper.queryLivingCostMessageCount(livingCostView);
	}

	// 项目删除
	public int deleteList(Map<String, Object> map) {
		return this.livingCostMapper.deleteList(map);
	}

	// 新添项目
	public int saveLivingCost(LivingCost livingCost) {
		return this.livingCostMapper.saveLivingCost(livingCost);
	}
	
	public int updateList(Map<String, Object> map) {
		return this.livingCostMapper.updateList(map);
	}
}
