package com.keyan.services;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.keyan.dao.ServiceComplainMapper;
import com.keyan.entity.ServiceComplain;
import com.keyan.entity.ServiceComplainView;

@Service
public class ServiceComplainService {

	@Resource
	private ServiceComplainMapper serviceComplainMapper;

	// 查看相关项目信息
	public List<ServiceComplainView> queryServiceComplainMessage(ServiceComplainView serviceComplainView) {
		return serviceComplainMapper.queryServiceComplainMessage(serviceComplainView);
	}

	// 查看相关项目信息总数
	public Integer queryServiceComplainCount(ServiceComplainView serviceComplainView) {
		return serviceComplainMapper.queryServiceComplainCount(serviceComplainView);
	}

	// 项目删除
	public int deleteList(Map<String, Object> map) {
		return this.serviceComplainMapper.deleteList(map);
	}

	// 新添项目
	public int saveServiceComplain(ServiceComplain serviceComplain) {
		return this.serviceComplainMapper.saveServiceComplain(serviceComplain);
	}
	
	public int updateServiceComplain(ServiceComplain serviceComplain) {
		return this.serviceComplainMapper.updateServiceComplain(serviceComplain);
	}
}
