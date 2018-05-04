var assetManage = {
	init : function() {
		// 绑定数据
		assetManage.message();
		//添加管理员
		assetManage.addAssetManage();
		// 删除方法
		assetManage.deleteAssetManage();
		//全选功能
		assetManage.checkAll();
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
		$('#assetManageInfo')
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
								url : 'queryAssetMessage',
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
					                        if (data.assetName != null) {
					                            if (data.assetName.length > 20) {
					                                return  '<span title="' + data.assetName + '">' + data.assetName.substring(0, 20) + '···</span>';
					                            } else {
					                                return '<span title="' + data.assetName + '">' + data.assetName+ '</span>';
					                            }
					                        } else {
					                            return data.assetName;
					                        }
					                    } 
									},{
										className :"table-list-align-center",
										"data" : "strStartDate"
									},{
										className :"table-list-align-center",
										"data" : function (data) {
					                        if (data.position != null) {
					                            if (data.position.length > 30) {
					                                return  '<span title="' + data.position + '">' + data.position.substring(0, 30) + '···</span>';
					                            } else {
					                                return '<span title="' + data.position + '">' + data.position+ '</span>';
					                            }
					                        } else {
					                            return data.position;
					                        }
					                    } 
									},{
										className :"table-list-align-center",
										"data" : function (data) {
					                        if (data.status != null) {
					                            if (data.status==0) {
					                                return  "有效";
					                            } else {
					                            	return  "无效";
					                            }
					                        } else {
					                            return data.position;
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
											"name" : "查看公共财产详情",
											"fn" : "assetManage.queryMessage("
													+ data.id +",'"+
													data.assetName +"','"+
													data.model +"','"+
												    data.type+"','"+
												    data.value+"','"+
												    data.strStartDate+"','"+
												    data.position+"','"+
												    data.manager+"','"+
												    data.note+"')",
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
	addAssetManage:function(){
		$("#addAssetInfo").on("click", function() {
			layer.open({
				type: 1,
	            shade: [0.4, '#000'],
	            title: "添加公共财产信息",
	            area: ['700px', '500px'],
	            shift:'top', //从左动画弹出
	            content: $('#addAsset')
			});
		});
		
		
		$("#addAssetMessage").on("click", function() {
			var assetName = $("#assetName").val();
			var model = $("#model").val();
			var type = $("#type").val();
			var value = $("#value").val();
			var position = $("#position").val();
			var manager = $("#manager").val();
			var note = $("#note").val();
			
			if (formValidation($("#addAsset"))) {
					$.ajax({
				        async:true,
				        type:"POST",
				        url:'saveAsset',
				         data:{
				        	 "assetName":assetName,
				        	 "model":model,
				        	 "type":type,
				        	 "value":value,
				        	 "position":position,
				        	 "manager":manager,
				        	 "note":note,
				        	 "status":0
				         }, 
				        dataType:"JSON",
				        success:function(data){
				        	layer.closeAll();
				            layer.msg('保存成功', {icon: 1,time: 2000});
				            $('#assetManageInfo').DataTable().ajax.reload(null, true);
				        }
				    });
			}
		});
	},
	
	// 查询楼栋详情
	queryMessage:function(id,assetName,model,type,value,strStartDate,position,manager,note){
		$("#assetName1").val(assetName);
		$("#model1").val(model);
		$("#type1").val(type);
		$("#value1").val(value);
		$("#strStartDate1").val(strStartDate);
		$("#position1").val(position);
		$("#manager1").val(manager);
		$("#note1").val(note);
		layer.open({
			type: 1,
            shade: [0.4, '#000'],
            title: "查看公共财产详情",
            area: ['700px', '500px'],
            shift:'top', //从左动画弹出
            content: $('#queryAsset')
		});
	},
	
	deleteAssetManage:function(){
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
						url : 'deletAssetDeList',
						type : "POST",
						data : {
							"assetIds" : sessionIds
						},
						success : function(data) {
							$('#assetManageInfo').DataTable().ajax.reload();
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