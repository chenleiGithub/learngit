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
        <script src="static/js/emergencyManage.js"></script>
        <script id="tpl" type="text/x-handlebars-template">
            {{#each func}}
            <button type="button" class="btn btn-primary btn-sm" onclick="{{this.fn}}">
                {{this.name}}
            </button>
            {{/each}}
        </script>
        <script type="text/javascript">
            $(function () {
            	emergencyManage.init();
            });
        </script>
        <style>
        	#queryEmergency input{
				background:no-repeat 0 0 scroll ＃EEEEEE;
				border:none;
				outline:medium;
			}
        </style>
        <div>
            <div>
                <section class="content-header">
                    <h1>
                       	突发事件管理
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
                                    	<input type="button" id="addEmergencyInfo" value="添加" class="btn btn-primary" name="add" />
                                         <input type="button" id="deleteList" value="删除" class="btn btn-danger" name="deleteList">
                                    </div>
                                    <table id="emergencyManageInfo" class="table table-bordered table-striped">
                                        <thead>
                                        <tr>
                                        	<th style="width:5%;">
                                        		<input type="checkbox" id="chkAll" name="chkAll" class="chkAll" >
                                        	</th>
                                            <th class="table-list-align-center" style="width: 25%">事件编号</th>
                                            <th class="table-list-align-center" style="width: 15%">事件主题</th>
                                            <th class="table-list-align-center" style="width: 15%">处理人员</th>
                                            <th class="table-list-align-center" style="width: 25%">处理结果</th>
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
        
        <form class="form-horizontal" id="addEmergency" style="margin-left: 17%;display:none">
			<div class="form-group">
				<label for="locationCode" class="col-sm-3 control-label">
				<font style="color: red; font-size: 16px; font-weight: bolder;">*</font>
								&nbsp;事件编号</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" rangelength="2 20" id="eventCode" placeholder="事件编号"
						name="eventCode">
				</div>
			</div>
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
				<font style="color: red; font-size: 16px; font-weight: bolder;">*</font>
								&nbsp;事件主题</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" id="eventTheme" name="eventTheme"
						placeholder="事件主题">
				</div>
			</div>
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
				<font style="color: red; font-size: 16px; font-weight: bolder;">*</font>
								&nbsp;处理人员</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" id="handUser" name="handUser"
						placeholder="处理人员">
				</div>
			</div>
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
				<font style="color: red; font-size: 16px; font-weight: bolder;">*</font>
								&nbsp;事件内容</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" id="eventContent" name="eventContent"
						placeholder="事件内容">
				</div>
			</div>
			<div class="form-group">
				<label for="bureauAddress" class="col-sm-3 control-label">
				<font style="color: red; font-size: 16px; font-weight: bolder;">*</font>处理结果</label>
				<div class="col-sm-8">
					<input class="form-control required" id="result" name="result"
						placeholder="处理结果" />
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-5 col-sm-9">
					<button type="button" id="addEmergencyMessage" rangelength="2 40" class="btn btn-danger">保存</button>
				</div>
			</div>
		</form>
		
		<form class="form-horizontal" id="queryEmergency" style="margin-left: 17%;display:none">
			<div class="form-group">
				<label for="locationCode" class="col-sm-3 control-label">
				<font style="color: red; font-size: 16px; font-weight: bolder;">*</font>
								&nbsp;事件编号</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" rangelength="2 20" id="eventCode1"
						name="eventCode1">
				</div>
			</div>
			<div class="form-group">
				<label for="locationCode" class="col-sm-3 control-label">
				<font style="color: red; font-size: 16px; font-weight: bolder;">*</font>
								&nbsp;事件主题</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" rangelength="2 20" id="eventTheme1"
						name="eventTheme1">
				</div>
			</div>
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
				<font style="color: red; font-size: 16px; font-weight: bolder;">*</font>
								&nbsp;处理人员</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" id="handUser1" name="handUser1">
				</div>
			</div>
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
				<font style="color: red; font-size: 16px; font-weight: bolder;">*</font>
								&nbsp;处理结果</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" id="result1" name="result1">
				</div>
			</div>
		</form>

    </tiles:putAttribute>
</tiles:insertDefinition>
