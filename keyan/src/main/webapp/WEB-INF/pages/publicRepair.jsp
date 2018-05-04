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
        <script src="static/js/publicRepairManage.js"></script>
        <script id="tpl" type="text/x-handlebars-template">
            {{#each func}}
            <button type="button" class="btn btn-primary btn-sm" onclick="{{this.fn}}">
                {{this.name}}
            </button>
            {{/each}}
        </script>
        <script type="text/javascript">
            $(function () {
            	publicRepairManage.init();
            });
        </script>
        <style>
        	#queryPublicRepair input{
				background:no-repeat 0 0 scroll ＃EEEEEE;
				border:none;
				outline:medium;
			}
        </style>
        <div>
            <div>
                <section class="content-header">
                    <h1>
                       	公共财物报修管理
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
                                    	 <input type="button" id="addPublicRepairInfo" value="添加" class="btn btn-primary" name="add" />
                                         <input type="button" id="deleteList" value="删除" class="btn btn-danger" name="deleteList">
                                    </div>
                                    <table id="publicRepairInfo" class="table table-bordered table-striped">
                                        <thead>
                                        <tr>
                                        	<th style="width:5%;">
                                        		<input type="checkbox" id="chkAll" name="chkAll" class="chkAll" >
                                        	</th>
                                            <th class="table-list-align-center" style="width: 25%">公共财物名称</th>
                                            <th class="table-list-align-center" style="width: 15%">报修日期</th>
                                            <th class="table-list-align-center" style="width: 15%">存放位置</th>
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
        
        <form class="form-horizontal" id="addPublicRepair" style="margin-left: 17%;display:none">
			<div class="form-group">
				<label for="locationCode" class="col-sm-3 control-label">
				<font style="color: red; font-size: 16px; font-weight: bolder;">*</font>
								&nbsp;公共财物名称</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" rangelength="2 20" id="goodsName" placeholder="公共财物名称"
						name="goodsName">
				</div>
			</div>
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
				<font style="color: red; font-size: 16px; font-weight: bolder;">*</font>
								&nbsp;存放位置</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" id="position" name="position"
						placeholder="存放位置">
				</div>
			</div>
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
				<font style="color: red; font-size: 16px; font-weight: bolder;">*</font>
								&nbsp;报修原因</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" id="reason" name="reason"
						placeholder="报修原因">
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-5 col-sm-9">
					<button type="button" id="addPublicRepairMessage" rangelength="2 40" class="btn btn-danger">保存</button>
				</div>
			</div>
		</form>
		
		<form class="form-horizontal" id="queryPublicRepair" style="margin-left: 17%;display:none">
			<div class="form-group">
				<label for="locationCode" class="col-sm-3 control-label">
				<font style="color: red; font-size: 16px; font-weight: bolder;">*</font>
								&nbsp;公共财物名称</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" rangelength="2 20" id="goodsName1"
						name="goodsName1">
				</div>
			</div>
			<div class="form-group">
				<label for="locationCode" class="col-sm-3 control-label">
				<font style="color: red; font-size: 16px; font-weight: bolder;">*</font>
								&nbsp;报修日期</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" rangelength="2 20" id="strRepairDate1"
						name="strRepairDate1">
				</div>
			</div>
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
				<font style="color: red; font-size: 16px; font-weight: bolder;">*</font>
								&nbsp;存放位置</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" id="position1" name="position1">
				</div>
			</div>
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
				<font style="color: red; font-size: 16px; font-weight: bolder;">*</font>
								&nbsp;报修人</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" id="userName1" name="userName1">
				</div>
			</div>
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
				<font style="color: red; font-size: 16px; font-weight: bolder;">*</font>
								&nbsp;报修原因</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" id="reason1" name="reason1">
				</div>
			</div>
		</form>

    </tiles:putAttribute>
</tiles:insertDefinition>
