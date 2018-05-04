package com.keyan.services;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.keyan.dao.BuildMapper;
import com.keyan.entity.BuildingInfo;
import com.keyan.entity.BuildingInfoView;

@Service
public class BuildService {

	@Resource
	private BuildMapper buildMapper;

	// 查看相关项目信息
	public List<BuildingInfoView> queryBuildMessage(BuildingInfoView buildingInfoView) {
		return buildMapper.queryBuildMessage(buildingInfoView);
	}
	
	
	public List<BuildingInfoView> queryAllBuild() {
		return buildMapper.queryAllBuild();
	}

	// 查看相关项目信息总数
	public Integer queryBuildMessageCount(BuildingInfoView buildingInfoView) {
		return buildMapper.queryBuildMessageCount(buildingInfoView);
	}

	// 项目删除
	public int deleteList(Map<String, Object> map) {
		return this.buildMapper.deleteList(map);
	}

	// 新添项目
	public int saveBuild(BuildingInfo buildingInfo) {
		return this.buildMapper.saveBuild(buildingInfo);
	}
}
