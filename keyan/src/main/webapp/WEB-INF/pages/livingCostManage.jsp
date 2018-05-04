<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%
    String basePath =
            request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
                    + request.getContextPath() + "/";
%>
<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">
        <link rel="stylesheet" href="static/plugins/layer/skin/layer.css"
              type="text/css"/>
         <link rel="stylesheet" href="static/plugins/iCheck/square/blue.css">
         <link rel="stylesheet" href="static/plugins/select2/select2.min.css" type="text/css">
        <script src="static/plugins/layer/layer.js"></script>
        <script src="static/plugins/select2/select2.min.js"></script>
        <script src="static/plugins/iCheck/icheck.min.js"></script>
        <script src="static/js/livingCostManage.js"></script>
        <script id="tpl" type="text/x-handlebars-template">
            {{#each func}}
            <button type="button" class="btn btn-primary btn-sm" onclick="{{this.fn}}">
                {{this.name}}
            </button>
            {{/each}}
        </script>
        <script type="text/javascript">
            $(function () {
            	livingCostManage.init();
            });
        </script>
        <style>
        	#queryLiving input{
				background:no-repeat 0 0 scroll ＃EEEEEE;
				border:none;
				outline:medium;
			}
			.select2-dropdown{
        		z-index: 999999999999999999;
        	}
        </style>
        <div>
            <div>
                <section class="content-header">
                    <h1>
                       	水电费管理
                        <small></small>
                    </h1>
                </section>
                <section class="content">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="box">
                            <div class="box-header">
                                    <h3 class="box-title"></h3>
                                </div>
                                <div class="box-body">
                                    <div>
                                    	 <input type="button" id="addLivingInfo" value="添加" style="display:none" class="btn btn-primary" name="add" />
                                    	 <input type="button" id="updateLivingInfo" value="修改付款状态" style="display:none" class="btn btn-primary" name="update" />
                                         <input type="button" id="deleteList" value="删除" style="display:none" class="btn btn-danger" name="deleteList">
                                    </div>
                                    <table id="livingCostManageInfo" class="table table-bordered table-striped">
                                        <thead>
                                        <tr>
                                        	<th style="width:5%;">
                                        		<input type="checkbox" id="chkAll" name="chkAll" class="chkAll" >
                                        	</th>
                                            <th class="table-list-align-center" style="width: 25%">楼栋名称</th>
                                            <th class="table-list-align-center" style="width: 15%">门牌号</th>
                                            <th class="table-list-align-center" style="width: 15%">用户姓名</th>
                                            <th class="table-list-align-center" style="width: 20%">总费用</th>
                                            <th class="table-list-align-center" style="width: 10%">缴费状态</th>
                                            <th class="table-list-align-center" style="width: 15%">操作</th>
                                        </tr>
                                        </thead>
                                        <tbody></tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
        
        <form class="form-horizontal" id="addLivingCost" style="margin-left: 17%;display:none">
			<div class="form-group">
				<label for="locationCode" class="col-sm-3 control-label">
				<font style="color: red; font-size: 16px; font-weight: bolder;">*</font>
								&nbsp;业主姓名</label>
				<div class="col-sm-8">
					<select class="select2 required" style="width:100%" id="userName" name="userName">
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
				<font style="color: red; font-size: 16px; font-weight: bolder;">*</font>
								&nbsp;水费</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required number" id="waterCost" name="waterCost"
						placeholder="水费">
				</div>
			</div>
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
				<font style="color: red; font-size: 16px; font-weight: bolder;">*</font>
								&nbsp;电费</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required number" id="powerCost" name="powerCost"
						placeholder="电费">
				</div>
			</div>
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
				<font style="color: red; font-size: 16px; font-weight: bolder;">*</font>
								&nbsp;气费</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required number" id="gasCost" name="gasCost"
						placeholder="财产原值">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-5 col-sm-9">
					<button type="button" id="addLivingMessage" rangelength="2 40" class="btn btn-danger">保存</button>
				</div>
			</div>
		</form>
		
		<form class="form-horizontal" id="queryLiving" style="margin-left: 17%;display:none">
			<div class="form-group">
				<label for="locationCode" class="col-sm-3 control-label">
								&nbsp;业主姓名</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" rangelength="2 20" id="userName1"
						name="userName1">
				</div>
			</div>
			<div class="form-group">
				<label for="locationCode" class="col-sm-3 control-label">
								&nbsp;楼栋名称</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" rangelength="2 20" id="buildName1"
						name="buildName1">
				</div>
			</div>
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
								&nbsp;门牌号</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" id="houseNumber1" name="houseNumber1">
				</div>
			</div>
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
								&nbsp;水费</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" id="waterCost1" name="waterCost1">
				</div>
			</div>
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
								&nbsp;电费</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" id="powerCost1" name="powerCost1">
				</div>
			</div>
			<div class="form-group">
				<label for="bureauAddress" class="col-sm-3 control-label">
				气费</label>
				<div class="col-sm-8">
					<input class="form-control required" id="gasCost1" name="gasCost1"/>
				</div>
			</div>
			<div class="form-group">
				<label for="bureauAddress" class="col-sm-3 control-label">
				总费用</label>
				<div class="col-sm-8">
					<input class="form-control required" id="allCost1" name="allCost1" />
				</div>
			</div>
			<div class="form-group">
				<label for="bureauAddress" class="col-sm-3 control-label">付款状态</label>
				<div class="col-sm-8">
					<input class="form-control" id="payStatus1" name="payStatus1"/>
				</div>
			</div>
		</form>

    </tiles:putAttribute>
</tiles:insertDefinition>
