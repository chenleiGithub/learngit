package com.keyan.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.keyan.entity.Emergency;
import com.keyan.entity.EmergencyView;
import com.keyan.services.EmergencyService;

@Controller
public class EmergencyController {
	@Resource
	private EmergencyService emergencyService;

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
	@RequestMapping("/queryEmergencyMessage")
	@ResponseBody
	public Map<Object, Object> queryEmergencyMessage(HttpServletRequest request,
			@RequestParam(value = "draw", required = false) Integer draw,
			@RequestParam(value = "start", required = false) Integer start,
			@RequestParam(value = "length", required = false) Integer length,
			@RequestParam(value = "search[value]", required = false) String keyValue) throws Exception {
		// 开始条数
		int startNumber = start;
		// 声明对象
		EmergencyView emergencyView = new EmergencyView();
		// 开始数
		emergencyView.setStartNumber(startNumber);
		// 结束条数
		emergencyView.setPageSize(length);
		emergencyView.setKeyValue(keyValue);

		// 查询数据
		List<EmergencyView> listData = emergencyService.queryEmergencyMessage(emergencyView);

		// 返回对象
		Map<Object, Object> info = new HashMap<Object, Object>();
		// 总数目
		int countNumber = emergencyService.queryEmergencyMessageCount(emergencyView);
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
	@RequestMapping(value = "/deletEmergencyList")
	@ResponseBody
	public int deletAssetDeList(@RequestParam(value = "emergencyIds", required = false) String emergencyIds) {
		String[] array = emergencyIds.split(",");
		List<String> list = new ArrayList<String>();
		Map<String, Object> map = new HashMap<String, Object>();
		for (int i = 0; i < array.length; i++) {
			list.add(array[i]);
		}
		map.put("emergencyList", list);
		// 删除项目
		int count = emergencyService.deleteList(map);
		return count;
	}

	// 新添项目
	@RequestMapping(value = "/saveEmergency")
	@ResponseBody
	public int saveEmergency(HttpServletRequest request,
			@RequestParam(value = "eventCode", required = false) String eventCode,
			@RequestParam(value = "eventTheme", required = false) String eventTheme,
			@RequestParam(value = "handUser", required = false) String handUser,
			@RequestParam(value = "eventContent", required = false) String eventContent,
			@RequestParam(value = "result", required = false) String result) {
		// 声明对象
		Emergency emergency = new Emergency();
		emergency.setEventCode(eventCode);
		emergency.setEventTheme(eventTheme);
		emergency.setHandUser(handUser);
		emergency.setResult(result);
		emergency.setEventContent(eventContent);

		return emergencyService.saveEmergency(emergency);
	}

}
