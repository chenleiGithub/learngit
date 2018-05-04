package com.keyan.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.keyan.entity.LivingCost;
import com.keyan.entity.LivingCostView;
import com.keyan.entity.UserInfoEntity;
import com.keyan.services.LivingCostService;
import com.keyan.utils.DateUtils;

@Controller
public class LivingCostController {
	@Resource
	private LivingCostService livingCostService;

	// 查看项目信息
	/**
	 * 
	 * @param request
	 * @param draw
	 * @param start
	 * @param length
	 * @param keyValue
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/queryLivingCostMessage")
	@ResponseBody
	public Map<Object, Object> queryLivingCostMessage(HttpServletRequest request,
			@RequestParam(value = "draw", required = false) Integer draw,
			@RequestParam(value = "start", required = false) Integer start,
			@RequestParam(value = "type", required = false) Integer type,
			@RequestParam(value = "length", required = false) Integer length,
			@RequestParam(value = "search[value]", required = false) String keyValue) throws Exception {
		HttpSession session = request.getSession();
		// 获取Session里面的用户信息
		UserInfoEntity userInfo = (UserInfoEntity) session.getAttribute("userInfoEntity");
		// 开始条数
		int startNumber = start;
		// 声明对象
		LivingCostView livingCostView = new LivingCostView();
		// 开始数
		livingCostView.setStartNumber(startNumber);
		// 结束条数
		livingCostView.setPageSize(length);
		livingCostView.setKeyValue(keyValue);
		if(userInfo.getUserType()!=0){
			livingCostView.setUserId(userInfo.getUserId());
		}
		livingCostView.setType(type);

		// 查询数据
		List<LivingCostView> listData = livingCostService.queryLivingCostMessage(livingCostView);
		for(LivingCostView list:listData){
			list.setStrRegisterTime(DateUtils.getDate(list.getRegisterTime()));
		}
		// 返回对象
		Map<Object, Object> info = new HashMap<Object, Object>();
		// 总数目
		int countNumber = livingCostService.queryLivingCostMessageCount(livingCostView);
		// 数据列表
		info.put("data", listData);
		// 总条数
		info.put("recordsTotal", countNumber);
		// 过滤条数
		info.put("recordsFiltered", countNumber);
		// 当前页数
		info.put("draw", draw);

		return info;
	}

	// 删除项目（批量删除）
	@RequestMapping(value = "/deletLivingCostList")
	@ResponseBody
	public int deletLivingCostList(@RequestParam(value = "livingCostIds", required = false) String livingCostIds) {
		String[] array = livingCostIds.split(",");
		List<String> list = new ArrayList<String>();
		Map<String, Object> map = new HashMap<String, Object>();
		for (int i = 0; i < array.length; i++) {
			list.add(array[i]);
		}
		map.put("livingList", list);
		// 删除项目
		int count = livingCostService.deleteList(map);
		return count;
	}

	// 新添项目
	@RequestMapping(value = "/saveLivingCost")
	@ResponseBody
	public int saveLivingCost(HttpServletRequest request,
			@RequestParam(value = "allCost", required = false) BigDecimal allCost,
			@RequestParam(value = "gasCost", required = false) BigDecimal gasCost,
			@RequestParam(value = "payStatus", required = false) Integer payStatus,
			@RequestParam(value = "powerCost", required = false) BigDecimal powerCost,
			@RequestParam(value = "userId", required = false) Integer userId,
			@RequestParam(value = "type", required = false) Integer type,
			@RequestParam(value = "waterCost", required = false) BigDecimal waterCost) {
		// 声明对象
		LivingCost livingCost = new LivingCost();
		livingCost.setAllCost(allCost);
		livingCost.setGasCost(gasCost);
		livingCost.setPayStatus(payStatus);
		livingCost.setPowerCost(powerCost);
		livingCost.setUserId(userId);
		livingCost.setWaterCost(waterCost);
		livingCost.setType(type);
		livingCost.setRegisterTime(new Date());

		return livingCostService.saveLivingCost(livingCost);
	}
	
	
	@RequestMapping(value = "/updateLivingCostList")
	@ResponseBody
	public int updateLivingCostList(@RequestParam(value = "livingCostIds", required = false) String livingCostIds) {
		String[] array = livingCostIds.split(",");
		List<String> list = new ArrayList<String>();
		Map<String, Object> map = new HashMap<String, Object>();
		for (int i = 0; i < array.length; i++) {
			list.add(array[i]);
		}
		map.put("livingList", list);
		// 删除项目
		int count = livingCostService.updateList(map);
		return count;
	}

}
