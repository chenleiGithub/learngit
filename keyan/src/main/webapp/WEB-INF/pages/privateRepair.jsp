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
        <script src="static/plugins/layer/layer.js"></script>
        <script src="static/plugins/iCheck/icheck.min.js"></script>
        <script src="static/js/privateRepairManage.js"></script>
        <script id="tpl" type="text/x-handlebars-template">
            {{#each func}}
            <button type="button" class="btn btn-primary btn-sm" onclick="{{this.fn}}">
                {{this.name}}
            </button>
            {{/each}}
        </script>
        <script type="text/javascript">
            $(function () {
            	privateRepairManage.init();
            });
        </script>
        <style>
        	#queryPrivateRepair input{
				background:no-repeat 0 0 scroll ＃EEEEEE;
				border:none;
				outline:medium;
			}
        </style>
        <div>
            <div>
                <section class="content-header">
                    <h1>
                       	业主私人财物报修管理
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
                                    	 <input type="button" id="addPrivateRepairInfo" value="添加" class="btn btn-primary" name="add" />
                                         <input type="button" id="deleteList" value="删除" class="btn btn-danger" name="deleteList">
                                    </div>
                                    <table id="privateRepairInfo" class="table table-bordered table-striped">
                                        <thead>
                                        <tr>
                                        	<th style="width:5%;">
                                        		<input type="checkbox" id="chkAll" name="chkAll" class="chkAll" >
                                        	</th>
                                            <th class="table-list-align-center" style="width: 25%">楼栋名称</th>
                                            <th class="table-list-align-center" style="width: 15%">报修日期</th>
                                            <th class="table-list-align-center" style="width: 15%">门牌号</th>
                                            <th class="table-list-align-center" style="width: 15%">业主姓名</th>
                                            <th class="table-list-align-center" style="width: 10%">处理结果</th>
                                            <th class="table-list-align-center" style="width: 20%">操作</th>
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
        
        <form class="form-horizontal" id="addPrivateRepair" style="margin-left: 17%;display:none">
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
								&nbsp;报修内容</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" id="reason" name="reason"
						placeholder="报修内容">
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-5 col-sm-9">
					<button type="button" id="addPrivateRepairMessage" rangelength="2 40" class="btn btn-danger">保存</button>
				</div>
			</div>
		</form>
		
		<form class="form-horizontal" id="queryPrivateRepair" style="margin-left: 17%;display:none">
			<div class="form-group">
				<label for="locationCode" class="col-sm-3 control-label">
								&nbsp;楼栋名称</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" rangelength="2 20" id="buildName1"
						name="assetName1">
				</div>
			</div>
			<div class="form-group">
				<label for="locationCode" class="col-sm-3 control-label">
								&nbsp;报修日期</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" rangelength="2 20" id="strRepairDate1"
						name="strRepairDate1">
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
								&nbsp;报修人</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" id="userName1" name="userName1">
				</div>
			</div>
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
								&nbsp;报修内容</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" id="reason1" name="reason1">
				</div>
			</div>
		</form>

    </tiles:putAttribute>
</tiles:insertDefinition>
