var handleComplain = {
	init : function() {
		// 绑定数据
		handleComplain.message();
		//添加管理员
		handleComplain.addServiceComplainInfoManage();
		//全选功能
		handleComplain.checkAll();
		//通过cookie值判断是否需要隐藏修改按钮
		var data = eval("(" + Cookies.get("token")+ ")");
		if(data==undefined){
	       	 location.href = "page/logOff";
	    } 
		$(".select2").select2();
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
		$('#serviceComplainManageInfo')
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
								url : 'queryServiceComplainMessage',
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
					                        if (data.complainTitle != null) {
					                            if (data.complainTitle.length > 20) {
					                                return  '<span title="' + data.complainTitle + '">' + data.complainTitle.substring(0, 20) + '···</span>';
					                            } else {
					                                return '<span title="' + data.complainTitle + '">' + data.complainTitle+ '</span>';
					                            }
					                        } else {
					                            return data.complainTitle;
					                        }
					                    } 
									},{
										className :"table-list-align-center",
										"data" : "complainName"
									},{
										className :"table-list-align-center",
										"data" : "strComplainDate"
									},{
										className :"table-list-align-center",
										"data" : function (data) {
					                        if (data.result != null) {
					                            if (data.result==0) {
					                                return  "未解决";
					                            } else {
					                            	return  "已解决";
					                            }
					                        } else {
					                            return null;
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
											"name" : "查看投诉详情",
											"fn" : "handleComplain.queryMessage("
													+ data.id +",'"+
													data.complainTitle +"','"+
													data.complainName +"','"+
												    data.complainContent+"','"+
												    data.strComplainDate+"','"+
												    data.handleUserName+"','"+
												    data.strHandleDate+"','"+
												    data.handleAdvice+"')",
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
	addServiceComplainInfoManage:function(){
		$("#updateServiceComplainInfo").on("click", function() {
			var sessionId = new Array();
			$(":checkbox[name='chkOne']").each(function() {
				if ($(this).prop("checked")) {
					sessionId.push($(this).val());

				}
			});
			if(sessionId.length==0){
				layer.msg('请选择！', {
					icon : 3
				});
				return 0;
			}
			if(sessionId.length>1){
				layer.msg('只能选择一个处理！', {
					icon : 2
				});
				return 0;
			}
			layer.open({
				type: 1,
	            shade: [0.4, '#000'],
	            title: "添加投诉财产信息",
	            area: ['700px', '300px'],
	            shift:'top', //从左动画弹出
	            content: $('#updateServiceComplain')
			});
		});
		
		
		$("#updateServiceComplainMessage").on("click", function() {
			var handleUserName = $("#handleUserName").val();
			var handleAdvice = $("#handleAdvice").val();
			var result = $("#result").val();
			var sessionId = new Array();
			$(":checkbox[name='chkOne']").each(function() {
				if ($(this).prop("checked")) {
					sessionId.push($(this).val());

				}
			});
			
			var sessionIds = sessionId.toString();
			
			if (formValidation($("#updateServiceComplain"))) {
					$.ajax({
				        async:true,
				        type:"POST",
				        url:'updateServiceComplain',
				         data:{
				        	 "handleUserName":handleUserName,
				        	 "handleAdvice":handleAdvice,
				        	 "result":result,
				        	 "id":sessionIds
				         }, 
				        dataType:"JSON",
				        success:function(data){
				        	layer.closeAll();
				            layer.msg('保存成功', {icon: 1,time: 2000});
				            $('#serviceComplainManageInfo').DataTable().ajax.reload(null, true);
				        }
				    });
			}
		});
	},
	// 查询楼栋详情
	queryMessage:function(id,complainTitle,complainName,complainContent,strComplainDate,handleUserName,strHandleDate,handleAdvice){
		$("#complainTitle1").val(complainTitle);
		$("#complainName1").val(complainName);
		$("#complainContent1").val(complainContent);
		$("#strComplainDate1").val(strComplainDate);
		$("#handleUserName1").val(handleUserName);
		$("#strHandleDate1").val(strHandleDate);
		$("#handleAdvice1").val(handleAdvice);
		layer.open({
			type: 1,
            shade: [0.4, '#000'],
            title: "查看服务投诉详情",
            area: ['700px', '420px'],
            shift:'top', //从左动画弹出
            content: $('#queryServiceComplain')
		});
	},
};