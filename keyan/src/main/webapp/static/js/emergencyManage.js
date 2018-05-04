var emergencyManage = {
	init : function() {
		// 绑定数据
		emergencyManage.message();
		//添加管理员
		emergencyManage.addEmergencyManage();
		// 删除方法
		emergencyManage.deleteEmergencyManage();
		//全选功能
		emergencyManage.checkAll();
		//通过cookie值判断是否需要隐藏修改按钮
		var data = eval("(" + Cookies.get("token")+ ")");
		if(data==undefined){
	       	 location.href = "page/logOff";
	    }else{
	    	if(data.userType==2){
	    		$(":button").hide();
	    	}
	    } 
	},
	
	// 全选功能
	checkAll : function() {
		$(document).on("click", ".chkAll", function(obj) {
			$("input[name='chkOne']").prop("checked", this.checked);

		});
	},

	// dataTables数据表查询
	message : function() {
		var tpl = $("#tpl").html();
		// 预编译模板
		var template = Handlebars.compile(tpl);
		$('#emergencyManageInfo')
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
								url : 'queryEmergencyMessage',
							},
							columns : [
									{
										className :"table-list-align-center",
										data : null,
										render : function(data, type, row) {
											return '<input type="checkbox" name="chkOne" class="editor-active" value="'
													+ data.id+ '">';
										}
									}, {
										className :"table-list-align-center",
										"data" : function (data) {
					                        if (data.eventCode != null) {
					                            if (data.eventCode.length > 20) {
					                                return  '<span title="' + data.eventCode + '">' + data.eventCode.substring(0, 20) + '···</span>';
					                            } else {
					                                return '<span title="' + data.eventCode + '">' + data.eventCode+ '</span>';
					                            }
					                        } else {
					                            return data.assetName;
					                        }
					                    } 
									},{
										className :"table-list-align-center",
										"data" : "eventTheme"
									},{
										className :"table-list-align-center",
										"data" : function (data) {
					                        if (data.handUser != null) {
					                            if (data.handUser.length > 30) {
					                                return  '<span title="' + data.handUser + '">' + data.handUser.substring(0, 30) + '···</span>';
					                            } else {
					                                return '<span title="' + data.handUser + '">' + data.handUser+ '</span>';
					                            }
					                        } else {
					                            return data.handUser;
					                        }
					                    } 
									},{
										className :"table-list-align-center",
										"data" : "result"
									}, {
										className :"table-list-align-center",
										"data" : null
									} ],
							columnDefs : [ {
								targets : 5,
								render : function(data) {
									var context = {
										func : [ {
											"name" : "查看公共财产详情",
											"fn" : "emergencyManage.queryMessage("
													+ data.id +",'"+
													data.eventCode +"','"+
												    data.eventTheme+"','"+
												    data.handUser+"','"+
												    data.result+"','"+
												    data.eventContent+"')",
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
	
	//添加楼栋信息
	addEmergencyManage:function(){
		$("#addEmergencyInfo").on("click", function() {
			layer.open({
				type: 1,
	            shade: [0.4, '#000'],
	            title: "添加突发情况",
	            area: ['700px', '500px'],
	            shift:'top', //从左动画弹出
	            content: $('#addEmergency')
			});
		});
		
		
		$("#addEmergencyMessage").on("click", function() {
			var eventCode = $("#eventCode").val();
			var eventTheme = $("#eventTheme").val();
			var handUser = $("#handUser").val();
			var result = $("#result").val();
			var eventContent = $("#eventContent").val();
			
			if (formValidation($("#addEmergency"))) {
					$.ajax({
				        async:true,
				        type:"POST",
				        url:'saveEmergency',
				         data:{
				        	 "eventCode":eventCode,
				        	 "eventTheme":eventTheme,
				        	 "handUser":handUser,
				        	 "result":result,
				        	 "eventContent":eventContent
				         }, 
				        dataType:"JSON",
				        success:function(data){
				        	layer.closeAll();
				            layer.msg('保存成功', {icon: 1,time: 2000});
				            $('#emergencyManageInfo').DataTable().ajax.reload(null, true);
				        }
				    });
			}
		});
	},
	
	// 查询楼栋详情
	queryMessage:function(id,eventCode,eventTheme,handUser,result,eventContent){
		$("#eventCode1").val(eventCode);
		$("#eventTheme1").val(eventTheme);
		$("#handUser1").val(handUser);
		$("#result1").val(result);
		$("#eventContent1").val(eventContent);
		layer.open({
			type: 1,
            shade: [0.4, '#000'],
            title: "查看突发事件详情",
            area: ['700px', '500px'],
            shift:'top', //从左动画弹出
            content: $('#queryEmergency')
		});
	},
	
	deleteEmergencyManage:function(){
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
						url : 'deletEmergencyList',
						type : "POST",
						data : {
							"emergencyIds" : sessionIds
						},
						success : function(data) {
							$('#emergencyManageInfo').DataTable().ajax.reload();
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
};