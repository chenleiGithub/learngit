package com.keyan.services;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.keyan.dao.AssetMapper;
import com.keyan.entity.Asset;
import com.keyan.entity.AssetView;

@Service
public class AssetService {

	@Resource
	private AssetMapper assetMapper;

	// 查看相关项目信息
	public List<AssetView> queryAssetMessage(AssetView assetView) {
		return assetMapper.queryAssetMessage(assetView);
	}

	// 查看相关项目信息总数
	public Integer queryAssetMessageCount(AssetView assetView) {
		return assetMapper.queryAssetMessageCount(assetView);
	}

	// 项目删除
	public int deleteList(Map<String, Object> map) {
		return this.assetMapper.deleteList(map);
	}

	// 新添项目
	public int saveAsset(Asset asset) {
		return this.assetMapper.saveAsset(asset);
	}
}
