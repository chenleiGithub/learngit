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
        <script src="static/plugins/select2/select2.min.js"></script>
        <script src="static/js/gather.js"></script>
        <script id="tpl" type="text/x-handlebars-template">
            {{#each func}}
            <button type="button" class="btn btn-primary btn-sm" onclick="{{this.fn}}">
                {{this.name}}
            </button>
            {{/each}}
        </script>
        <script type="text/javascript">
            $(function () {
            	gather.init();
            });
        </script>
        <style>
        	.select2-dropdown{
        		z-index: 999999999999999999;
        	}
        	#queryGather input{
				background:no-repeat 0 0 scroll ＃EEEEEE;
				border:none;
				outline:medium;
			}
        </style>
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
                                    	<input type="button" id="addGatherInfo" value="添加" class="btn btn-primary" name="addGather" />
                                         <input type="button" id="deleteList" value="删除" class="btn btn-danger" name="deleteList">
                                    </div>
                                    <table id="gatherManageInfo" class="table table-bordered table-striped">
                                        <thead>
                                        <tr>
                                        	<th style="width:5%;">
                                        		<input type="checkbox" id="chkAll" name="chkAll" class="chkAll" >
                                        	</th>
                                            <th class="table-list-align-center" style="width: 25%">收款编号</th>
                                            <th class="table-list-align-center" style="width: 15%">收款日期</th>
                                            <th class="table-list-align-center" style="width: 15%">付款人</th>
                                            <th class="table-list-align-center" style="width: 25%">付款方式</th>
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
        
        <form class="form-horizontal" id="addGather" style="margin-left: 17%;display:none">
			<div class="form-group">
				<label for="locationCode" class="col-sm-3 control-label">
				<font style="color: red; font-size: 16px; font-weight: bolder;">*</font>
								&nbsp;收款编号</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" rangelength="2 20" id="gatheringCode" placeholder="收款编号"
						name="gatheringCode">
				</div>
			</div>
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
				<font style="color: red; font-size: 16px; font-weight: bolder;">*</font>
								&nbsp;收款金额</label>
				<div class="col-sm-8">
					<input type="text" class="form-control number required" id="gatheringMoney" name="gatheringMoney"
						placeholder="收款金额">
				</div>
			</div>
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
				<font style="color: red; font-size: 16px; font-weight: bolder;">*</font>
								&nbsp;收款方式</label>
				<div class="col-sm-8">
					<select class="select2 required" style="position: absolute;top: 11px;width: 92.5%;" id="gatheringStyle" name="gatheringStyle">
						<option value="0">现金</option>
						<option value="1">转账</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
				<font style="color: red; font-size: 16px; font-weight: bolder;">*</font>
								&nbsp;收款人员</label>
				<div class="col-sm-8">
					<select class="select2 required" style="width: 100%;" id="paymentUserId" name="paymentUserId">
					</select>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-5 col-sm-9">
					<button type="button" id="addGatherMessage" rangelength="2 40" class="btn btn-danger">保存</button>
				</div>
			</div>
		</form>
		
		<form class="form-horizontal" id="queryGather" style="margin-left: 17%;display:none">
			<div class="form-group">
				<label for="locationCode" class="col-sm-3 control-label">
								&nbsp;收款编号</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" id="gatheringCode1"
						name="gatheringCode1">
				</div>
			</div>
			<div class="form-group">
				<label for="locationCode" class="col-sm-3 control-label">
								&nbsp;收款日期</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" id="strGatheringDate1"
						name="strGatheringDate1">
				</div>
			</div>
			<div class="form-group">
				<label for="locationCode" class="col-sm-3 control-label">
								&nbsp;付款人姓名</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" id="paymentUserName1"
						name="paymentUserName1">
				</div>
			</div>
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
								&nbsp;付款金额</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" id="gatheringMoney1" name="gatheringMoney1"
						>
				</div>
			</div>
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
								&nbsp;付款方式</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" id="gatheringStyle1" name="gatheringStyle1"
						>
				</div>
			</div>
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
								&nbsp;收款人姓名</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" id="gatheringUserName1" name="gatheringUserName1"
						>
				</div>
			</div>
		</form>

    </tiles:putAttribute>
</tiles:insertDefinition>
