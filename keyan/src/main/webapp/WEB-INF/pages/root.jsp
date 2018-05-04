<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<tiles:insertDefinition name="defaultTemplate">
	<tiles:putAttribute name="body">
		<link rel="stylesheet" href="static/plugins/layer/skin/layer.css"
			type="text/css" />
		<link rel="stylesheet" href="static/plugins/iCheck/square/blue.css">
		<link rel="stylesheet" href="static/plugins/select2/select2.min.css">
		<script src="static/plugins/layer/layer.js"></script>
		<script src="static/plugins/select2/select2.min.js"></script>
		<script src="static/plugins/iCheck/icheck.min.js"></script>
		<script src="static/js/root.js"></script>
		<script id="tpl" type="text/x-handlebars-template">
            {{#each func}}
            <button type="button" class="btn btn-primary btn-sm" 

				onclick="{{this.fn}}">
                {{this.name}}
            </button>
            {{/each}}
        </script>
		<script type="text/javascript">
			$(function() {
				root.init();
			});
		</script>
		<style type="text/css">
			#queryUserForm input{
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
						管理用户 <small></small>
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
									<input type="button" id="addUserInfo" value="添加" class="btn btn-primary" name="add" />
										<input type="button" id="deleteList" value="删除"class="btn btn-danger" name="deleteList">
										<input type="button" id="authentication" value="通过认证"
											class="btn btn-danger" name="authentication">
									</div>
									<table id="userInfo"
										class="table table-bordered table-striped">
										<thead>
											<tr>
												<th style="width: 5%;"><input type="checkbox"
													id="chkAll" name="chkAll" class="chkAll"></th>
												<th class="table-list-align-center" style="width: 25%">登录名</th>
												<th class="table-list-align-center" style="width: 20%">用户姓名</th>
												<th class="table-list-align-center" style="width: 10%">性别</th>
												<th class="table-list-align-center" style="width: 20%">门牌号</th>
												<th class="table-list-align-center" style="width: 20%">是否认证</th>
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
		
		<form class="form-horizontal" id="addUserForm" style="margin-left: 17%;display:none">
			<input type="hidden" id="userId">
			<div class="form-group">
				<label for="locationCode" class="col-sm-3 control-label">
				<font style="color: red; font-size: 16px; font-weight: bolder;">*</font>
								&nbsp;登录名</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required chinesezimu" rangelength="2 20" id="userName" placeholder="登录名"
						name="userName">
				</div>
			</div>
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
				<font style="color: red; font-size: 16px; font-weight: bolder;">*</font>
								&nbsp;用户姓名</label>
				<div class="col-sm-8">
					<input type="text" class="form-control chinese required" id="name" name="name"
						placeholder="用户姓名">
				</div>
			</div>
			<div class="form-group">
				<label for="xingbie" class="col-sm-3 control-label">性别</label>
				<div class="col-sm-8">
					<div class="iradio_square-blue">
                        <input  type="radio" id="input-1" name="gendercode" value="0">
                    </div>
                    <label for="input-1" class="">男</label>

                    <div class="iradio_square-blue" >
                        <input  type="radio" id="input-2" name="gendercode" value="1">
                    </div>
                    <label for="input-2" class="">女</label>
                    
                    <div class="iradio_square-blue" >
                        <input  type="radio" id="input-3" name="gendercode" value="2" checked="checked" >
                    </div>
                    <label for="input-3" class="">保密</label>
                    </div>
			</div>
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
				<font style="color: red; font-size: 16px; font-weight: bolder;">*</font>
								&nbsp;门牌号</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" id="houseNumber" name="houseNumber"
						placeholder="门牌号">
				</div>
			</div>
			<div class="form-group">
				<label for="bureauAddress" class="col-sm-3 control-label">手机</label>
				<div class="col-sm-8">
					<input class="form-control mobile required" id="phone" name="phone"
						placeholder="手机" />
				</div>
			</div>
			<div class="form-group">
				<label for="bureauAddress" class="col-sm-3 control-label">身份证</label>
				<div class="col-sm-8">
					<input class="form-control identityCard required" id="cardId" name="cardId"
						placeholder="身份证" />
				</div>
			</div>
			<div class="form-group">
				<label for="bureauAddress" class="col-sm-3 control-label">楼栋</label>
				<div class="col-sm-8">
					<select id="buildIngId" class="select2" style="width: 100%;"></select>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-5 col-sm-9">
					<button type="button" id="addUser" class="btn btn-danger">保存</button>
				</div>
			</div>
		</form>
		
		
		<form class="form-horizontal" id="queryUserForm" style="margin-left: 17%;display:none">
			<input type="hidden" id="userId">
			<div class="form-group">
				<label for="locationCode" class="col-sm-3 control-label">
								&nbsp;登录名</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="userName1" name="userName1" readonly="readonly">
				</div>
			</div>
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
								&nbsp;用户姓名</label>
				<div class="col-sm-8">
					<input type="text" class="form-control chinese required" id="name1" name="name1" readonly="readonly">
				</div>
			</div>
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
								&nbsp;性别</label>
				<div class="col-sm-8">
					<input type="text" class="form-control chinese required" id="sex1" name="sex1" readonly="readonly">
				</div>
			</div>
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
								&nbsp;门牌号</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="houseNumber1" name="houseNumber1" readonly="readonly">
				</div>
			</div>
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
								&nbsp;身份证号码</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="cardId1" name="cardId1" readonly="readonly">
				</div>
			</div>
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
								&nbsp;楼栋</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="buildName1" name="buildName1" readonly="readonly">
				</div>
			</div>
			<div class="form-group">
				<label for="bureauAddress" class="col-sm-3 control-label">手机</label>
				<div class="col-sm-8">
					<input class="form-control mobile" id="phone1" name="phone1" readonly="readonly" />
				</div>
			</div>
		</form>

	</tiles:putAttribute>
</tiles:insertDefinition>
