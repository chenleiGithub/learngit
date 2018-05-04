var goodMoneyManage = {
	init : function() {
		//select2初始化
		goodMoneyManage.select2();
		// 绑定数据
		goodMoneyManage.message();
		//添加管理员
		goodMoneyManage.addGoodMoneyMessage();
		//修改
		goodMoneyManage.updateGoodMoneyMessage();
		// 删除方法
		goodMoneyManage.deleteGoodMoneyManage();
		//全选功能
		goodMoneyManage.checkAll();
		//通过cookie值判断是否需要隐藏修改按钮
		var data = eval("(" + Cookies.get("token")+ ")");
		if(data==undefined){
	       	 location.href = "page/logOff";
	    }else{
	    	if(data.userType==0){
	    		$(":button").show();
	    	}
	    } 
	},
	
	// 全选功能
	checkAll : function() {
		$(document).on("click", ".chkAll", function(obj) {
			$("input[name='chkOne']").prop("checked", this.checked);

		});
	},
	
	updateGoodMoneyMessage:function(){
		$("#updateGoodMoneyInfo").on("click", function() {
			var sessionId = new Array();
			$(":checkbox[name='chkOne']").each(function() {
				if ($(this).prop("checked")) {
					sessionId.push($(this).val());

				}
			});
			var sessionIds = sessionId.toString();
			if (sessionIds.length != 0) {
				layer.confirm("确认修改收费状态吗", {
	                icon: 3,
	                title: '提示'
	            }, function () {
	            	$.ajax({
						url : 'updateLivingCostList',
						type : "POST",
						data : {
							"livingCostIds" : sessionIds
						},
						success : function(data) {
							$('#goodMoneyManageInfo').DataTable().ajax.reload();
							layer.msg('修改成功！', {
								icon : 1
							});
							$("input[name='chkAll']").prop("checked", false);
						},
						error : function(data) {
							layer.msg('修改成功！', {
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
		$('#goodMoneyManageInfo')
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
								url : 'queryLivingCostMessage',
								data: function ( d ) {
							        d.type = 1;
							    },
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
										"data" : "houseNumber"
									},{
										className :"table-list-align-center",
										"data" : function (data) {
					                        if (data.userName != null) {
					                            if (data.userName.length > 30) {
					                                return  '<span title="' + data.userName + '">' + data.userName.substring(0, 30) + '···</span>';
					                            } else {
					                                return '<span title="' + data.userName + '">' + data.userName+ '</span>';
					                            }
					                        } else {
					                            return data.userName;
					                        }
					                    } 
									},{
										className :"table-list-align-center",
										"data" : "strRegisterTime"
									},{
										className :"table-list-align-center",
										"data" : "allCost"
									},{
										className :"table-list-align-center",
										"data" : function (data) {
					                        if (data.payStatus != null) {
					                            if (data.payStatus==0) {
					                                return  "未付款";
					                            } else {
					                            	return  "已付款";
					                            }
					                        } else {
					                            return data.payStatus;
					                        }
					                    } 
									}],
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
	addGoodMoneyMessage:function(){
		$("#addGoodMoneyInfo").on("click", function() {
			layer.open({
				type: 1,
	            shade: [0.4, '#000'],
	            title: "添加水电费信息",
	            area: ['700px', '500px'],
	            shift:'top', //从左动画弹出
	            content: $('#addGoodMoney')
			});
		});
		
		
		$("#addGoodMoneyMessage").on("click", function() {
			var userId = $("#userName").val();
			var allCost = $("#allCost").val();
			
			if (formValidation($("#addGoodMoney"))) {
					$.ajax({
				        async:true,
				        type:"POST",
				        url:'saveLivingCost',
				         data:{
				        	 "userId":userId,
				        	 "type":'1',
				        	 "payStatus":'0',
				        	 "allCost":allCost
				         }, 
				        dataType:"JSON",
				        success:function(data){
				        	layer.closeAll();
				            layer.msg('保存成功', {icon: 1,time: 2000});
				            $('#goodMoneyManageInfo').DataTable().ajax.reload(null, true);
				        }
				    });
			}
		});
	},
	
	deleteGoodMoneyManage:function(){
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
						url : 'deletLivingCostList',
						type : "POST",
						data : {
							"livingCostIds" : sessionIds
						},
						success : function(data) {
							$('#goodMoneyManageInfo').DataTable().ajax.reload();
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