<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<link rel="stylesheet" href="static/plugins/iCheck/square/blue.css">
<script type="text/javascript" src="static/js/common/base.js"></script>
<script src="static/plugins/validate/jquery.validate.js"></script>
<script src="static/plugins/validate/jquery.validate.extend.js"></script>
<script type="text/javascript" src="static/js/edit.js"></script>
<script type="text/javascript">
            $(function () {
            	edit.init();
            });
</script>
<body>
	<div class="col-sm-10" id="settings">
		<form class="form-horizontal" id="userForm" style="margin-left: 17%;">
			<div class="form-group">
				<label for="locationCode" class="col-sm-3 control-label">
				<font style="color: red; font-size: 16px; font-weight: bolder;">*</font>
								&nbsp;用户名</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required chinesezimu" rangelength="2 20" id="username" placeholder="用户名"
						name="username">
				</div>
			</div>
			<div class="form-group" id="editpwd">
				<label for="parentBureau" class="col-sm-3 control-label">
				<font style="color: red; font-size: 16px; font-weight: bolder;">*</font>
								&nbsp;登录密码</label>
				<div class="col-sm-8">
					<input type="password" class="form-control required" rangelength="8 20" id="pwd" name='pwd'
						placeholder="登录密码">
				</div>
			</div>
			<div class="form-group" id="editspwd">
				<label for="parentBureau" class="col-sm-3 control-label">
				<font style="color: red; font-size: 16px; font-weight: bolder;">*</font>
								&nbsp;确认密码</label>
				<div class="col-sm-8">
					<input type="password" class="form-control required" id="sPwd" name='sPwd'
						placeholder="确认密码">
				</div>
			</div>
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
				<font style="color: red; font-size: 16px; font-weight: bolder;">*</font>
								&nbsp;真实姓名</label>
				<div class="col-sm-8">
					<input type="text" class="form-control chinese required" id="name" name="NAME"
						placeholder="真实姓名">
				</div>
			</div>
			<div class="form-group">
				<label for="telephone" class="col-sm-3 control-label">
				<font style="color: red; font-size: 16px; font-weight: bolder;">*</font>
								&nbsp;身份证号</label>

				<div class="col-sm-8">
					<input type="text" class="form-control identityCard required" id="idno" name="idno"
						placeholder="身份证号">
				</div>
			</div>
			<div class="form-group">
				<label for="bureauAddress" class="col-sm-3 control-label">手机</label>
				<div class="col-sm-8">
					<input class="form-control mobile" id="mobile" name="mobile"
						placeholder="手机" />
				</div>
			</div>
			<div class="form-group">
				<label for="xingbie" class="col-sm-3 control-label">性别</label>
				<div class="col-sm-8">
					<div class="iradio_square-blue">
                        <input  type="radio" id="input-1" name="gendercode" value="1">
                    </div>
                    <label for="input-1" class="">男</label>

                    <div class="iradio_square-blue" >
                        <input  type="radio" id="input-2" name="gendercode" value="2">
                    </div>
                    <label for="input-2" class="">女</label>
                    
                    <div class="iradio_square-blue" >
                        <input  type="radio" id="input-3" name="gendercode" value="0" checked="checked" >
                    </div>
                    <label for="input-3" class="">保密</label>
                    </div>
			</div>
			
			 <div class="form-group" id="sf">
				<label for="shenfen" class="col-sm-3 control-label">用户身份</label>
				<div class="col-sm-8">
					<div class="iradio_square-blue">
                        <input  type="radio" id="admin" name="useridentity" value="1">
                    </div>
                    <label for="input-1" class="">管理员</label>

                    <div class="iradio_square-blue" >
                        <input  type="radio" id="users" name="useridentity" value="2">
                    </div>
                    <label for="input-2" class="">普通用户</label>
                    </div>
			</div> 
			<div class="form-group">
				<div class="col-sm-offset-5 col-sm-9">
					<button type="button" id="addUser" class="btn btn-danger">保存</button>
				</div>
			</div>
		</form>
		<script src="static/plugins/iCheck/icheck.min.js"></script>
		<script type="text/javascript">
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
		</script>
	</div>
</body>
