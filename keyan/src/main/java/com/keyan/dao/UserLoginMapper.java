package com.keyan.dao;

import java.util.List;
import java.util.Map;

import com.keyan.entity.UserInfo;
import com.keyan.entity.UserInfoEntity;
import com.keyan.entity.UserLoginEntity;

public interface UserLoginMapper {

	// 用户登录
	UserInfoEntity login(UserInfo userlogin);

	// 查看用户信息
	List<UserInfoEntity> queryUserInfo(UserInfoEntity userInfoEntity);

	// 查看非管理用户的总数
	Integer queryUserInfoCount();

	// 通过userId查询密码
	String queryPwd(Integer userId);

	// 通过userId修改密码
	Integer updatePwd(UserLoginEntity userLoginEntity);

	// 修改用户权限
	Integer updateByUserId(Map<String, Object> map);

	// 通过userId查看用户详情
	UserInfoEntity queryByUserId(Integer userId);

	// 添加新用户
	Integer saveUserInfo(UserInfo userInfo);

	// 查看用户名是否存在
	Integer queryByUserName(String userName);
	
	int deleteUserInfoList(Map<String, Object> map);
}
