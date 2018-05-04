<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户详情</title>
<!-- Select2 -->
<link rel="stylesheet"
	href="static/plugins/bootstrap-select/css/bootstrap-select.css">
<link rel="stylesheet" href="static/plugins/iCheck/square/blue.css">

</head>
<body>
	<div class="col-sm-12" id="settings">
		<form class="form-horizontal" id="addclassform">
		<input type="hidden" value="${requestScope.userId}" id="userIds">
		<div style="margin-top:25px;margin-left:5px;color:grey;">
			<span>用户类型</span>
			<span style="margin-left:33px;" id="userType"></span>
		</div>	
		<div style="margin-top:25px;margin-left:5px;color:grey;">
			<span>用户姓名</span>
			<span style="margin-left:33px;" id="name"></span>
		</div>
		<div style="margin-top:25px;margin-left:5px;color:grey;">
			<span>性别</span>
			<span style="margin-left:60px;" id="sex"></span>
		</div>
		<div style="margin-top:25px;margin-left:5px;color:grey;">
			<span>身份证号码</span>
			<span style="margin-left:17px;" id="idCard"></span>
		</div>		
		</form>
	</div>
	<script type="text/javascript" src="static/js/queryUserInfo.js"></script>
	<script type="text/javascript">
			$(function() {
				queryUserInfo.init();
			});
	</script>
</body>
</html>
