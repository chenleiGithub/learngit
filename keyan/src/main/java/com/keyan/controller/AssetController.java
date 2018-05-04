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

import com.keyan.entity.Asset;
import com.keyan.entity.AssetView;
import com.keyan.services.AssetService;
import com.keyan.utils.DateUtils;

@Controller
public class AssetController {
	@Resource
	private AssetService assetService;

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
	@RequestMapping("/queryAssetMessage")
	@ResponseBody
	public Map<Object, Object> queryAssetMessage(HttpServletRequest request,
			@RequestParam(value = "draw", required = false) Integer draw,
			@RequestParam(value = "start", required = false) Integer start,
			@RequestParam(value = "length", required = false) Integer length,
			@RequestParam(value = "search[value]", required = false) String keyValue) throws Exception {
		// 开始条数
		int startNumber = start;
		// 声明对象
		AssetView assetView = new AssetView();
		// 开始数
		assetView.setStartNumber(startNumber);
		// 结束条数
		assetView.setPageSize(length);
		assetView.setKeyValue(keyValue);

		// 查询数据
		List<AssetView> listData = assetService.queryAssetMessage(assetView);
		for(int i=0;i<listData.size();i++){
			listData.get(i).setStrStartDate(DateUtils.getDate(listData.get(i).getStartDate()));
		}
		// 返回对象
		Map<Object, Object> info = new HashMap<Object, Object>();
		// 总数目
		int countNumber = assetService.queryAssetMessageCount(assetView);
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
	@RequestMapping(value = "/deletAssetDeList")
	@ResponseBody
	public int deletAssetDeList(@RequestParam(value = "assetIds", required = false) String assetIds) {
		String[] array = assetIds.split(",");
		List<String> list = new ArrayList<String>();
		Map<String, Object> map = new HashMap<String, Object>();
		for (int i = 0; i < array.length; i++) {
			list.add(array[i]);
		}
		map.put("assetList", list);
		// 删除项目
		int count = assetService.deleteList(map);
		return count;
	}

	// 新添项目
	@RequestMapping(value = "/saveAsset")
	@ResponseBody
	public int saveAsset(HttpServletRequest request,
			@RequestParam(value = "assetName", required = false) String assetName,
			@RequestParam(value = "manager", required = false) String manager,
			@RequestParam(value = "model", required = false) String model,
			@RequestParam(value = "position", required = false) String position,
			@RequestParam(value = "status", required = false) Integer status,
			@RequestParam(value = "type", required = false) String type,
			@RequestParam(value = "value", required = false) String value,
			@RequestParam(value = "note", required = false) String note) {
		// 声明对象
		Asset asset = new Asset();
		asset.setAssetName(assetName);
		asset.setManager(manager);
		asset.setModel(model);
		asset.setNote(note);
		asset.setPosition(position);
		asset.setStartDate(new Date());
		asset.setStatus(status);
		asset.setType(type);
		asset.setValue(value);

		return assetService.saveAsset(asset);
	}

}
