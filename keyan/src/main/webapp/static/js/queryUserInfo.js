var queryUserInfo = {
	init : function() {
		// 绑定数据
		queryUserInfo.message();
		//通过cookie值判断是否需要隐藏修改按钮
		var data = eval("(" + Cookies.get("token")+ ")");
		if(data==undefined){
	       	 location.href = "page/logOff";
	    } 
	},
	
	message:function(){
		 $.ajax({
	    	 type:"POST",
	    	 dataType:"JSON",
	    	 url:'queryByUserId',
	    	 data:{
	    		 "userId": $("#userIds").val()
	    	 },
	    	 success:function (data) {
	    		 if(data.userType==1){
	    			 $("#userType").append("超级管理员");
	    		 }else if(data.userType==2){
	    			 $("#userType").append("普通管理员");
	    		 }else{
	    			 $("#userType").append("普通用户");
	    		 }
	    		 if(data.sex==0){
	    			 $("#sex").append("男");
	    		 }else{
	    			 $("#sex").append("女");
	    		 }
	    		 $("#name").append(data.name);
	    		 $("#idCard").append(data.idCard);
	    	 },
	    	 error:function (data) {
	    		 alert("查询详情失败！");
	    	 }
	     });
	},
	
}