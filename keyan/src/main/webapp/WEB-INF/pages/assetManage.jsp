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
        <script src="static/js/assetManage.js"></script>
        <script id="tpl" type="text/x-handlebars-template">
            {{#each func}}
            <button type="button" class="btn btn-primary btn-sm" onclick="{{this.fn}}">
                {{this.name}}
            </button>
            {{/each}}
        </script>
        <script type="text/javascript">
            $(function () {
            	assetManage.init();
            });
        </script>
        <style>
        	#queryAsset input{
				background:no-repeat 0 0 scroll ＃EEEEEE;
				border:none;
				outline:medium;
			}
        </style>
        <div>
            <div>
                <section class="content-header">
                    <h1>
                       	公共财产管理
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
                                    	<input type="button" id="addAssetInfo" value="添加" class="btn btn-primary" name="add" />
                                         <input type="button" id="deleteList" value="删除" class="btn btn-danger" name="deleteList">
                                    </div>
                                    <table id="assetManageInfo" class="table table-bordered table-striped">
                                        <thead>
                                        <tr>
                                        	<th style="width:5%;">
                                        		<input type="checkbox" id="chkAll" name="chkAll" class="chkAll" >
                                        	</th>
                                            <th class="table-list-align-center" style="width: 25%">财产名称</th>
                                            <th class="table-list-align-center" style="width: 15%">启用日期</th>
                                            <th class="table-list-align-center" style="width: 15%">存放位置</th>
                                            <th class="table-list-align-center" style="width: 25%">当前状态</th>
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
        
        <form class="form-horizontal" id="addAsset" style="margin-left: 17%;display:none">
			<div class="form-group">
				<label for="locationCode" class="col-sm-3 control-label">
				<font style="color: red; font-size: 16px; font-weight: bolder;">*</font>
								&nbsp;财产名称</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" rangelength="2 20" id="assetName" placeholder="财产名称"
						name="assetName">
				</div>
			</div>
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
				<font style="color: red; font-size: 16px; font-weight: bolder;">*</font>
								&nbsp;规格型号</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" id="model" name="model"
						placeholder="规格型号">
				</div>
			</div>
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
				<font style="color: red; font-size: 16px; font-weight: bolder;">*</font>
								&nbsp;所属类别</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" id="type" name="type"
						placeholder="所属类别">
				</div>
			</div>
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
				<font style="color: red; font-size: 16px; font-weight: bolder;">*</font>
								&nbsp;财产原值</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" id="value" name="value"
						placeholder="财产原值">
				</div>
			</div>
			<div class="form-group">
				<label for="bureauAddress" class="col-sm-3 control-label">
				<font style="color: red; font-size: 16px; font-weight: bolder;">*</font>存放位置</label>
				<div class="col-sm-8">
					<input class="form-control required" id="position" name="position"
						placeholder="存放位置" />
				</div>
			</div>
			<div class="form-group">
				<label for="bureauAddress" class="col-sm-3 control-label">
				<font style="color: red; font-size: 16px; font-weight: bolder;">*</font>保管人员</label>
				<div class="col-sm-8">
					<input class="form-control required" id="manager" name="manager"
						placeholder="保管人员" />
				</div>
			</div>
			<div class="form-group">
				<label for="bureauAddress" class="col-sm-3 control-label">补充说明</label>
				<div class="col-sm-8">
					<input class="form-control" id="note" name="note"
						placeholder="补充说明" />
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-5 col-sm-9">
					<button type="button" id="addAssetMessage" rangelength="2 40" class="btn btn-danger">保存</button>
				</div>
			</div>
		</form>
		
		<form class="form-horizontal" id="queryAsset" style="margin-left: 17%;display:none">
			<div class="form-group">
				<label for="locationCode" class="col-sm-3 control-label">
								&nbsp;财产名称</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" rangelength="2 20" id="assetName1"
						name="assetName1">
				</div>
			</div>
			<div class="form-group">
				<label for="locationCode" class="col-sm-3 control-label">
								&nbsp;启用日期</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" rangelength="2 20" id="strStartDate1"
						name="strStartDate1">
				</div>
			</div>
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
								&nbsp;规格型号</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" id="model1" name="model1">
				</div>
			</div>
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
								&nbsp;所属类别</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" id="type1" name="type1">
				</div>
			</div>
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
								&nbsp;财产原值</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" id="value1" name="value1">
				</div>
			</div>
			<div class="form-group">
				<label for="bureauAddress" class="col-sm-3 control-label">
				存放位置</label>
				<div class="col-sm-8">
					<input class="form-control required" id="position1" name="position1"/>
				</div>
			</div>
			<div class="form-group">
				<label for="bureauAddress" class="col-sm-3 control-label">
				保管人员</label>
				<div class="col-sm-8">
					<input class="form-control required" id="manager1" name="manager1" />
				</div>
			</div>
			<div class="form-group">
				<label for="bureauAddress" class="col-sm-3 control-label">补充说明</label>
				<div class="col-sm-8">
					<input class="form-control" id="note1" name="note1"/>
				</div>
			</div>
		</form>

    </tiles:putAttribute>
</tiles:insertDefinition>
