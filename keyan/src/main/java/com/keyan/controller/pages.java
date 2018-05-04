package com.keyan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("page")
public class pages {
	/**
	 * 跳转到首页
	 * 
	 * @param userId
	 * @return
	 */
	@RequestMapping("/news")
	public ModelAndView appInfoView(@RequestParam(value = "userId", required = false) Integer userId) {
		ModelAndView modelAndView = new ModelAndView("pages/homePage");
		modelAndView.addObject("userId", userId);
		return modelAndView;
	}

	@RequestMapping("/data")
	public ModelAndView layout() {

		return new ModelAndView("pages/dataTables");
	}

	@RequestMapping("/show")
	public ModelAndView show() {

		return new ModelAndView("pages/dataTables");
	}

	// 注册页面
	@RequestMapping("/register")
	public ModelAndView updatedepartment() {

		return new ModelAndView("pages/login/register");
	}

	@RequestMapping("/logOff")
	public ModelAndView LogOff() {

		return new ModelAndView("pages/login/login");
	}

	// 进去权限管理页面
	@RequestMapping("/root")
	public ModelAndView root() {
		return new ModelAndView("pages/root");
	}

	// 进入密码修改页面
	@RequestMapping("/changepwd")
	public ModelAndView changepwd() {
		return new ModelAndView("pages/changepwd");
	}

	// 跳转到查看用户详情页面
	@RequestMapping("/messagePage")
	public ModelAndView messagePage(@RequestParam(value = "userId", required = false) Integer userId) {
		ModelAndView view = new ModelAndView("pages/queryUserInfo");
		view.addObject("userId", userId);
		return view;
	}

	// 跳转到审核未通过的页面
	@RequestMapping("/notAudit")
	public ModelAndView notAudit() {
		return new ModelAndView("pages/notAudit");
	}

	// 跳转到审核通过的页面
	@RequestMapping("/approve")
	public ModelAndView approve() {
		return new ModelAndView("pages/approve");
	}

	// 跳转到审核未通过的页面
	@RequestMapping("/disApprove")
	public ModelAndView disApprove() {
		return new ModelAndView("pages/disApprove");
	}

	// 跳转到回收站页面
	@RequestMapping("/recycle")
	public ModelAndView recycle() {
		return new ModelAndView("pages/recycle");
	}

	// 跳转到查看项目详情页面
	@RequestMapping("/queryProject")
	public ModelAndView queryProject(@RequestParam(value = "projectId", required = false) Integer projectId) {
		ModelAndView view = new ModelAndView("pages/queryProject");
		view.addObject("projectId", projectId);
		return view;
	}

	// 跳转到新增用户页面
	@RequestMapping("/edit")
	public ModelAndView edit() {
		return new ModelAndView("pages/edit");
	}

	// 跳转到修改项目页面或新增项目页面
	@RequestMapping("/updateProject")
	public ModelAndView updateProject(@RequestParam(value = "projectId", required = false) Integer projectId) {
		ModelAndView view = new ModelAndView("pages/updateProject");
		if (projectId != null) {
			view.addObject("projectId", projectId);
		}
		return view;
	}

	// 跳转到新增项目页面
	@RequestMapping("/addProject")
	public ModelAndView addProject() {
		return new ModelAndView("pages/addProject");
	}

	/**
	 * 跳转到楼栋管理
	 * 
	 * @return
	 */
	@RequestMapping("/buildManage")
	public ModelAndView buildManage() {
		return new ModelAndView("pages/buildManage");
	}

	/**
	 * 用户迁移
	 * 
	 * @return
	 */
	@RequestMapping("/moveInfo")
	public ModelAndView moveInfo() {
		return new ModelAndView("pages/moveInfoManage");
	}

	/**
	 * 公共财产
	 * 
	 * @return
	 */
	@RequestMapping("/assetManage")
	public ModelAndView assetManage() {
		return new ModelAndView("pages/assetManage");
	}

	/**
	 * 服务投诉
	 * 
	 * @return
	 */
	@RequestMapping("/serviceComplain")
	public ModelAndView serviceComplain() {
		return new ModelAndView("pages/serviceComplain");
	}

	/**
	 * 投诉处理
	 * 
	 * @return
	 */
	@RequestMapping("/handleComplain")
	public ModelAndView handleComplain() {
		return new ModelAndView("pages/handleComplain");
	}

	/**
	 * 水电费
	 * 
	 * @return
	 */
	@RequestMapping("/gathering")
	public ModelAndView gather() {
		return new ModelAndView("pages/livingCostManage");
	}

	/**
	 * 物管费
	 * 
	 * @return
	 */
	@RequestMapping("/goodMoney")
	public ModelAndView goodMoney() {
		return new ModelAndView("pages/goodMoney");
	}

	/**
	 * 业主私人财物报修
	 * 
	 * @return
	 */
	@RequestMapping("/privateRepair")
	public ModelAndView privateRepair() {
		return new ModelAndView("pages/privateRepair");
	}

	/**
	 * 公共财物报修管理
	 * 
	 * @return
	 */
	@RequestMapping("/publicRepair")
	public ModelAndView publicRepair() {
		return new ModelAndView("pages/publicRepair");
	}

	/**
	 * 车位使用管理
	 * 
	 * @return
	 */
	@RequestMapping("/parkPlace")
	public ModelAndView parkPlace() {
		return new ModelAndView("pages/parkPlace");
	}

	/**
	 * 突发事件
	 * 
	 * @return
	 */
	@RequestMapping("/emergency")
	public ModelAndView emergency() {
		return new ModelAndView("pages/emergencyManage");
	}

	/**
	 * 业主私人财物报修处理
	 * 
	 * @return
	 */
	@RequestMapping("/privateRepairHandle")
	public ModelAndView privateRepairHandle() {
		return new ModelAndView("pages/privateRepairHandle");
	}

	/**
	 * 公共财物报修处理
	 * 
	 * @return
	 */
	@RequestMapping("/publicRepairHandle")
	public ModelAndView publicRepairHandle() {
		return new ModelAndView("pages/publicRepairHandle");
	}
}
