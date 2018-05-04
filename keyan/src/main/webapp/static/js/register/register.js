(function($){
    
    $("#registerSubmit").on("click", function() {
    	if(validate($("#nickName"))&&validate($("#registerPwd"))&&validate($("#repassword"))&&validate($("#mobile"))){
    		var username = $("#nickName").val();
    		var password = $("#registerPwd").val();
    		var mobile = $("#mobile").val();
    		
    				$.ajax({
    					async : false,
    					type : "POST",
    					data : {"name":username,"mobile":mobile},
    					url : "register/updateValidate",
    					success: function(data){
    						if(data == 0){
    							$.ajax({
    								async : false,
    								dataType : "JSON",
    								type : "POST",
    								data : {"name":username,"password":password,"mobile":mobile},
    								url :"register/register",
    								success : function(data) {
    									layer.msg('注册成功！', {icon: 1});
    									$.ajax({
    					                    type: "POST",
    					                    url: "process",
    					                    data: {
    					                        username: username,
    					                        password: password,
    					                    },
    					                    dataType: 'json',
    					                    cache: false,
    					                    success: function (data) {
    					                    	if(data){
    				                            	var date = new Date();  
    				                            	date.setTime(date.getTime() + (8.5*60* 60 * 1000)); 
    				                            	Cookies.set('token', data, {expires:date,path:'/',domain:doMain});
    				                            	window.location.href = "page/data";
    				                            	return true;
    				                        	} else {
    				                        		return false;
    				                        	}
    					                    }
    					                });
    												},
    								error : function(data) {
    										layer.msg("注册失败！",{icon: 2});
    												}
    										});	
    						}else{
    							layer.msg('此用户已存在！', {icon: 10});
    						}
    					}
    				});
    			
    		
    		
    	}else{
    		layer.msg('注册信息格式错误，请重新填写！', {icon: 2});
    	}
    });
	
    
    $("#nickName").focus(function(){
    	$("#nickName_prompt").removeClass("register_prompt_error");
        $("#nickName_prompt").text("用户名由大小写英文、数字组成，长度2-20个字符");
    }).blur(function(){
        validate($(this));
    });
    
   
    $("#registerPwd").focus(function(){
    	$("#pwd_prompt").removeClass("register_prompt_error");
        $("#pwd_prompt").html("密码由大小写英文、数字组成，长度8－20个字符");
    }).blur(function(){
        validate($(this));
    });
    
    $("#repassword").focus(function(){
    	$("#repwd_prompt").removeClass("register_prompt_error");
    	$("#repwd_prompt").html("请再次输入您的密码");
    }).blur(function(){
        validate($(this));
    });
   
    $("#mobile").focus(function(){
    	$("#mobile_prompt").removeClass("register_prompt_error");
        $("#mobile_prompt").html("此手机号将是您登录的账号");
    }).blur(function(){
        validate($(this));
    });
    
    function validate($dom){
    	var v=$dom.val();
        var id=$dom.attr("id");
        var flag=true;
        switch (id){
        case "nickName":
            $("#nickName_prompt").html("");
            var reg=/^[a-zA-Z0-9]{2,20}$/;
            if(v==""){
                $("#nickName_prompt").removeClass().addClass("register_prompt_error").html("用户名为必填项，请输入您的用户名");
                flag= false;
            }else if(reg.test(v)==false){
                $("#nickName_prompt").removeClass().addClass("register_prompt_error").html("请用大小写英文字母、数字，长度2-20个字符");
                flag= false;
            }else{
                $("#nickName_prompt").removeClass("register_prompt_error");
                flag=true;
            }
            break;
        case "registerPwd":
            $("#pwd_prompt").html("");
            var reg=/^[a-zA-Z0-9]{8,20}$/;
            if(v==""){
                $("#pwd_prompt").removeClass().addClass("register_prompt_error").html("密码为必填项，请设置您的密码");
                flag=false;
            }else if(reg.test(v)==false){
                $("#pwd_prompt").removeClass().addClass("register_prompt_error").html("请用大小写英文字母、数字，长度为8-20个字符");
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
            }else if($("#registerPwd").val()!=v){
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
