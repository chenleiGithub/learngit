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
        <script src="static/js/serviceComplainManage.js"></script>
        <script id="tpl" type="text/x-handlebars-template">
            {{#each func}}
            <button type="button" class="btn btn-primary btn-sm" onclick="{{this.fn}}">
                {{this.name}}
            </button>
            {{/each}}
        </script>
        <script type="text/javascript">
            $(function () {
            	serviceComplain.init();
            });
        </script>
        <style>
        	#queryServiceComplain input{
				background:no-repeat 0 0 scroll ＃EEEEEE;
				border:none;
				outline:medium;
			}
        </style>
        <div>
            <div>
                <section class="content-header">
                    <h1>
                       	服务投诉管理
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
                                    	<input type="button" id="addServiceComplainInfo" value="添加" class="btn btn-primary" name="add" />
                                         <input type="button" id="deleteList" value="删除" class="btn btn-danger" name="deleteList">
                                    </div>
                                    <table id="serviceComplainManageInfo" class="table table-bordered table-striped">
                                        <thead>
                                        <tr>
                                        	<th style="width:5%;">
                                        		<input type="checkbox" id="chkAll" name="chkAll" class="chkAll" >
                                        	</th>
                                            <th class="table-list-align-center" style="width: 25%">投诉标题</th>
                                            <th class="table-list-align-center" style="width: 15%">投诉人</th>
                                            <th class="table-list-align-center" style="width: 15%">投诉日期</th>
                                            <th class="table-list-align-center" style="width: 25%">解决状态</th>
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
        
        <form class="form-horizontal" id="addServiceComplain" style="margin-left: 17%;display:none">
			<div class="form-group">
				<label for="locationCode" class="col-sm-3 control-label">
				<font style="color: red; font-size: 16px; font-weight: bolder;">*</font>
								&nbsp;投诉标题</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" rangelength="2 20" id="complainTitle" placeholder="投诉标题"
						name="complainTitle">
				</div>
			</div>
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
				<font style="color: red; font-size: 16px; font-weight: bolder;">*</font>
								&nbsp;投诉内容</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" id="complainContent" name="complainContent"
						placeholder="投诉内容">
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-5 col-sm-9">
					<button type="button" id="addServiceComplainMessage" rangelength="2 40" class="btn btn-danger">保存</button>
				</div>
			</div>
		</form>
		
		<form class="form-horizontal" id="queryServiceComplain" style="margin-left: 17%;display:none">
			<div class="form-group">
				<label for="locationCode" class="col-sm-3 control-label">
								&nbsp;投诉标题</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" id="complainTitle1"
						name="complainTitle1">
				</div>
			</div>
			<div class="form-group">
				<label for="locationCode" class="col-sm-3 control-label">
								&nbsp;投诉人</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" id="complainName1"
						name="complainName1">
				</div>
			</div>
			<div class="form-group">
				<label for="locationCode" class="col-sm-3 control-label">
								&nbsp;投诉日期</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" id="strComplainDate1"
						name="strComplainDate1">
				</div>
			</div>
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
								&nbsp;投诉内容</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" id="complainContent1" name="complainContent1"
						>
				</div>
			</div>
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
								&nbsp;处理人</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" id="handleUserName1" name="handleUserName1"
						>
				</div>
			</div>
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
								&nbsp;处理日期</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" id="strHandleDate1" name="strHandleDate1"
						>
				</div>
			</div>
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
								&nbsp;处理意见</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" id="handleAdvice1" name="handleAdvice1"
						>
				</div>
			</div>
		</form>

    </tiles:putAttribute>
</tiles:insertDefinition>
