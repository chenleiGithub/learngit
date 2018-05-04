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

import com.keyan.entity.Gathering;
import com.keyan.entity.GatheringView;
import com.keyan.entity.UserInfoEntity;
import com.keyan.services.GatheringService;
import com.keyan.utils.DateUtils;

@Controller
public class GatheringController {
	@Resource
	private GatheringService gatheringService;

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
	@RequestMapping("/queryGatheringMessage")
	@ResponseBody
	public Map<Object, Object> queryGatheringMessage(HttpServletRequest request,
			@RequestParam(value = "draw", required = false) Integer draw,
			@RequestParam(value = "start", required = false) Integer start,
			@RequestParam(value = "length", required = false) Integer length,
			@RequestParam(value = "gatheringReason", required = false) Integer gatheringReason,
			@RequestParam(value = "search[value]", required = false) String keyValue) throws Exception {
		// 开始条数
		int startNumber = start;
		// 声明对象
		GatheringView gatheringView = new GatheringView();
		// 开始数
		gatheringView.setStartNumber(startNumber);
		// 结束条数
		gatheringView.setPageSize(length);
		gatheringView.setKeyValue(keyValue);
		gatheringView.setGatheringReason(gatheringReason);

		// 查询数据
		List<GatheringView> listData = gatheringService.queryGatheringMessage(gatheringView);
		for(int i=0;i<listData.size();i++){
			listData.get(i).setStrGatheringDate(DateUtils.getDate(listData.get(i).getGatheringDate()));
		}
		// 返回对象
		Map<Object, Object> info = new HashMap<Object, Object>();
		// 总数目
		int countNumber = gatheringService.queryGatheringMessageCount(gatheringView);
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
	@RequestMapping(value = "/deletGatheringList")
	@ResponseBody
	public int deletAssetDeList(@RequestParam(value = "gatheringList", required = false) String gatheringList) {
		String[] array = gatheringList.split(",");
		List<String> list = new ArrayList<String>();
		Map<String, Object> map = new HashMap<String, Object>();
		for (int i = 0; i < array.length; i++) {
			list.add(array[i]);
		}
		map.put("gatheringList", list);
		// 删除项目
		int count = gatheringService.deleteList(map);
		return count;
	}

	// 新添项目
	@RequestMapping(value = "/saveGathering")
	@ResponseBody
	public int saveGathering(HttpServletRequest request,
			@RequestParam(value = "paymentUserId", required = false) Integer paymentUserId,
			@RequestParam(value = "gatheringMoney", required = false) BigDecimal gatheringMoney,
			@RequestParam(value = "gatheringReason", required = false) Integer gatheringReason,
			@RequestParam(value = "gatheringStyle", required = false) Integer gatheringStyle,
			@RequestParam(value = "gatheringCode", required = false) String gatheringCode) {
		HttpSession session = request.getSession();
		// 获取Session里面的用户信息
		UserInfoEntity userInfo = (UserInfoEntity) session.getAttribute("userInfoEntity");
		// 获取用户id
		Integer userId = userInfo.getUserId();
		// 声明对象
		Gathering gathering = new Gathering();
		gathering.setGatheringCode(gatheringCode);
		gathering.setGatheringDate(new Date());
		gathering.setGatheringMoney(gatheringMoney);
		gathering.setGatheringReason(gatheringReason);
		gathering.setGatheringUserId(userId);
		gathering.setPaymentUserId(paymentUserId);
		gathering.setGatheringStyle(gatheringStyle);
		return gatheringService.saveGathering(gathering);
	}

}
