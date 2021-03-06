var buildManage = {
	init : function() {
		// 绑定数据
		buildManage.message();
		//添加管理员
		buildManage.addBuildManage();
		// 删除方法
		buildManage.deleteBuildManage();
		//全选功能
		buildManage.checkAll();
		//通过cookie值判断是否需要隐藏修改按钮
		var data = eval("(" + Cookies.get("token")+ ")");
		if(data==undefined){
	       	 location.href = "page/logOff";
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
		$('#buildManageInfo')
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
								url : 'queryBuildMessage',
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
					                        if (data.buildName != null) {
					                            if (data.buildName.length > 20) {
					                                return  '<span title="' + data.buildName + '">' + data.buildName.substring(0, 20) + '···</span>';
					                            } else {
					                                return '<span title="' + data.buildName + '">' + data.buildName+ '</span>';
					                            }
					                        } else {
					                            return data.buildName;
					                        }
					                    } 
									},{
										className :"table-list-align-center",
										"data" : "total"
									},{
										className :"table-list-align-center",
										"data" : "buCount"
									},{
										className :"table-list-align-center",
										"data" : function (data) {
					                        if (data.manager != null) {
					                            if (data.manager.length > 30) {
					                                return  '<span title="' + data.manager + '">' + data.manager.substring(0, 30) + '···</span>';
					                            } else {
					                                return '<span title="' + data.manager + '">' + data.manager+ '</span>';
					                            }
					                        } else {
					                            return data.manager;
					                        }
					                    } 
									}, {
										className :"table-list-align-center",
										"data" : null
									} ],
							columnDefs : [ {
								targets : 5,
								render : function(data) {
									var context = {
										func : [ {
											"name" : "查看楼栋详情",
											"fn" : "buildManage.queryMessage("
													+ data.id +",'"+
													data.buildName +"',"+
													data.buCount +","+
													data.total +",'"+
													data.manager +"','"+
												    data.note+"','"+
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
	
	//添加楼栋信息
	addBuildManage:function(){
		$("#addBuildInfo").on("click", function() {
			layer.open({
				type: 1,
	            shade: [0.4, '#000'],
	            title: "添加楼栋信息",
	            area: ['700px', '500px'],
	            shift:'top', //从左动画弹出
	            content: $('#addBuild')
			});
		});
		
		
		$("#addBuildMessage").on("click", function() {
			var buildName = $("#buildName").val();
			var total = $("#total").val();
			var buCount = $("#buCount").val();
			var manager = $("#manager").val();
			var phone = $("#phone").val();
			var note = $("#note").val();
			
			if (formValidation($("#addBuild"))) {
					$.ajax({
				        async:true,
				        type:"POST",
				        url:'saveBuild',
				         data:{
				        	 "buildName":buildName,
				        	 "total":total,
				        	 "buCount":buCount,
				        	 "manager":manager,
				        	 "phone":phone,
				        	 "note":note
				         }, 
				        dataType:"JSON",
				        success:function(data){
				        	layer.closeAll();
				            layer.msg('保存成功', {icon: 1,time: 2000});
				            $('#buildManageInfo').DataTable().ajax.reload(null, true);
				        }
				    });
			}
		});
	},
	
	// 查询楼栋详情
	queryMessage:function(id,buildName,buCount,total,manager,note,phone){
		$("#buildName1").val(buildName);
		$("#buCount1").val(buCount);
		$("#total1").val(total);
		$("#manager1").val(manager);
		$("#note1").val(note);
		$("#phone1").val(phone);
		layer.open({
			type: 1,
            shade: [0.4, '#000'],
            title: "查看楼栋详情",
            area: ['600px', '400px'],
            shift:'top', //从左动画弹出
            content: $('#queryBuild')
		});
	},
	
	deleteBuildManage:function(){
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
						url : 'deletBuildDeList',
						type : "POST",
						data : {
							"buildIds" : sessionIds
						},
						success : function(data) {
							$('#buildManageInfo').DataTable().ajax.reload();
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