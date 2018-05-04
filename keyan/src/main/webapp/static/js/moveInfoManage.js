var moveInfoManage = {
	init : function() {
		//select2初始化
		moveInfoManage.select2();
		// 绑定数据
		moveInfoManage.message();
		//添加管理员
		moveInfoManage.addBuildManage();
		// 删除方法
		moveInfoManage.deleteSession();
		//全选功能
		moveInfoManage.checkAll();
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
	
	//select2初始化
	select2:function(){
		$("#userName").select2({
			language: "zh-CN",  
		    allowClear: true,  
		    placeholder: "请选择用户", 
			  ajax: {
			    url: 'queryAllUserInfo',
			    dataType: 'json',
			    delay: 250,
			    cache: true,  
			    data: function (params) {
			      return {
			        value: params.term,
			      };
			    },
			    processResults: function (data) {
		    	var options = []; 
		    	for (var i = 0; i < data.length; i++) {  
                    var option = {  
                        "id": data[i].userId,  
                        "text": data[i].name  
                    };  
                    options.push(option);  
                }  
		      return {
		        results: options
		      };
			    },
			    cache: true
			  }
		});
	},

	// dataTables数据表查询
	message : function() {
		var tpl = $("#tpl").html();
		// 预编译模板
		var template = Handlebars.compile(tpl);
		$('#moveManageInfo')
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
								url : 'queryMoveInfo',
							},
							columns : [
									{
										className :"table-list-align-center",
										data : null,
										render : function(data, type, row) {
											return '<input type="checkbox" name="chkOne" class="editor-active" value="'
													+ data.id+ '">';
										}
									},{
										className :"table-list-align-center",
										"data" : "name"
									}, {
										className :"table-list-align-center",
										"data" : function (data) {
					                        if (data.strMoveDate != null) {
					                            if (data.strMoveDate.length > 20) {
					                                return  '<span title="' + data.strMoveDate + '">' + data.strMoveDate.substring(0, 20) + '···</span>';
					                            } else {
					                                return '<span title="' + data.strMoveDate + '">' + data.strMoveDate+ '</span>';
					                            }
					                        } else {
					                            return data.strMoveDate;
					                        }
					                    } 
									},{
										className :"table-list-align-center",
										"data" : "manager"
									},{
										className :"table-list-align-center",
										"data" : "phone"
									}, {
										className :"table-list-align-center",
										"data" : null
									} ],
							columnDefs : [ {
								targets : 5,
								render : function(data) {
									var context = {
										func : [ {
											"name" : "查看迁出信息详情",
											"fn" : "moveInfoManage.queryMessage("
													+ data.id +",'"+
													data.name +"','"+
													data.manager +"','"+
													data.strMoveDate +"','"+
												    data.moveReason+"','"+
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
		$("#addMoveInfo").on("click", function() {
			layer.open({
				type: 1,
	            shade: [0.4, '#000'],
	            title: "添加楼栋信息",
	            area: ['700px', '500px'],
	            shift:'top', //从左动画弹出
	            content: $('#addMove')
			});
		});
		
		$("#addMoveMessage").on("click", function() {
			var userId = $("#userName").val();
			var moveReason = $("#moveReason").val();
			var manager = $("#manager").val();
			var phone = $("#phone").val();
			var note = $("#note").val();
			
			if (formValidation($("#addMove"))) {
					$.ajax({
				        async:true,
				        type:"POST",
				        url:'saveMoveInfo',
				         data:{
				        	 "userId":userId,
				        	 "moveReason":moveReason,
				        	 "manager":manager,
				        	 "phone":phone,
				        	 "note":note
				         }, 
				        dataType:"JSON",
				        success:function(data){
				        	layer.closeAll();
				            layer.msg('保存成功', {icon: 1,time: 2000});
				            $('#moveManageInfo').DataTable().ajax.reload(null, true);
				        }
				    });
			}
		});
	},
	
	// 查询楼栋详情
	queryMessage:function(id,name,manager,strMoveDate,moveReason,note,phone){
		$("#userName1").val(name);
		$("#moveReason1").val(moveReason);
		$("#manager1").val(manager);
		$("#phone1").val(phone);
		$("#note1").val(note);
		$("#strMoveDate1").val(strMoveDate);
		layer.open({
			type: 1,
            shade: [0.4, '#000'],
            title: "查看楼栋详情",
            area: ['600px', '400px'],
            shift:'top', //从左动画弹出
            content: $('#queryMoveInfo')
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
						url : 'deletMoveInfo',
						type : "POST",
						data : {
							"moveIds" : sessionIds
						},
						success : function(data) {
							$('#moveManageInfo').DataTable().ajax.reload();
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