<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>豚丫丫智慧幼教综合服务平台</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
          name="viewport">
<link rel="stylesheet" href="static/plugins/iCheck/square/blue.css">
<script type="text/javascript" src="static/js/common/base.js"></script>
<script src="static/plugins/validate/jquery.validate.js"></script>
<script src="static/plugins/validate/jquery.validate.extend.js"></script>
<script type="text/javascript" src="static/js/updateProject.js"></script>
<script type="text/javascript">
            $(function () {
            	updateProject.init();
            });
</script>
</head>
<body>
	<input type="hidden" id="projectId" value="${requestScope.projectId}">
	<div class="col-sm-10" id="settings">
		<form class="form-horizontal" id="userForm" style="margin-left: 17%;">
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
					<input type="text" class="form-control required" id="projectContent" name="projectContent"
						placeholder="项目内容">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-5 col-sm-9">
					<button type="button" id="update" class="btn btn-danger">确认</button>
				</div>
			</div>
		</form>
		</div>
		<script src="static/plugins/iCheck/icheck.min.js"></script>
<!-- 		<script type="text/javascript">
		$(function () {
			var userId = $("#userid").val();
		     $('#userForm').iCheck({
		        labelHover: false,
		        cursor: true,
		        radioClass: 'iradio_square-blue',
		        increaseArea: '20%'
		    }); 
		    $("#sf").hide();
		    $("#bj").hide();
		   debugger;
		    if($("#isClas").val()=='true'){
		    	if($("#tId").val()==""||$("#tId").val()==null){
		    		$("#sf").show();
					$(":radio[name='useridentity'][value='1']").iCheck('check');
		    	}else{
		    		$("#bj").show();
					$(":radio[name='useridentity'][value='4']").iCheck('check');
		    	}
			}else if($("#type").val()=="S"){
				$("#sf").show();
				$(":radio[name='useridentity'][value='1']").iCheck('check');
			}
		    
		    if (userId != ""&&userId!=null) {
		    	$("input[name=nickname]").val($("#unickName").val());
		    	$("input[name=NAME]").val($("#Name").val());
		    	$("input[name=idno]").val($("#idNo").val());
		    	$("input[name=mobile]").val($("#Mobile").val());
		    	$("input[name=email]").val($("#Email").val());
		    	$("#editpwd").hide();
		    	$("#editspwd").hide();
		    	$("#sf").hide();
			    $("#bj").hide();
		    	$("input[name=username]").val($("#UserName").val());
		    	$("input[name=pwd]").val("12345678");
		    	$("input[name=sPwd]").val("12345678");
		    	$("input[name=username]").attr("readonly","readonly");
	            $(":radio[name='gendercode'][value='" + $("#genderCode").val() + "']").iCheck('check');
	            $(":radio[name='useridentity'][value='" + $("#userType").val() + "']").iCheck('check');
		    }
		});
		$("#addUser").on("click",function(){
			var schoolId = $("#schoolId").val();
			var treeId = $("#tId").val();
			var isClass = $("#isClas").val();
			var type = $("#type").val();
			var pwd = $("#pwd").val();
			var spwd = $("#sPwd").val();
			var username = $("#username").val();
			var idno = $("#idno").val();
			var mobile = $("#mobile").val();
			var userId = $("#userid").val();
			var Mobile = $("#Mobile").val();
			
			if (formValidation($("#userForm"))) {
				if (pwd!=spwd) {
					layer.alert('密码不一致', {icon: 5});
				} else {
					$.ajax({
				        async:true,
				        type:"POST",
				        url:"user/saveUserInfo",
				         data:$("#userForm").serialize()+"&type="+type+"&schoolId="+schoolId+"&treeId="+treeId+"&isClass="+isClass+"&userId"+userId+"&useridentity", 
				        dataType:"JSON",
				        success:function(data){
				        	if (3 == data) {
			        			layer.msg('用户名已存在，操作失败！', {icon: 10});
			        		} else if (0 == data) {
				        		layer.msg('手机号已被使用，操作失败！', {icon: 10});
				        	} else if (1 == data) {
				        		layer.msg('邮箱已被使用，操作失败！', {icon: 10});
				        	} else if (2 == data) {
				        		layer.msg('身份证已被使用，操作失败！', {icon: 10});
				        	} else {
				        		layer.closeAll();
					            layer.msg('保存成功', {icon: 1,time: 2000});
					            $('#tbl_user_mgr').DataTable().ajax.reload(null, true);
				        	}
				        }
				    });
				}
			}
		});
		</script> -->
	</div>
</body>
</html>
