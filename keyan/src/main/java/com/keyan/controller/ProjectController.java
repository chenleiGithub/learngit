package com.keyan.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.keyan.entity.ProjectMessage;
import com.keyan.entity.UserInfoEntity;
import com.keyan.services.ProjectService;
import com.keyan.utils.DateUtils;

@Controller
public class ProjectController {
	@Resource
	private ProjectService projectService;

	// 查看项目信息
	/**
	 * @param request
	 * @param draw
	 * @param start
	 * @param length
	 * @param projectApprove
	 * @param recycleStatus
	 * @param keyValue
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/queryAuditMessage")
	@ResponseBody
	public Map<Object, Object> queryUserInfo(
			HttpServletRequest request,
			@RequestParam(value = "draw", required = false) Integer draw,
			@RequestParam(value = "start", required = false) Integer start,
			@RequestParam(value = "length", required = false) Integer length,
			@RequestParam(value = "projectApprove", required = false) Integer projectApprove,
			@RequestParam(value = "recycleStatus", required = false) Integer recycleStatus,
			@RequestParam(value = "search[value]", required = false) String keyValue)
			throws Exception {
		// 开始条数
		int startNumber = start;
		// 声明对象
		ProjectMessage projectMessage = new ProjectMessage();
		// 开始数
		projectMessage.setStartNumber(startNumber);
		// 结束条数
		projectMessage.setPageSize(length);
		// 审核情况
		if (projectApprove != null) {
			projectMessage.setProjectApprove(projectApprove);
		}
		// 回收站状态
		projectMessage.setRecycleStatus(recycleStatus);

		HttpSession session = request.getSession();
		// 获取Session里面的用户信息
		UserInfoEntity userInfo = (UserInfoEntity) session
				.getAttribute("userInfoEntity");
		Integer userType = userInfo.getUserType();
		if (userType == 3) {
			// 用户id
			projectMessage.setResponsePerson(userInfo.getUserId());
		}
		// 查询数据
		List<ProjectMessage> listData = projectService
				.queryAuditMessage(projectMessage);
		if (listData != null && listData.size() > 0) {
			// 申请时间
			for (int i = 0; i < listData.size(); i++) {
				listData.get(i).setStrApplyTime(
						DateUtils.getDate(listData.get(i).getApplyTime()));
				;
			}
		}
		// 返回对象
		Map<Object, Object> info = new HashMap<Object, Object>();
		// 总数目
		int countNumber = projectService.queryAuditMessageCount(projectMessage);
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
	@RequestMapping(value = "/deleteList")
	@ResponseBody
	public int deleteList(
			@RequestParam(value = "projectIds", required = false) String projectIds) {
		String[] array = projectIds.split(",");
		List<String> list = new ArrayList<String>();
		Map<String, Object> map = new HashMap<String, Object>();
		for (int i = 0; i < array.length; i++) {
			list.add(array[i]);
		}
		map.put("projectList", list);
		// 删除项目
		int count = projectService.deleteList(map);
		return count;
	}

	// 修改回收站状态（批量操作）
	@RequestMapping(value = "/updateByProjectId")
	@ResponseBody
	public int updateByProjectId(
			@RequestParam(value = "projectIds", required = false) String projectIds,
			@RequestParam(value = "recycleStatus", required = false) Integer recycleStatus,
			@RequestParam(value = "projectApprove", required = false) Integer projectApprove) {
		String[] array = projectIds.split(",");
		List<String> list = new ArrayList<String>();
		Map<String, Object> map = new HashMap<String, Object>();
		for (int i = 0; i < array.length; i++) {
			list.add(array[i]);
		}
		map.put("projectList", list);
		map.put("recycleStatus", recycleStatus);
		if (projectApprove != null) {
			map.put("projectApprove", projectApprove);
		}
		// 将项目的回收站状态改为1或0
		int count = projectService.updateByProjectId(map);
		return count;
	}

	// 修改项目的审核状态（批量操作）
	@RequestMapping(value = "/updateProjectApprove")
	@ResponseBody
	public int updateProjectApprove(
			@RequestParam(value = "projectIds", required = false) String projectIds,
			@RequestParam(value = "projectApprove", required = false) String projectApprove) {
		String[] array = projectIds.split(",");
		List<String> list = new ArrayList<String>();
		Map<String, Object> map = new HashMap<String, Object>();
		for (int i = 0; i < array.length; i++) {
			list.add(array[i]);
		}
		map.put("projectList", list);
		map.put("projectApprove", projectApprove);
		// 将项目的回收站状态改为1
		int count = projectService.updateProjectApprove(map);
		return count;
	}

	// 通过项目id查询项目详情
	@RequestMapping("/queryByProjectId")
	@ResponseBody
	public ProjectMessage queryByProjectId(
			@RequestParam(value = "projectId", required = false) Integer projectId)
			throws Exception {
		// 查看项目详情
		ProjectMessage projectMessage = projectService
				.queryByProjectId(projectId);
		projectMessage.setStrApplyTime(DateUtils.getDate(projectMessage
				.getApplyTime()));
		return projectMessage;
	}

	// 修改项目
	@RequestMapping(value = "/allUpdate")
	@ResponseBody
	public int updateProject(
			@RequestParam(value = "projectId", required = false) Integer projectId,
			@RequestParam(value = "projectType", required = false) String projectType,
			@RequestParam(value = "projectName", required = false) String projectName,
			@RequestParam(value = "projectBudget", required = false) Integer projectBudget,
			@RequestParam(value = "projectDeadline", required = false) String projectDeadline,
			@RequestParam(value = "projectContent", required = false) String projectContent) {
		// 声明对象
		ProjectMessage projectMessage = new ProjectMessage();
		// 项目id
		projectMessage.setProjectId(projectId);
		// 项目类型
		projectMessage.setProjectType(projectType);
		// 项目名称
		projectMessage.setProjectName(projectName);
		// 项目预算
		projectMessage.setProjectBudget(projectBudget);
		// 截止日期
		projectMessage.setProjectDeadline(projectDeadline);
		// 项目内容
		projectMessage.setProjectContent(projectContent);

		return projectService.updateProject(projectMessage);
	}

	// 新添项目
	@RequestMapping(value = "/saveProject")
	@ResponseBody
	public int saveProject(
			HttpServletRequest request,
			@RequestParam(value = "projectType", required = false) String projectType,
			@RequestParam(value = "projectName", required = false) String projectName,
			@RequestParam(value = "projectBudget", required = false) Integer projectBudget,
			@RequestParam(value = "projectDeadline", required = false) String projectDeadline,
			@RequestParam(value = "projectContent", required = false) String projectContent,
			@RequestParam(value = "projectMembers", required = false) String projectMembers) {
		// 声明对象
		ProjectMessage projectMessage = new ProjectMessage();
		// 项目类型
		projectMessage.setProjectType(projectType);
		// 项目名称
		projectMessage.setProjectName(projectName);
		// 项目预算
		projectMessage.setProjectBudget(projectBudget);
		// 截止日期
		projectMessage.setProjectDeadline(projectDeadline);
		// 项目内容
		projectMessage.setProjectContent(projectContent);
		// 项目成员
		projectMessage.setProjectMembers(projectMembers);

		HttpSession session = request.getSession();
		// 获取Session里面的用户信息
		UserInfoEntity userInfo = (UserInfoEntity) session
				.getAttribute("userInfoEntity");
		// 获取用户id
		Integer userId = userInfo.getUserId();
		// 申请人
		projectMessage.setResponsePerson(userId);
		// 审核状态
		projectMessage.setProjectApprove(0);
		// 回收站状态
		projectMessage.setRecycleStatus(0);
		// 申请时间
		projectMessage.setApplyTime(new Date());

		return projectService.saveProject(projectMessage);
	}

}
