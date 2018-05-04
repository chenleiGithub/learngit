package com.keyan.dao;

import java.util.List;
import java.util.Map;

import com.keyan.entity.ProjectMembers;
import com.keyan.entity.ProjectMessage;

public interface ProjectMapper {
	// 查看相关项目总数
	Integer queryAuditMessageCount(ProjectMessage projectMessage);

	// 查看相关项目
	List<ProjectMessage> queryAuditMessage(ProjectMessage projectMessage);

	// 项目删除（批量删除）
	int deleteList(Map<String, Object> map);

	// 将项目的回收站状态改为1（批量操作）
	int updateByProjectId(Map<String, Object> map);

	// 修改项目的审核状态（批量操作）
	int updateProjectApprove(Map<String, Object> map);

	// 通过资源id
	ProjectMessage queryByProjectId(Integer projectId);
	
	//通过资源id查询成员
	ProjectMembers queryMembers(Integer projectId);
	
	//修改项目
	int updateProject(ProjectMessage projectMessage);
	
	//新添项目
	int saveProject(ProjectMessage projectMessage);
}
