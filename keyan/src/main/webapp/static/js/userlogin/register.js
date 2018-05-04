(function($){
	$(".select2").select2();
    
    $("#registerSubmit").on("click", function() {
    		var userName = $("#username").val();
    		var password = $("#password").val();
    		var mobile = $("#mobile").val();
    		var name = $("#name").val();
    		var idCard = $("#idCard").val();
    		
    				$.ajax({
    					async : false,
    					type : "POST",
    					data : {"userName":$("#username").val(),
    							"name":$("#name").val(),
    							"sex":$("#sex").val(),
    							"password":$("#password").val(),
    							"houseNumber":$("#houseNumber").val(),
    							"phone":$("#phone").val()
    							},
    					url:'saveUserInfo',
    					success: function(data){
    						if (data==1) {
			        			layer.msg('用户名已存在，操作失败！', {icon: 10});
			        		} else {
					            layer.msg('注册成功', {icon: 1,time: 2000});
				        	}
    					}
    				});
    });
	
    
    $("#username").focus(function(){
    	$("#username_prompt").removeClass("register_prompt_error");
        $("#username_prompt").html("此用户名为您的登录名,性别默认为男");
    }).blur(function(){
        validate($(this));
    });
    
   
    $("#password").focus(function(){
    	$("#pwd_prompt").removeClass("register_prompt_error");
        $("#pwd_prompt").html("密码可由大小写英文字母、数字组成，长度为6－20个字符");
    }).blur(function(){
        validate($(this));
    });
    
    $("#repassword").focus(function(){
    	$("#repwd_prompt").removeClass("register_prompt_error");
    	$("#repwd_prompt").html("请再次输入您的密码");
    }).blur(function(){
        validate($(this));
    });
   
    $("#phone").focus(function(){
    	$("#mobile_prompt").removeClass("register_prompt_error");
        $("#mobile_prompt").html("此手机号为您的真实手机号码");
    }).blur(function(){
        validate($(this));
    });
    
    function validate($dom){
    	var v=$dom.val();
        var id=$dom.attr("id");
        var flag=true;
        switch (id){
        case "username":
            $("#username_prompt").html("");
            var reg=/^[a-zA-Z0-9]{2,20}$/;
            if(v==""){
                $("#username_prompt").removeClass().addClass("register_prompt_error").html("昵称为必填项，请输入您的昵称");
                flag= false;
            }else if(reg.test(v)==false){
                $("#username_prompt").removeClass().addClass("register_prompt_error").html("请用大小写英文字母、数字，长度为2-20个字符");
                flag= false;
            }else{
                $("#username_prompt").removeClass("register_prompt_error");   
                flag=true;
            }
            break;
        case "password":
            $("#pwd_prompt").html("");
            var reg=/^[a-zA-Z0-9]{6,20}$/;
            if(v==""){
                $("#pwd_prompt").removeClass().addClass("register_prompt_error").html("密码为必填项，请设置您的密码");
                flag=false;
            }else if(reg.test(v)==false){
                $("#pwd_prompt").removeClass().addClass("register_prompt_error").html("请用大小写英文字母、数字，长度为6-20个字符");
                flag=false;
            }else{
                $("#pwd_prompt").removeClass("register_prompt_error"); 
                flag=true;
            }
            break;
        case "repassword":
            $("#repwd_prompt").html("");
            if(v==""){
                $("#repwd_prompt").removeClass().addClass("register_prompt_error").html("请再次输入您的密码");
                flag=false;
            }else if($("#password").val()!=v){
                $("#repwd_prompt").removeClass().addClass("register_prompt_error").html("两次输入密码不一致，请重新输入");
                flag=false;
            }else{
                $("#repwd_prompt").removeClass("register_prompt_error"); 
                flag=true;
            }
            break;
        case "mobile":
            $("#mobile_prompt").html("");
            var reg=/^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1}))+\d{8})$/;
            if(v==""){
                $("#mobile_prompt").removeClass().addClass("register_prompt_error").html("手机为必填项，请输入你的手机号码");
                flag=false;
            }else if(reg.test(v)==false){
                $("#mobile_prompt").removeClass().addClass("register_prompt_error").html("手机号码格式不正确，请重新输入");
                flag=false;
            }else{
                $("#mobile_prompt").removeClass("register_prompt_error"); 
                flag=true;
            }
            break;
        }
        return flag;
    }
})(jQuery);