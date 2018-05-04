<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<tiles:insertDefinition name="defaultTemplate">
	<tiles:putAttribute name="body">
		<section class="content-header">
			<h1>
				<a href="page/parentalInfo">育儿助手</a>--育儿信息添加
			</h1>
		</section>
		<section class="content">
			<div class="box">
				<form class="form-horizontal" id="userForm" style="margin-left: -2%;">
			<div class="form-group">
				<label for="locationCode" class="col-sm-3 control-label">
				<font style="color: red; font-size: 16px; font-weight: bolder;">*</font>
								&nbsp;项目类型</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" rangelength="2 20" id="projectType" placeholder="项目类型"
						name="projectType">
				</div>
			</div>
			<div class="form-group" id="editpwd">
				<label for="parentBureau" class="col-sm-3 control-label">
				<font style="color: red; font-size: 16px; font-weight: bolder;">*</font>
								&nbsp;项目名称</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" id="projectName" name='projectName'
						placeholder="项目名称">
				</div>
			</div>
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
				<font style="color: red; font-size: 16px; font-weight: bolder;">*</font>
								&nbsp;项目成员</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" id="projectMembers" name="projectMembers"
						placeholder="项目成员">
				</div>
			</div>
			<div class="form-group" id="editspwd">
				<label for="parentBureau" class="col-sm-3 control-label">
				<font style="color: red; font-size: 16px; font-weight: bolder;">*</font>
								&nbsp;项目预算</label>
				<div class="col-sm-8">
					<input type="text" class="form-control number" id="projectBudget" name='sPprojectBudgetwd'
						placeholder="项目预算">
				</div>
			</div>
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
				<font style="color: red; font-size: 16px; font-weight: bolder;">*</font>
								&nbsp;截止日期</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" id="projectDeadline" name="projectDeadline"
						placeholder="截止日期">
				</div>
			</div>
			<div class="form-group">
				<label for="projectContent" class="col-sm-3 control-label">
				<font style="color: red; font-size: 16px; font-weight: bolder;">*</font>
								&nbsp;项目内容</label>

				<div class="col-sm-8">
					<textarea class="form-control required" id="projectContent"
									style="height: 200px;" name="projectContent" rangelength="0 600"
									style="resize: none;" placeholder="项目内容" /></textarea>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-5 col-sm-9">
					<button type="button" id="add" class="btn btn-danger">确认</button>
				</div>
			</div>
		</form>
			</div>
		</section>
		<script type="text/javascript"
			src="static/plugins/dropzone-4.2.0/cl/dropzone.min.js"></script>
		<script src="static/js/common/base.js"></script>
		<script src="static/plugins/layer/layer.js"></script>
		<script src="static/plugins/validate/jquery.validate.js"></script>
		<script src="static/plugins/validate/jquery.validate.extend.js"></script>
		<script src="static/js/addProject.js"></script>
		<script type="text/javascript">
            $(function () {
            	addProject.init();
            });
        </script>
	</tiles:putAttribute>
</tiles:insertDefinition>