var table;

var root = {
	init : function() {
		// 绑定数据
		root.message();
		// 删除方法
		root.deleteSession();
		// 全选方法
		root.checkAll();
		//设为普通管理员
		root.authentication();
		//添加管理员
		root.addUserInfo();
		//下拉框初始化
		root.select();
		//通过cookie值判断是否需要隐藏修改按钮
		var data = eval("(" + Cookies.get("token")+ ")");
		if(data==undefined){
	       	 location.href = "page/logOff";
	    } 
		//单选框初始化
		$('input:radio').iCheck({
				labelHover : false,
			    cursor : true,
			    checkboxClass : 'icheckbox_square-blue',
			    radioClass : 'iradio_square-blue',
			    increaseArea : '20%'
		});
	},
	
	select:function(){
		$.ajax({
			url : 'queryAllBuild',
			type : "GET",
			success : function(data) {
				for(var i=0;i<data.length;i++){
					$("#buildIngId").append('<option value='+data[i].id+'>'+data[i].buildName+'</option>')
				}
			},
			error : function(data) {
				layer.msg('失败', {
					icon : 2
				});
			}
		});
		$(".select2").select2();
	},

	// dataTables数据表查询
	message : function() {
		var tpl = $("#tpl").html();
		// 预编译模板
		var template = Handlebars.compile(tpl);
		$('#userInfo')
				.DataTable(
						{
							// 服务器数据加载
							serverSide : true,
							// 搜索框
							searching : true,
							// 分页框
							lengthChange : false,
							// 分页数（数组）
							lengthMenu : [ 10],
							// 列头排序
							ordering : false,
							ajax : {
								type : 'post',
								url : 'queryUserInfo',
							},
							columns : [
									{
										className :"table-list-align-center",
										data : null,
										render : function(data, type, row) {
											return '<input type="checkbox" name="chkOne" class="editor-active" value="'
													+ data.userId+ '">';
										}
									}, {
										className :"table-list-align-center",
										"data" : function (data) {
					                        if (data.userName != null) {
					                            if (data.userName.length > 20) {
					                                return  '<span title="' + data.userName + '">' + data.userName.substring(0, 20) + '···</span>';
					                            } else {
					                                return '<span title="' + data.userName + '">' + data.userName+ '</span>';
					                            }
					                        } else {
					                            return data.userName;
					                        }
					                    } 
									},{
										className :"table-list-align-center",
										"data" : "name"
									},{
										className :"table-list-align-center",
										"data" : function (data) {
					                       if(data.sex==0){
					                    	   return "男";
					                       }else if(data.sex==1){
					                    	   return "女";
					                       }else if(data.sex==2){
					                    	   return "不详";
					                       }else{
					                    	   return null;
					                       }
					                       }
									},{
										className :"table-list-align-center",
										"data" : function (data) {
					                        if (data.houseNumber != null) {
					                            if (data.houseNumber.length > 30) {
					                                return  '<span title="' + data.houseNumber + '">' + data.houseNumber.substring(0, 30) + '···</span>';
					                            } else {
					                                return '<span title="' + data.houseNumber + '">' + data.houseNumber+ '</span>';
					                            }
					                        } else {
					                            return data.userName;
					                        }
					                    } 
									},{
										className :"table-list-align-center",
										"data" : function (data) {
					                       if(data.isAuthentication==0){
					                    	   return "未认证";
					                       }else{
					                    	   return "已认证";
					                       }
					                       }
									}, {
										className :"table-list-align-center",
										"data" : null
									} ],
							columnDefs : [ {
								targets : 6,
								render : function(data) {
									var context = {
										func : [ {
											"name" : "查看个人详情",
											"fn" : "root.queryMessage("
													+ data.userId +",'"+
													data.userName +"',"+
													data.sex +",'"+
													data.name +"','"+
												    data.houseNumber+"','"+
												    data.cardId+"','"+
												    data.buildName+"','"+
												    data.phone+"')",
											"type" : "primary"
										} ]
									};
									return template(context);
								}
							}

							],
							"language" : {
								"lengthMenu" : "_MENU_ 条记录每页",
								"zeroRecords" : "没有找到记录",
								"info" : "第 _PAGE_ 页 ( 总共 _PAGES_ 页 )",
								"infoEmpty" : "无记录",
								"infoFiltered" : "(从 _MAX_ 条记录过滤)",
								"paginate" : {
									"previous" : "上一页",
									"next" : "下一页"
								}
							},
							"dom" : "<'row'<'col-xs-2'l><'#mytool.col-xs-4'><'col-xs-6'f>r>"
									+ "t" + "<'row'<'col-xs-6'i><'col-xs-6'p>>"

						});
	},
	//全选功能
	 checkAll:function(){
		$(document).on("click",".chkAll",function(obj){
			$("input[name='chkOne']").prop("checked", this.checked);
			
		});
	},
	
	//设为普通用户
	generalUser:function(){
		$("#generalUser").on("click", function() {
			var userId = new Array();
			$(":checkbox[name='chkOne']").each(function() {
				if ($(this).prop("checked")) {
					userId.push($(this).val());

				}
			});
			var userIds = userId.toString();
			if (userIds.length != 0) {
				layer.confirm("确认修改吗？", {
	                icon: 3,
	                title: '提示'
	            }, function () {
	            	$.ajax({
						url : 'updateByUserId',
						type : "POST",
						data : {
							"userIds" : userIds,
							"userType":3
						},
						success : function(data) {
							$('#userInfo').DataTable().ajax.reload();
							layer.msg('修改成功！', {
								icon : 1
							});
							$("input[name='chkAll']").prop("checked", false);
						},
						error : function(data) {
							layer.msg('修改失败！', {
								icon : 2
							});
						}
					});
	            });
				
			} else {
				layer.msg('请选择！', {
					icon : 10
				});
			}
		});
	},
	
	//设为普通管理员
	authentication:function(){
		$("#authentication").on("click", function() {
			var userId = new Array();
			$(":checkbox[name='chkOne']").each(function() {
				if ($(this).prop("checked")) {
					userId.push($(this).val());

				}
			});
			var userIds = userId.toString();
			if (userIds.length != 0) {
				layer.confirm("确认认证吗？", {
	                icon: 3,
	                title: '提示'
	            }, function () {
	            	$.ajax({
						url : 'updateByUserId',
						type : "POST",
						data : {
							"userIds" : userIds,
							"isAuthentication":1
						},
						success : function(data) {
							$('#userInfo').DataTable().ajax.reload();
							layer.msg('修改成功！', {
								icon : 1
							});
							$("input[name='chkAll']").prop("checked", false);
						},
						error : function(data) {
							layer.msg('修改失败！', {
								icon : 2
							});
						}
					});
	            });
				
			} else {
				layer.msg('请选择！', {
					icon : 10
				});
			}
		});
	},
	
	deleteSession:function(){
		$("#deleteList").on("click", function() {
			var sessionId = new Array();
			$(":checkbox[name='chkOne']").each(function() {
				if ($(this).prop("checked")) {
					sessionId.push($(this).val());

				}
			});
			var sessionIds = sessionId.toString();
			if (sessionIds.length != 0) {
				layer.confirm("确认删除吗？", {
	                icon: 3,
	                title: '提示'
	            }, function () {
	            	$.ajax({
						url : 'deleteUserInfoList',
						type : "POST",
						data : {
							"userIds" : sessionIds
						},
						success : function(data) {
							$('#userInfo').DataTable().ajax.reload();
							layer.msg('删除成功！', {
								icon : 1
							});
							$("input[name='chkAll']").prop("checked", false);
						},
						error : function(data) {
							layer.msg('删除失败！', {
								icon : 2
							});
						}
					});
	            });
				
			} else {
				layer.msg('请选择！', {
					icon : 10
				});
			}
		});
	},
	
	// 查询用户详情
	queryMessage:function(userId,userName,sex,name,houseNumber,cardId,buildName,phone){
		$("#userName1").val(userName);
		if(sex==0){
			$("#sex1").val("男");
		}else if(sex==1){
			$("#sex1").val("女");
		}else{
			$("#sex1").val("不详");
		}
		
		$("#name1").val(name);
		$("#houseNumber1").val(houseNumber);
		$("#phone1").val(phone);
		$("#buildName1").val(buildName);
		$("#cardId1").val(cardId);
		layer.open({
			type: 1,
            shade: [0.4, '#000'],
            title: "添加用户",
            area: ['600px', '500px'],
            shift:'top', //从左动画弹出
            content: $('#queryUserForm')
		});
	},

	//添加管理员
	addUserInfo:function(){
		$("#addUserInfo").on("click", function() {
			layer.open({
				type: 1,
	            shade: [0.4, '#000'],
	            title: "添加用户",
	            area: ['600px', '500px'],
	            shift:'top', //从左动画弹出
	            content: $('#addUserForm')
			});
		});
		
		
		$("#addUser").on("click", function() {
			var userName = $("#userName").val();
			var name = $("#name").val();
			var houseNumber = $("#houseNumber").val();
			var phone = $("#phone").val();
			var buildIngId = $("#buildIngId").val();
			var cardId = $("#cardId").val();
			if($("#input-1").is(":checked")){
				var sex=0;
			}else if($("#input-2").is(":checked")==true){
				var sex=1;
			}else if($("#input-3").is(":checked")==true){
				var sex=2;
			}
			
			if (formValidation($("#addUserForm"))) {
					$.ajax({
				        async:true,
				        type:"POST",
				        url:'saveUserInfo',
				         data:{
				        	 "userName":userName,
				        	 "name":name,
				        	 "houseNumber":houseNumber,
				        	 "phone":phone,
				        	 "sex":sex,
				        	 "password":"12345678",
				        	 "buildIngId":buildIngId,
				        	 "cardId":cardId
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
		});
	},
};

