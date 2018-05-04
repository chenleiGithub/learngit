package com.keyan.controller;

import java.util.ArrayList;
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

import com.keyan.entity.ParkPlace;
import com.keyan.entity.ParkPlaceView;
import com.keyan.entity.UserInfoEntity;
import com.keyan.services.ParkPlaceService;

@Controller
public class ParkPlaceController {
	@Resource
	private ParkPlaceService parkPlaceService;

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
	@RequestMapping("/queryParkPlaceMessage")
	@ResponseBody
	public Map<Object, Object> queryParkPlaceMessage(HttpServletRequest request,
			@RequestParam(value = "draw", required = false) Integer draw,
			@RequestParam(value = "start", required = false) Integer start,
			@RequestParam(value = "length", required = false) Integer length,
			@RequestParam(value = "search[value]", required = false) String keyValue) throws Exception {
		// 开始条数
		int startNumber = start;
		// 声明对象
		ParkPlaceView parkPlaceView = new ParkPlaceView();
		// 开始数
		parkPlaceView.setStartNumber(startNumber);
		// 结束条数
		parkPlaceView.setPageSize(length);
		parkPlaceView.setKeyValue(keyValue);
		
		HttpSession session = request.getSession();
		// 获取Session里面的用户信息
		UserInfoEntity userInfo = (UserInfoEntity) session.getAttribute("userInfoEntity");
		if(userInfo.getUserType()!=0){
			parkPlaceView.setUserId(userInfo.getUserId());
		}
		
		// 查询数据
		List<ParkPlaceView> listData = parkPlaceService.queryParkPlaceMessage(parkPlaceView);
		// 返回对象
		Map<Object, Object> info = new HashMap<Object, Object>();
		// 总数目
		int countNumber = parkPlaceService.queryParkPlaceMessageCount(parkPlaceView);
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
	@RequestMapping(value = "/deletParkPlaceList")
	@ResponseBody
	public int deletParkPlaceList(
			@RequestParam(value = "parkPlaceIds", required = false) String parkPlaceIds) {
		String[] array = parkPlaceIds.split(",");
		List<String> list = new ArrayList<String>();
		Map<String, Object> map = new HashMap<String, Object>();
		for (int i = 0; i < array.length; i++) {
			list.add(array[i]);
		}
		map.put("parkPlaceList", list);
		// 删除项目
		int count = parkPlaceService.deleteList(map);
		return count;
	}

	// 新添项目
	@RequestMapping(value = "/saveParkPlace")
	@ResponseBody
	public int saveParkPlace(HttpServletRequest request,
			@RequestParam(value = "plateNumber", required = false) String plateNumber,
			@RequestParam(value = "parkPlaceCode", required = false) String parkPlaceCode,
			@RequestParam(value = "parkPlaceArea", required = false) String parkPlaceArea,
			@RequestParam(value = "userId", required = false) Integer userId) {
		// 声明对象
		ParkPlace parkPlace = new ParkPlace();
		parkPlace.setUserId(userId);
		parkPlace.setParkPlaceArea(parkPlaceArea);
		parkPlace.setParkPlaceCode(parkPlaceCode);
		parkPlace.setPlateNumber(plateNumber);

		return parkPlaceService.saveParkPlace(parkPlace);
	}

}
