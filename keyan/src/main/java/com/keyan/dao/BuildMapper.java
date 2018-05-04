package com.keyan.dao;

import java.util.List;
import java.util.Map;

import com.keyan.entity.BuildingInfo;
import com.keyan.entity.BuildingInfoView;

public interface BuildMapper {
	// 查看相关项目总数
	Integer queryBuildMessageCount(BuildingInfoView buildingInfoView);

	// 查看相关项目
	List<BuildingInfoView> queryBuildMessage(BuildingInfoView buildingInfoView);

	/**
	 * 查询所有楼栋
	 * 
	 * @param buildingInfoView
	 * @return
	 */
	List<BuildingInfoView> queryAllBuild();

	// 项目删除（批量删除）
	int deleteList(Map<String, Object> map);

	// 新添项目
	int saveBuild(BuildingInfo buildingInfo);
}
