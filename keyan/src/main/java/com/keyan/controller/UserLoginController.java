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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.keyan.entity.UserInfo;
import com.keyan.entity.UserInfoEntity;
import com.keyan.entity.UserLoginEntity;
import com.keyan.services.UserLoginService;

@Controller
public class UserLoginController {

	@Resource
	private UserLoginService userLoginService;

	@RequestMapping("/login")
	public ModelAndView login() {

		return new ModelAndView("pages/login/login");
	}

	// 登录
	@RequestMapping("/process")
	@ResponseBody
	public UserInfoEntity loginServer(HttpServletRequest request, String userName, String password) {
		UserInfo userlogin = new UserInfo();
		userlogin.setUserName(userName.toLowerCase());
		userlogin.setPassword(password);
		UserInfoEntity userInfoEntity = userLoginService.login(userlogin);
		// seesion 保存用户信息
		HttpSession session = request.getSession();
		session.setAttribute("userInfoEntity", userInfoEntity);
		return userInfoEntity;
	}

	// 修改密码
	@RequestMapping(value = "/changepwd", method = RequestMethod.POST)
	@ResponseBody
	public int changepwd(@RequestParam(value = "newpwd", required = false) String newpwd, HttpServletRequest request,
			@RequestParam(value = "oldpwd", required = false) String oldpwd) {
		int status = 0;
		HttpSession session = request.getSession();
		// 获取Session里面的用户信息
		UserInfoEntity userInfo = (UserInfoEntity) session.getAttribute("userInfoEntity");
		// 获取用户id
		Integer userId = userInfo.getUserId();
		// 获取旧密码
		String password = userLoginService.queryPwd(userId);
		if (oldpwd.equals(password)) {
			// 声明对象
			UserLoginEntity userLoginEntity = new UserLoginEntity();
			// 用户id
			userLoginEntity.setUserId(userId);
			// 新密码
			userLoginEntity.setPassword(newpwd);
			status = userLoginService.updatePwd(userLoginEntity);
			return status;
		} else {
			return 0;
		}
	}

	// 查看非超级管理员的信息
	@RequestMapping("/queryUserInfo")
	@ResponseBody
	public Map<Object, Object> queryUserInfo(@RequestParam(value = "draw", required = false) Integer draw,
			@RequestParam(value = "start", required = false) Integer start,
			@RequestParam(value = "length", required = false) Integer length,
			@RequestParam(value = "search[value]", required = false) String keyValue) throws Exception {
		// 开始条数
		int startNumber = start;

		UserInfoEntity userInfoEntity = new UserInfoEntity();
		userInfoEntity.setStartNumber(startNumber);
		userInfoEntity.setPageSize(length);
		userInfoEntity.setKeyValue(keyValue);
		// 查询数据
		List<UserInfoEntity> listData = userLoginService.queryUserInfo(userInfoEntity);
		// 返回对象
		Map<Object, Object> info = new HashMap<Object, Object>();
		// 总数目
		int countNumber = userLoginService.queryUserInfoCount();
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

	// 修改用户权限
	@RequestMapping(value = "/updateByUserId")
	@ResponseBody
	public int updateByUserId(@RequestParam(value = "userIds", required = false) String userIds,
			@RequestParam(value = "isAuthentication", required = false) Integer isAuthentication) {
		String[] array = userIds.split(",");
		List<String> list = new ArrayList<String>();
		Map<String, Object> map = new HashMap<String, Object>();
		for (int i = 0; i < array.length; i++) {
			list.add(array[i]);
		}
		map.put("userIdList", list);
		map.put("isAuthentication", isAuthentication);
		// 将项目的回收站状态改为1
		return userLoginService.updateByUserId(map);
	}

	// 通过userId查询用户详情
	@RequestMapping("/queryByUserId")
	@ResponseBody
	public UserInfoEntity queryByUserId(@RequestParam(value = "userId", required = false) Integer userId)
			throws Exception {
		UserInfoEntity userInfoEntity = userLoginService.queryByUserId(userId);
		return userInfoEntity;
	}

	// 添加新用户
	@RequestMapping(value = "/saveUserInfo")
	@ResponseBody
	public int saveUserInfo(@RequestParam(value = "userName", required = false) String userName,
			@RequestParam(value = "name", required = false) String name,
			@RequestParam(value = "password", required = false) String password,
			@RequestParam(value = "sex", required = false) Integer sex,
			@RequestParam(value = "phone", required = false) String phone,
			@RequestParam(value = "houseNumber", required = false) String houseNumber,
			@RequestParam(value = "cardId", required = false) String cardId,
			@RequestParam(value = "buildIngId", required = false) Integer buildIngId) {
		Integer result = 0;
		// 查看用户名是否重复
		Integer count = userLoginService.queryByUserName(userName);
		if (count > 0) {
			result = 1;
		} else {
			// 声明对象
			UserInfo userInfo = new UserInfo();
			// 用户名
			userInfo.setUserName(userName);
			// 密码
			userInfo.setPassword(password);
			// 性别
			userInfo.setSex(sex);
			// 手机号码
			userInfo.setPhone(phone);
			// 真实姓名
			userInfo.setName(name);
			// 门牌号
			userInfo.setHouseNumber(houseNumber);
			// 用户类型
			userInfo.setUserType(2);
			// 居住状态
			userInfo.setLiveType(0);
			// 认证状态
			userInfo.setIsAuthentication(0);
			userInfo.setBuildIngId(buildIngId);
			userInfo.setCardId(cardId);

			userLoginService.saveUserInfo(userInfo);
		}

		return result;
	}

	/**
	 * 查询所有用户信息
	 * 
	 * @param draw
	 * @param start
	 * @param length
	 * @param keyValue
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/queryAllUserInfo")
	@ResponseBody
	public List<UserInfoEntity> queryAllUserInfo(
			@RequestParam(value = "value", required = false) String value) throws Exception {
		UserInfoEntity userInfoEntity = new UserInfoEntity();
		userInfoEntity.setKeyValue(value);

		return userLoginService.queryUserInfo(userInfoEntity);
	}
	
	
	@RequestMapping(value = "/deleteUserInfoList")
	@ResponseBody
	public int deleteUserInfoList(@RequestParam(value = "userIds", required = false) String userIds) {
		String[] array = userIds.split(",");
		List<String> list = new ArrayList<String>();
		Map<String, Object> map = new HashMap<String, Object>();
		for (int i = 0; i < array.length; i++) {
			list.add(array[i]);
		}
		map.put("userList", list);
		// 删除项目
		int count = userLoginService.deleteUserInfoList(map);
		return count;
	}

}
