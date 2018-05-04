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

import com.keyan.entity.PublicRepair;
import com.keyan.entity.PublicRepairView;
import com.keyan.entity.UserInfoEntity;
import com.keyan.services.PublicRepairService;
import com.keyan.utils.DateUtils;

@Controller
public class PublicRepairController {
	@Resource
	private PublicRepairService publicRepairService;

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
	@RequestMapping("/queryPublicRepairMessage")
	@ResponseBody
	public Map<Object, Object> queryPublicRepairMessage(HttpServletRequest request,
			@RequestParam(value = "draw", required = false) Integer draw,
			@RequestParam(value = "start", required = false) Integer start,
			@RequestParam(value = "length", required = false) Integer length,
			@RequestParam(value = "search[value]", required = false) String keyValue) throws Exception {
		// 开始条数
		int startNumber = start;
		// 声明对象
		PublicRepairView PublicRepairView = new PublicRepairView();
		// 开始数
		PublicRepairView.setStartNumber(startNumber);
		// 结束条数
		PublicRepairView.setPageSize(length);
		PublicRepairView.setKeyValue(keyValue);
		HttpSession session = request.getSession();
		// 获取Session里面的用户信息
		UserInfoEntity userInfo = (UserInfoEntity) session.getAttribute("userInfoEntity");
		if(userInfo.getUserType()!=0){
			PublicRepairView.setUserId(userInfo.getUserId());
		}

		// 查询数据
		List<PublicRepairView> listData = publicRepairService.queryPublicRepairMessage(PublicRepairView);
		for (int i = 0; i < listData.size(); i++) {
			listData.get(i).setStrRepairDate(DateUtils.getDate(listData.get(i).getRepairDate()));
		}
		// 返回对象
		Map<Object, Object> info = new HashMap<Object, Object>();
		// 总数目
		int countNumber = publicRepairService.queryPublicRepairMessageCount(PublicRepairView);
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
	@RequestMapping(value = "/deletPublicRepairDeList")
	@ResponseBody
	public int deletPublicRepairDeList(
			@RequestParam(value = "PublicRepairIds", required = false) String PublicRepairIds) {
		String[] array = PublicRepairIds.split(",");
		List<String> list = new ArrayList<String>();
		Map<String, Object> map = new HashMap<String, Object>();
		for (int i = 0; i < array.length; i++) {
			list.add(array[i]);
		}
		map.put("PublicRepairList", list);
		// 删除项目
		int count = publicRepairService.deleteList(map);
		return count;
	}

	// 新添项目
	@RequestMapping(value = "/savePublicRepair")
	@ResponseBody
	public int saveAsset(HttpServletRequest request,
			@RequestParam(value = "goodsName", required = false) String goodsName,
			@RequestParam(value = "position", required = false) String position,
			@RequestParam(value = "reason", required = false) String reason) {
		HttpSession session = request.getSession();
		// 获取Session里面的用户信息
		UserInfoEntity userInfo = (UserInfoEntity) session.getAttribute("userInfoEntity");
		// 获取用户id
		Integer userId = userInfo.getUserId();
		// 声明对象
		PublicRepair publicRepair = new PublicRepair();
		publicRepair.setPosition(position);
		publicRepair.setGoodsName(goodsName);
		publicRepair.setReason(reason);
		publicRepair.setRepairDate(new Date());
		publicRepair.setUserId(userId);
		publicRepair.setRepairResult("0");

		return publicRepairService.savePublicRepair(publicRepair);
	}

	@RequestMapping(value = "/updatePublicRepair")
	@ResponseBody
	public int updatePublicRepair(HttpServletRequest request,
			@RequestParam(value = "repairUser", required = false) String repairUser,
			@RequestParam(value = "repairMoney", required = false) BigDecimal repairMoney,
			@RequestParam(value = "repairResult", required = false) String repairResult,
			@RequestParam(value = "id", required = false) Integer id) {
		// 声明对象
		PublicRepair publicRepair = new PublicRepair();
		publicRepair.setRepairMoney(repairMoney);
		publicRepair.setRepairResult(repairResult);
		publicRepair.setRepairUser(repairUser);
		publicRepair.setRepairResult(repairResult);
		publicRepair.setId(id);

		return publicRepairService.updatePublicRepair(publicRepair);
	}

}
