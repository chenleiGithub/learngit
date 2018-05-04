package com.keyan.dao;

import java.util.List;
import java.util.Map;

import com.keyan.entity.Asset;
import com.keyan.entity.AssetView;

public interface AssetMapper {
	// 查看相关项目总数
	Integer queryAssetMessageCount(AssetView assetView);

	// 查看相关项目
	List<AssetView> queryAssetMessage(AssetView assetView);

	// 项目删除（批量删除）
	int deleteList(Map<String, Object> map);

	// 新添项目
	int saveAsset(Asset asset);
}
