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
         <link rel="stylesheet" href="static/plugins/select2/select2.min.css">
        <script src="static/plugins/layer/layer.js"></script>
        <script src="static/plugins/iCheck/icheck.min.js"></script>
        <script src="static/js/privateRepairHandle.js"></script>
        <script src="static/plugins/select2/select2.min.js"></script>
        <script id="tpl" type="text/x-handlebars-template">
            {{#each func}}
            <button type="button" class="btn btn-primary btn-sm" onclick="{{this.fn}}">
                {{this.name}}
            </button>
            {{/each}}
        </script>
        <script type="text/javascript">
            $(function () {
            	privateRepairHandle.init();
            });
        </script>
        <style>
        	#queryPrivateRepair input{
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
                       	业主私人财物报修处理
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
                                    	 <input type="button" id="addPrivateRepairInfo" value="处理" class="btn btn-primary" name="add" />
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
				<label for="locationCode" class="col-sm-3 control-label">
				<font style="color: red; font-size: 16px; font-weight: bolder;">*</font>
								&nbsp;维修人员</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" rangelength="2 20" id="repairUser" placeholder="维修人员"
						name="repairUser">
				</div>
			</div>
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
				<font style="color: red; font-size: 16px; font-weight: bolder;">*</font>
								&nbsp;维修费用</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required number" id="repairMoney" name="repairMoney"
						placeholder="维修费用">
				</div>
			</div>
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
				<font style="color: red; font-size: 16px; font-weight: bolder;">*</font>
								&nbsp;维修结果</label>
				<div class="col-sm-8">
					<select class="select2 required" style="width:100%" id="repairResult" name="repairResult">
						<option value="0">未处理</option>
						<option value="1">已处理</option>
					</select>
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
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
								&nbsp;维修人员</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" id="repairUser1" name="repairUser1">
				</div>
			</div>
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
								&nbsp;维修费用</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" id="repairMoney1" name="repairMoney1">
				</div>
			</div>
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
								&nbsp;维修结果</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" id="repairResult1" name="repairResult1">
				</div>
			</div>
		</form>

    </tiles:putAttribute>
</tiles:insertDefinition>
