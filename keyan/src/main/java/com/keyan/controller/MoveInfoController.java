package com.keyan.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.keyan.entity.MoveInfo;
import com.keyan.entity.MoveInfoView;
import com.keyan.services.MoveInfoService;
import com.keyan.utils.DateUtils;

@Controller
public class MoveInfoController {
	@Resource
	private MoveInfoService moveInfoService;

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
	@RequestMapping("/queryMoveInfo")
	@ResponseBody
	public Map<Object, Object> queryMoveInfo(HttpServletRequest request,
			@RequestParam(value = "draw", required = false) Integer draw,
			@RequestParam(value = "start", required = false) Integer start,
			@RequestParam(value = "length", required = false) Integer length,
			@RequestParam(value = "search[value]", required = false) String keyValue) throws Exception {
		// 开始条数
		int startNumber = start;
		// 声明对象
		MoveInfoView moveInfoView = new MoveInfoView();
		// 开始数
		moveInfoView.setStartNumber(startNumber);
		// 结束条数
		moveInfoView.setPageSize(length);
		moveInfoView.setKeyValue(keyValue);

		// 查询数据
		List<MoveInfoView> listData = moveInfoService.queryMoveInfo(moveInfoView);
		for(int i=0;i<listData.size();i++){
			listData.get(i).setStrMoveDate(DateUtils.getDate(listData.get(i).getMoveDate()));
		}
		// 返回对象
		Map<Object, Object> info = new HashMap<Object, Object>();
		// 总数目
		int countNumber = moveInfoService.queryMoveInfoCount(moveInfoView);
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
	@RequestMapping(value = "/deletMoveInfo")
	@ResponseBody
	public int deletMoveInfo(@RequestParam(value = "moveIds", required = false) String moveIds) {
		String[] array = moveIds.split(",");
		List<String> list = new ArrayList<String>();
		Map<String, Object> map = new HashMap<String, Object>();
		for (int i = 0; i < array.length; i++) {
			list.add(array[i]);
		}
		map.put("moveList", list);
		// 删除项目
		int count = moveInfoService.deleteList(map);
		return count;
	}

	// 新添项目
	@RequestMapping(value = "/saveMoveInfo")
	@ResponseBody
	public int saveMoveInfo(HttpServletRequest request, @RequestParam(value = "userId", required = false) Integer userId,
			@RequestParam(value = "manager", required = false) String manager,
			@RequestParam(value = "moveReason", required = false) String moveReason,
			@RequestParam(value = "phone", required = false) String phone,
			@RequestParam(value = "note", required = false) String note) {
		// 声明对象
		MoveInfo moveInfo = new MoveInfo();
		moveInfo.setManager(manager);
		moveInfo.setNote(note);
		moveInfo.setPhone(phone);
		moveInfo.setMoveDate(new Date());
		moveInfo.setUserId(userId);
		moveInfo.setMoveReason(moveReason);

		return moveInfoService.saveMoveInfo(moveInfo);
	}

}
