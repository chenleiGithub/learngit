<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>项目详情</title>
<!-- Select2 -->
<link rel="stylesheet"
	href="static/plugins/bootstrap-select/css/bootstrap-select.css">
<link rel="stylesheet" href="static/plugins/iCheck/square/blue.css">

</head>
<body>
	<div class="col-sm-12" id="settings">
		<form class="form-horizontal" id="addclassform">
		<input type="hidden" value="${requestScope.projectId}" id="projectId">
		<div style="margin-top:25px;margin-left:5px;color:grey;">
			<span>项目名称</span>
			<span style="margin-left:20px;" id="projectName"></span>
		</div>
		<div style="margin-top:25px;margin-left:5px;color:grey;">
			<span>申请人</span>
			<span style="margin-left:33px;" id="responsePerson"></span>
		</div>
		<div style="margin-top:25px;margin-left:5px;color:grey;">
			<span>申请时间</span>
			<span style="margin-left:20px;" id="applyTime"></span>
		</div>	
		<div style="margin-top:25px;margin-left:5px;color:grey;">
			<span>项目预算</span>
			<span style="margin-left:20px;" id="projectBudget"></span>
		</div>
		<div style="margin-top:25px;margin-left:5px;color:grey;">
			<span>截止日期</span>
			<span style="margin-left:20px;" id="projectDeadline"></span>
		</div>
		<div style="margin-top:25px;margin-left:5px;color:grey;">
			<span>项目成员</span>
			<span style="margin-left:20px;" id="projectMembers"></span>
		</div>
		<div style="float:left;margin-top:25px;margin-left:6px;color:grey;">
		<p style="padding-top:0;">
			<span style=" word-wrap: break-word; line-height:22px;float: left;">项目内容</span>
			<span style="margin-left:20px; float: left;display: block;word-wrap:break-word; color:#60605f;width:400px;line-height:22px;margin-bottom: 16px;" id="projectContent"></span>
		</p>
		</div>
		<div style="margin-left:5px;margin-top:20px;word-wrap: break-word; word-break: normal;" id="discussionContent">
		</div>
		</form>
	</div>
	<script type="text/javascript" src="static/js/queryProject.js"></script>
	<script type="text/javascript">
			$(function() {
				queryProject.init();
			});
	</script>
</body>
</html>
