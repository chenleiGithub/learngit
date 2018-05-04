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

import com.keyan.entity.PrivateRepair;
import com.keyan.entity.PrivateRepairView;
import com.keyan.entity.UserInfoEntity;
import com.keyan.services.PrivateRepairService;
import com.keyan.utils.DateUtils;

@Controller
public class PrivateRepairController {
	@Resource
	private PrivateRepairService privateRepairService;

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
	@RequestMapping("/queryPrivateRepairMessage")
	@ResponseBody
	public Map<Object, Object> queryPrivateRepairMessage(HttpServletRequest request,
			@RequestParam(value = "draw", required = false) Integer draw,
			@RequestParam(value = "start", required = false) Integer start,
			@RequestParam(value = "length", required = false) Integer length,
			@RequestParam(value = "search[value]", required = false) String keyValue) throws Exception {
		// 开始条数
		int startNumber = start;
		// 声明对象
		PrivateRepairView privateRepairView = new PrivateRepairView();
		// 开始数
		privateRepairView.setStartNumber(startNumber);
		// 结束条数
		privateRepairView.setPageSize(length);
		privateRepairView.setKeyValue(keyValue);
		
		HttpSession session = request.getSession();
		// 获取Session里面的用户信息
		UserInfoEntity userInfo = (UserInfoEntity) session.getAttribute("userInfoEntity");
		if(userInfo.getUserType()!=0){
			privateRepairView.setUserId(userInfo.getUserId());
		}

		// 查询数据
		List<PrivateRepairView> listData = privateRepairService.queryPrivateRepairMessage(privateRepairView);
		for (int i = 0; i < listData.size(); i++) {
			listData.get(i).setStrRepairDate(DateUtils.getDate(listData.get(i).getRepairDate()));
		}
		// 返回对象
		Map<Object, Object> info = new HashMap<Object, Object>();
		// 总数目
		int countNumber = privateRepairService.queryPrivateRepairMessageCount(privateRepairView);
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
	@RequestMapping(value = "/deletPrivateRepairDeList")
	@ResponseBody
	public int deletPrivateRepairDeList(
			@RequestParam(value = "PrivateRepairIds", required = false) String PrivateRepairIds) {
		String[] array = PrivateRepairIds.split(",");
		List<String> list = new ArrayList<String>();
		Map<String, Object> map = new HashMap<String, Object>();
		for (int i = 0; i < array.length; i++) {
			list.add(array[i]);
		}
		map.put("PrivateRepairList", list);
		// 删除项目
		int count = privateRepairService.deleteList(map);
		return count;
	}

	// 新添项目
	@RequestMapping(value = "/savePrivateRepair")
	@ResponseBody
	public int saveAsset(HttpServletRequest request,
			@RequestParam(value = "reason", required = false) String reason) {
		HttpSession session = request.getSession();
		// 获取Session里面的用户信息
		UserInfoEntity userInfo = (UserInfoEntity) session.getAttribute("userInfoEntity");
		// 获取用户id
		Integer userId = userInfo.getUserId();
		// 声明对象
		PrivateRepair privateRepair = new PrivateRepair();
		privateRepair.setReason(reason);
		privateRepair.setRepairDate(new Date());
		privateRepair.setUserId(userId);
		privateRepair.setRepairResult("0");

		return privateRepairService.savePrivateRepair(privateRepair);
	}

	@RequestMapping(value = "/updatePrivateRepair")
	@ResponseBody
	public int updatePrivateRepair(HttpServletRequest request,
			@RequestParam(value = "repairUser", required = false) String repairUser,
			@RequestParam(value = "repairMoney", required = false) BigDecimal repairMoney,
			@RequestParam(value = "repairResult", required = false) String repairResult,
			@RequestParam(value = "id", required = false) Integer id) {
		// 声明对象
		PrivateRepair privateRepair = new PrivateRepair();
		privateRepair.setRepairMoney(repairMoney);
		privateRepair.setRepairResult(repairResult);
		privateRepair.setRepairUser(repairUser);
		privateRepair.setId(id);

		return privateRepairService.updatePrivateRepair(privateRepair);
	}

}
