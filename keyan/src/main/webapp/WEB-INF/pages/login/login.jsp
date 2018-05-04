<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
  String basePath =
      request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
          + request.getContextPath() + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<base href="<%=basePath%>">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>统一登录认证</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.5 -->
<link rel="stylesheet"
	href="static/plugins/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="static/plugins/dist/css/font-awesome-4.4.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="static/plugins/dist/css/ionicons/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="static/plugins/dist/css/AdminLTE.min.css">
<link rel="stylesheet" href="static/css/login.css">
<!-- iCheck -->
<link rel="stylesheet" href="static/plugins/iCheck/square/blue.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
   <script src="static/plugins/iePlugins/html5shiv.min.js"></script>
  <script src="static/plugins/iePlugins/respond.min.js"></script>
  <![endif]-->
</head>
<body class="hold-transition login-page blur-login">
	<div class="login-box">
		<div class="login-logo">
			<a href="../../index2.html"> <i
				class="ace-icon fa fa-leaf text-green"></i> <b class="text-red">小区物业管理系统</b>
				<!-- <span class="text-gray">系统</span> -->
			</a>
		</div>
		<!-- /.login-logo -->
		<div class="login-box-body" style="height: 420px;">
			<h3>
				<p class="login-box-msg text-blue">统一登录认证</p>
			</h3>

			<form action="../../index2.html" method="post">
				<div class="form-group has-feedback">
					<input type="text" class="form-control" placeholder="账号"
						name="username" id="username"> <span
						class="glyphicon glyphicon-envelope form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="password" class="form-control" placeholder="密码"
						name="password" id="password"> <span
						class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>
				<div class="row">
					<div class="col-xs-8">
						<div class="checkbox icheck">
							<label> <input type="checkbox" id="remeberme"
								name="remeberme"> 记住我
							</label>
						</div>
					</div>
					<!-- /.col -->
					<div class="col-xs-4">
						<button type="button" id="loginSubmit"
							class="btn btn-primary btn-block btn-flat">
							<i class="ace-icon fa fa-key" onKeyDown="keydownEvent()"></i> 登录
						</button>
					</div>
					<!-- /.col -->
				</div>
			</form>

			<div class="social-auth-links text-center">
	<!-- 			<p>-快速登录-</p>
				<div class="row"
					style="border-top: 1px solid #D5E3EF; padding: 14px 0 14px 0;">

					<a href="#" class="btn  btn-social  btn-flat"><i
						class="fa fa-qq"> </i>QQ</a> <a href="#"
						class="btn  btn-social  btn-flat"><i class="fa fa-weibo">
					</i>新浪微博</a> <a href="#" class="btn  btn-social  btn-flat"><i
						class="fa fa-renren"> </i>人人</a>
				</div> -->
				<div class="row"  style="margin-top: 47px;">
					<a onclick="window.location.href = 'page/register'" class="btn btn-block btn-social  btn-flat">
						<i class="fa fa-registered"></i> 新用户注册
					</a>
				</div>
			</div>
			<!-- /.social-auth-links -->
		</div>
		<!-- /.login-box-body -->
	</div>
	<!-- /.login-box -->
	<!-- jQuery 2.1.4 -->
	<script src="static/plugins/jQuery/jQuery-2.1.4.min.js"></script>
	<!-- Bootstrap 3.3.5 -->
	<script src="static/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="static/plugins/js-cookie/js.cookie-2.1.0.min.js"></script>
	<script type="text/javascript" src="static/js/finalparameter.js"></script>
	<!-- iCheck -->
	<script src="static/plugins/iCheck/icheck.min.js"></script>
	<script src="static/js/userlogin/login.js"></script>
</body>
</html>
