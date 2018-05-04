package com.keyan.services;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.keyan.dao.ProjectMapper;
import com.keyan.entity.ProjectMembers;
import com.keyan.entity.ProjectMessage;

@Service
public class ProjectService {

	@Resource
	private ProjectMapper projectMapper;

	// 查看相关项目信息
	public List<ProjectMessage> queryAuditMessage(ProjectMessage projectApprove) {
		return projectMapper.queryAuditMessage(projectApprove);
	}

	// 查看相关项目信息总数
	public Integer queryAuditMessageCount(ProjectMessage projectApprove) {
		return projectMapper.queryAuditMessageCount(projectApprove);
	}

	// 项目删除
	public int deleteList(Map<String, Object> map) {
		return this.projectMapper.deleteList(map);
	}

	// 将项目的回收站状态改为1（批量操作）
	public int updateByProjectId(Map<String, Object> map) {
		return this.projectMapper.updateByProjectId(map);
	}

	// 修改项目的审核状态（批量操作）
	public int updateProjectApprove(Map<String, Object> map) {
		return this.projectMapper.updateProjectApprove(map);
	}

	// 通过项目id查询项目详情
	public ProjectMessage queryByProjectId(Integer projectId) {
		return projectMapper.queryByProjectId(projectId);
	}

	// 通过项目id查询项目成员
	public ProjectMembers queryMembers(Integer projectId) {
		return projectMapper.queryMembers(projectId);
	}
	
	//修改项目
	public int updateProject(ProjectMessage projectMessage) {
		return this.projectMapper.updateProject(projectMessage);
	}
	
	//新添项目
	public int saveProject(ProjectMessage projectMessage) {
		return this.projectMapper.saveProject(projectMessage);
	}
}
