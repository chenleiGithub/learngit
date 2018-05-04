package com.keyan.controller;

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

import com.keyan.entity.ServiceComplain;
import com.keyan.entity.ServiceComplainView;
import com.keyan.entity.UserInfoEntity;
import com.keyan.services.ServiceComplainService;
import com.keyan.utils.DateUtils;

@Controller
public class ServiceComplainController {
	@Resource
	private ServiceComplainService serviceComplainService;

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
	@RequestMapping("/queryServiceComplainMessage")
	@ResponseBody
	public Map<Object, Object> queryServiceComplainMessage(HttpServletRequest request,
			@RequestParam(value = "draw", required = false) Integer draw,
			@RequestParam(value = "start", required = false) Integer start,
			@RequestParam(value = "length", required = false) Integer length,
			@RequestParam(value = "search[value]", required = false) String keyValue) throws Exception {
		HttpSession session = request.getSession();
		// 获取Session里面的用户信息
		UserInfoEntity userInfo = (UserInfoEntity) session.getAttribute("userInfoEntity");
		// 开始条数
		int startNumber = start;
		// 声明对象
		ServiceComplainView serviceComplainView = new ServiceComplainView();
		// 开始数
		serviceComplainView.setStartNumber(startNumber);
		// 结束条数
		serviceComplainView.setPageSize(length);
		serviceComplainView.setKeyValue(keyValue);
		if(userInfo.getUserType()!=0){
			serviceComplainView.setComplainUserid(userInfo.getUserId());
		}

		// 查询数据
		List<ServiceComplainView> listData = serviceComplainService.queryServiceComplainMessage(serviceComplainView);
		for (int i = 0; i < listData.size(); i++) {
			listData.get(i).setStrComplainDate(DateUtils.getDate(listData.get(i).getComplainDate()));
			listData.get(i).setStrHandleDate(DateUtils.getDate(listData.get(i).getHandleDate()));
		}
		// 返回对象
		Map<Object, Object> info = new HashMap<Object, Object>();
		// 总数目
		int countNumber = serviceComplainService.queryServiceComplainCount(serviceComplainView);
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
	@RequestMapping(value = "/deletServiceComplainDeList")
	@ResponseBody
	public int deletServiceComplainDeList(@RequestParam(value = "assetIds", required = false) String assetIds) {
		String[] array = assetIds.split(",");
		List<String> list = new ArrayList<String>();
		Map<String, Object> map = new HashMap<String, Object>();
		for (int i = 0; i < array.length; i++) {
			list.add(array[i]);
		}
		map.put("servicecomplainList", list);
		// 删除项目
		int count = serviceComplainService.deleteList(map);
		return count;
	}

	// 新添项目
	@RequestMapping(value = "/saveServiceComplain")
	@ResponseBody
	public int saveServiceComplain(HttpServletRequest request,
			@RequestParam(value = "complainContent", required = false) String complainContent,
			@RequestParam(value = "complainTitle", required = false) String complainTitle) {
		HttpSession session = request.getSession();
		// 获取Session里面的用户信息
		UserInfoEntity userInfo = (UserInfoEntity) session.getAttribute("userInfoEntity");
		// 获取用户id
		Integer userId = userInfo.getUserId();
		// 声明对象
		ServiceComplain serviceComplain = new ServiceComplain();
		serviceComplain.setComplainContent(complainContent);
		serviceComplain.setComplainDate(new Date());
		serviceComplain.setComplainUserid(userId);
		serviceComplain.setComplainTitle(complainTitle);
		serviceComplain.setResult(0);

		return serviceComplainService.saveServiceComplain(serviceComplain);
	}
	
	
	@RequestMapping(value = "/updateServiceComplain")
	@ResponseBody
	public int updateServiceComplain(HttpServletRequest request,
			@RequestParam(value = "handleUserName", required = false) String handleUserName,
			@RequestParam(value = "handleAdvice", required = false) String handleAdvice,
			@RequestParam(value = "result", required = false) Integer result,
			@RequestParam(value = "id", required = false) Integer id) {
		// 声明对象
		ServiceComplain serviceComplain = new ServiceComplain();
		serviceComplain.setHandleAdvice(handleAdvice);
		serviceComplain.setHandleDate(new Date());
		serviceComplain.setHandleUserName(handleUserName);
		serviceComplain.setResult(result);
		serviceComplain.setId(id);

		return serviceComplainService.updateServiceComplain(serviceComplain);
	}

}
