package com.keyan.services;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.keyan.dao.UserLoginMapper;
import com.keyan.entity.UserInfo;
import com.keyan.entity.UserInfoEntity;
import com.keyan.entity.UserLoginEntity;

@Service
public class UserLoginService {

	@Resource
	private UserLoginMapper userLoginMapper;

	// 用户登录
	public UserInfoEntity login(UserInfo userlogin) {
		return userLoginMapper.login(userlogin);
	}

	// 查看用户信息
	public List<UserInfoEntity> queryUserInfo(UserInfoEntity userInfoEntity) {
		return userLoginMapper.queryUserInfo(userInfoEntity);
	}

	// 查看非管理用户的总数
	public Integer queryUserInfoCount() {
		return userLoginMapper.queryUserInfoCount();
	}

	// 通过userId查询密码
	public String queryPwd(Integer userId) {
		return userLoginMapper.queryPwd(userId);
	}

	// 修改密码
	public Integer updatePwd(UserLoginEntity userLoginEntity) {
		return userLoginMapper.updatePwd(userLoginEntity);
	}

	// 修改用户权限
	public Integer updateByUserId(Map<String, Object> map) {
		return userLoginMapper.updateByUserId(map);
	}

	// 通过userId查询用户详情
	public UserInfoEntity queryByUserId(Integer userId) {
		return userLoginMapper.queryByUserId(userId);
	}

	// 添加新用户
	public Integer saveUserInfo(UserInfo userInfoEntity) {
		return userLoginMapper.saveUserInfo(userInfoEntity);
	}

	// 查看用户名是否存在
	public Integer queryByUserName(String userName) {
		return userLoginMapper.queryByUserName(userName);
	}
	
	public int deleteUserInfoList(Map<String, Object> map) {
		return this.userLoginMapper.deleteUserInfoList(map);
	}
}
