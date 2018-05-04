var gather = {
	init : function() {
		//select2初始化
		gather.select2();
		// 绑定数据
		gather.message();
		//添加管理员
		gather.addaddGatherInfo();
		// 删除方法
		gather.deleteSession();
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
	
	//select2初始化
	select2:function(){
		$("#paymentUserId").select2({
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
		$('#gatherManageInfo')
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
								url : 'queryGatheringMessage',
								data: function ( d ) {
								    d.gatheringReason = 0;

								}
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
										"data" : "gatheringCode"
									}, {
										className :"table-list-align-center",
										"data" : function (data) {
					                        if (data.strGatheringDate != null) {
					                            if (data.strGatheringDate.length > 20) {
					                                return  '<span title="' + data.strGatheringDate + '">' + data.strGatheringDate.substring(0, 20) + '···</span>';
					                            } else {
					                                return '<span title="' + data.strGatheringDate + '">' + data.strGatheringDate+ '</span>';
					                            }
					                        } else {
					                            return data.strGatheringDate;
					                        }
					                    } 
									},{
										className :"table-list-align-center",
										"data" : "paymentUserName"
									},{
										className :"table-list-align-center",
										"data" : function (data) {
					                        if (data.gatheringStyle != null) {
					                            if (data.gatheringStyle==0) {
					                                return  "现金";
					                            } else {
					                            	return  "转账";
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
											"name" : "查看迁出信息详情",
											"fn" : "gather.queryMessage("
													+ data.id +",'"+
													data.gatheringCode +"','"+
													data.strGatheringDate +"','"+
													data.paymentUserName +"',"+
												    data.gatheringMoney+","+
												    data.gatheringStyle+",'"+
												    data.gatheringUserName+"')",
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
	addaddGatherInfo:function(){
		$("#addGatherInfo").on("click", function() {
			layer.open({
				type: 1,
	            shade: [0.4, '#000'],
	            title: "添加楼栋信息",
	            area: ['700px', '500px'],
	            shift:'top', //从左动画弹出
	            content: $('#addGather')
			});
		});
		
		$("#addGatherMessage").on("click", function() {
			var gatheringCode = $("#gatheringCode").val();
			var gatheringMoney = $("#gatheringMoney").val();
			var gatheringStyle = $("#gatheringStyle").val();
			var paymentUserId = $("#paymentUserId").val();
			
			if (formValidation($("#addGather"))) {
					$.ajax({
				        async:true,
				        type:"POST",
				        url:'saveGathering',
				         data:{
				        	 "gatheringCode":gatheringCode,
				        	 "gatheringMoney":gatheringMoney,
				        	 "gatheringStyle":gatheringStyle,
				        	 "paymentUserId":paymentUserId,
				        	 "gatheringReason":0,
				         }, 
				        dataType:"JSON",
				        success:function(data){
				        	layer.closeAll();
				            layer.msg('保存成功', {icon: 1,time: 2000});
				            $('#gatherManageInfo').DataTable().ajax.reload(null, true);
				        }
				    });
			}
		});
	},
	
	// 查询楼栋详情
	queryMessage:function(id,gatheringCode,strGatheringDate,paymentUserName,gatheringMoney,gatheringStyle,gatheringUserName){
		$("#gatheringCode1").val(gatheringCode);
		$("#strGatheringDate1").val(strGatheringDate);
		$("#paymentUserName1").val(paymentUserName);
		$("#gatheringMoney1").val(gatheringMoney);
		if(gatheringStyle==0){
			$("#gatheringStyle1").val("现金");
		}else{
			$("#gatheringStyle1").val("转账");
		}
		$("#gatheringUserName1").val(gatheringUserName);
		layer.open({
			type: 1,
            shade: [0.4, '#000'],
            title: "查看水电费详情",
            area: ['600px', '400px'],
            shift:'top', //从左动画弹出
            content: $('#queryGather')
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
						url : 'deletGatheringList',
						type : "POST",
						data : {
							"gatheringList" : sessionIds
						},
						success : function(data) {
							$('#gatherManageInfo').DataTable().ajax.reload();
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