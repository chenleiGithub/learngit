package com.keyan.dao;

import java.util.List;
import java.util.Map;

import com.keyan.entity.ServiceComplain;
import com.keyan.entity.ServiceComplainView;

public interface ServiceComplainMapper {
	// 查看相关项目总数
	Integer queryServiceComplainCount(ServiceComplainView serviceComplainView);

	// 查看相关项目
	List<ServiceComplainView> queryServiceComplainMessage(ServiceComplainView serviceComplainView);

	// 项目删除（批量删除）
	int deleteList(Map<String, Object> map);

	// 新添项目
	int saveServiceComplain(ServiceComplain serviceComplain);
	
	int updateServiceComplain(ServiceComplain serviceComplain);
}
