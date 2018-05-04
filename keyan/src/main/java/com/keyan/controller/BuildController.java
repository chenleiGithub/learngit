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

import com.keyan.entity.BuildingInfo;
import com.keyan.entity.BuildingInfoView;
import com.keyan.services.BuildService;

@Controller
public class BuildController {
	@Resource
	private BuildService buildService;

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
	@RequestMapping("/queryBuildMessage")
	@ResponseBody
	public Map<Object, Object> queryBuildMessage(HttpServletRequest request,
			@RequestParam(value = "draw", required = false) Integer draw,
			@RequestParam(value = "start", required = false) Integer start,
			@RequestParam(value = "length", required = false) Integer length,
			@RequestParam(value = "search[value]", required = false) String keyValue) throws Exception {
		// 开始条数
		int startNumber = start;
		// 声明对象
		BuildingInfoView buildingInfoView = new BuildingInfoView();
		// 开始数
		buildingInfoView.setStartNumber(startNumber);
		// 结束条数
		buildingInfoView.setPageSize(length);
		buildingInfoView.setKeyValue(keyValue);

		// 查询数据
		List<BuildingInfoView> listData = buildService.queryBuildMessage(buildingInfoView);
		// 返回对象
		Map<Object, Object> info = new HashMap<Object, Object>();
		// 总数目
		int countNumber = buildService.queryBuildMessageCount(buildingInfoView);
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
	@RequestMapping(value = "/deletBuildDeList")
	@ResponseBody
	public int deleteList1(@RequestParam(value = "buildIds", required = false) String buildIds) {
		String[] array = buildIds.split(",");
		List<String> list = new ArrayList<String>();
		Map<String, Object> map = new HashMap<String, Object>();
		for (int i = 0; i < array.length; i++) {
			list.add(array[i]);
		}
		map.put("buildList", list);
		// 删除项目
		int count = buildService.deleteList(map);
		return count;
	}

	// 新添项目
	@RequestMapping(value = "/saveBuild")
	@ResponseBody
	public int saveBuild(HttpServletRequest request,
			@RequestParam(value = "buildName", required = false) String buildName,
			@RequestParam(value = "total", required = false) Integer total,
			@RequestParam(value = "buCount", required = false) Integer buCount,
			@RequestParam(value = "manager", required = false) String manager,
			@RequestParam(value = "phone", required = false) String phone,
			@RequestParam(value = "note", required = false) String note) {
		// 声明对象
		BuildingInfo buildingInfo = new BuildingInfo();
		buildingInfo.setBuCount(buCount);
		buildingInfo.setBuildName(buildName);
		buildingInfo.setManager(manager);
		buildingInfo.setNote(note);
		buildingInfo.setPhone(phone);
		buildingInfo.setTotal(total);

		return buildService.saveBuild(buildingInfo);
	}
	
	
	@RequestMapping(value = "/queryAllBuild")
	@ResponseBody
	public List<BuildingInfoView> queryAllBuild() {
		return buildService.queryAllBuild();
	}

}
