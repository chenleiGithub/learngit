(function($) {
	// 记住密码初始化
	$('input').iCheck({
		checkboxClass : 'icheckbox_square-blue',
		radioClass : 'iradio_square-blue',
		increaseArea : '20%' // optional
	});

	document.onkeydown = function(event) {
		var e = event || window.event || arguments.callee.caller.arguments[0];
		if (e && e.keyCode == 13) { // enter 键
			var userName = $("#username").val();
			var password = $("#password").val();
			if (!userName) {
				alert("用户名不得为空");
			} else if (!password) {
				alert("密码不得为空");
			} else {
				$.ajax({
					type : "POST",
					url : 'process',
					data : {
						userName : userName,
						password : password
					},
					cache : false,
					success : function(data) {
						if (data != 0) {
							var date = new Date();  
                        	date.setTime(date.getTime() + (8.5*60* 60 * 1000)); 
                        	Cookies.set('token', data, {expires:date,path:'/',domain:'localhost'});
							window.location.href = "page/show";
						} else {
							alert("用户名或密码不正确");
						}
					}
				});
			}
		}
	};
	
	$("#loginSubmit").on("click", function(){
		var userName = $("#username").val();
		var password = $("#password").val();
		if (!userName) {
			alert("用户名不得为空");
		} else if (!password) {
			alert("密码不得为空");
		} else {
			$.ajax({
				type : "POST",
				url : 'process',
				data : {
					userName : userName,
					password : password
				},
				cache : false,
				success : function(data) {
					if (data != 0) {
						var date = new Date();  
                    	date.setTime(date.getTime() + (8.5*60* 60 * 1000)); 
                    	Cookies.set('token', data, {expires:date,path:'/',domain:'localhost'});
						window.location.href = "page/show";
					} else {
						alert("用户名或密码不正确");
					}
				}
			});
		}
	});
})(jQuery);
