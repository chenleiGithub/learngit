var table;

var edit = {
	init : function() {
		//新添用户
		edit.addUserInfo();
		//通过cookie值判断是否需要隐藏修改按钮
		var data = eval("(" + Cookies.get("token")+ ")");
		if(data==undefined){
	       	 location.href = "page/logOff";
	    } 
	},

	addUserInfo:function(){
		$("#addUser").on("click",function(){
			var pwd = $("#pwd").val();
			var spwd = $("#sPwd").val();
			var username = $("#username").val();
			var mobile = $("#mobile").val();
			var idno = $("#idno").val();
			var name = $("#name").val();
			if($("#admin").attr("checked")){
				 var userType=2;
			}else if($("#users").attr("checked")){
				 var userType=3;
			}
			if($("#input-1").is(":checked")){
				var sex=1;
			}else if($("#input-2").is(":checked")==true){
				var sex=2;
			}else if($("#input-3").is(":checked")==true){
				var sex=0;
			}
			
			if (formValidation($("#userForm"))) {
				if (pwd!=spwd) {
					layer.alert('密码不一致', {icon: 5});
				} else {
					$.ajax({
				        async:true,
				        type:"POST",
				        url:'saveUserInfo',
				         data:{
				        	 "userType":1,
				        	 "userName":username,
				        	 "password":pwd,
				        	 "sex":sex,
				        	 "mobile":mobile,
				        	 "idCard":idno,
				        	 "name":name
				         }, 
				        dataType:"JSON",
				        success:function(data){
				        	if (data==1) {
			        			layer.msg('用户名已存在，操作失败！', {icon: 10});
			        		} else {
				        		layer.closeAll();
					            layer.msg('保存成功', {icon: 1,time: 2000});
					            $('#userInfo').DataTable().ajax.reload(null, true);
				        	}
				        }
				    });
				}
			}
		});
	},
};

