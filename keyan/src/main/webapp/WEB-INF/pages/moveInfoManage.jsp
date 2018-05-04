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
        <link rel="stylesheet" href="static/plugins/select2/select2.min.css" type="text/css">
        <script src="static/plugins/layer/layer.js"></script>
        <script src="static/plugins/select2/select2.min.js"></script>
        <script src="static/js/moveInfoManage.js"></script>
        <script id="tpl" type="text/x-handlebars-template">
            {{#each func}}
            <button type="button" class="btn btn-primary btn-sm" onclick="{{this.fn}}">
                {{this.name}}
            </button>
            {{/each}}
        </script>
        <script type="text/javascript">
            $(function () {
            	moveInfoManage.init();
            });
        </script>
        <style>
        	.select2-dropdown{
        		z-index: 999999999999999999;
        	}
        	#queryMoveInfo input{
				background:no-repeat 0 0 scroll ＃EEEEEE;
				border:none;
				outline:medium;
			}
        </style>
        <div>
            <div>
                <section class="content-header">
                    <h1>
                       	 业主迁出信息管理
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
                                    	<input type="button" id="addMoveInfo" value="添加" class="btn btn-primary" name="add" />
                                         <input type="button" id="deleteList" value="删除" class="btn btn-danger" name="deleteList">
                                    </div>
                                    <table id="moveManageInfo" class="table table-bordered table-striped">
                                        <thead>
                                        <tr>
                                        	<th style="width:5%;">
                                        		<input type="checkbox" id="chkAll" name="chkAll" class="chkAll" >
                                        	</th>
                                        	<th class="table-list-align-center" style="width: 15%">用户姓名</th>
                                            <th class="table-list-align-center" style="width: 25%">迁移日期</th>
                                            <th class="table-list-align-center" style="width: 20%">管理楼长</th>
                                            <th class="table-list-align-center" style="width: 20%">联系电话</th>
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
        
        <form class="form-horizontal" id="addMove" style="margin-left: 17%;display:none">
        	<div class="form-group">
				<label for="locationCode" class="col-sm-3 control-label">
				<font style="color: red; font-size: 16px; font-weight: bolder;">*</font>
								&nbsp;迁移人员</label>
				<div class="col-sm-8">
					<select class="select2 required" style="width:100%" id="userName" name="userName">
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="locationCode" class="col-sm-3 control-label">
				<font style="color: red; font-size: 16px; font-weight: bolder;">*</font>
								&nbsp;迁移原因</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" rangelength="2 20" id="moveReason" placeholder="迁移原因"
						name="moveReason">
				</div>
			</div>
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
				<font style="color: red; font-size: 16px; font-weight: bolder;">*</font>
								&nbsp;管理楼长</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" id="manager" name="manager"
						placeholder="管理楼长">
				</div>
			</div>
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
				<font style="color: red; font-size: 16px; font-weight: bolder;">*</font>
								&nbsp;联系电话</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" id="phone" name="phone"
						placeholder="联系电话">
				</div>
			</div>
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
				<font style="color: red; font-size: 16px; font-weight: bolder;">*</font>
								&nbsp;补充说明</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" id="note" name="note"
						placeholder="补充说明">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-5 col-sm-9">
					<button type="button" id="addMoveMessage" rangelength="2 40" class="btn btn-danger">保存</button>
				</div>
			</div>
		</form>
		
		<form class="form-horizontal" id="queryMoveInfo" style="margin-left: 17%;display:none">
			<div class="form-group">
				<label for="locationCode" class="col-sm-3 control-label">
								&nbsp;迁移人员</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" id="userName1" readonly="readonly"
						name="userName1">
				</div>
			</div>
			<div class="form-group">
				<label for="locationCode" class="col-sm-3 control-label">
								&nbsp;迁移时间</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" rangelength="2 20" id="strMoveDate1" readonly="readonly"
						name="strMoveDate1">
				</div>
			</div>
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
								&nbsp;管理楼长</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" id="manager1" name="manager1" readonly="readonly">
				</div>
			</div>
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
								&nbsp;联系电话</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" id="phone1" name="phone1" readonly="readonly">
				</div>
			</div>
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
								&nbsp;补充说明</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" id="note1" name="note1" readonly="readonly">
				</div>
			</div>
		</form>

    </tiles:putAttribute>
</tiles:insertDefinition>
