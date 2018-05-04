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
        <script src="static/js/buildManage.js"></script>
        <script id="tpl" type="text/x-handlebars-template">
            {{#each func}}
            <button type="button" class="btn btn-primary btn-sm" onclick="{{this.fn}}">
                {{this.name}}
            </button>
            {{/each}}
        </script>
        <script type="text/javascript">
            $(function () {
            	buildManage.init();
            });
        </script>
        <div>
            <div>
                <section class="content-header">
                    <h1>
                       	 楼栋管理
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
                                    	<input type="button" id="addBuildInfo" value="添加" class="btn btn-primary" name="add" />
                                         <input type="button" id="deleteList" value="删除" class="btn btn-danger" name="deleteList">
                                    </div>
                                    <table id="buildManageInfo" class="table table-bordered table-striped">
                                        <thead>
                                        <tr>
                                        	<th style="width:5%;">
                                        		<input type="checkbox" id="chkAll" name="chkAll" class="chkAll" >
                                        	</th>
                                            <th class="table-list-align-center" style="width: 25%">楼栋名称</th>
                                            <th class="table-list-align-center" style="width: 15%">住宅户数</th>
                                            <th class="table-list-align-center" style="width: 15%">商用户数</th>
                                            <th class="table-list-align-center" style="width: 25%">管理楼长</th>
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
        
        <form class="form-horizontal" id="addBuild" style="margin-left: 17%;display:none">
			<input type="hidden" id="userId">
			<div class="form-group">
				<label for="locationCode" class="col-sm-3 control-label">
				<font style="color: red; font-size: 16px; font-weight: bolder;">*</font>
								&nbsp;楼栋名称</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" rangelength="2 20" id="buildName" placeholder="楼栋名称"
						name="buildName">
				</div>
			</div>
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
				<font style="color: red; font-size: 16px; font-weight: bolder;">*</font>
								&nbsp;住宅户数</label>
				<div class="col-sm-8">
					<input type="text" class="form-control number required" id="total" name="total"
						placeholder="住宅户数">
				</div>
			</div>
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
				<font style="color: red; font-size: 16px; font-weight: bolder;">*</font>
								&nbsp;商用户数</label>
				<div class="col-sm-8">
					<input type="text" class="form-control number required" id="buCount" name="buCount"
						placeholder="商用户数">
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
				<label for="bureauAddress" class="col-sm-3 control-label">手机</label>
				<div class="col-sm-8">
					<input class="form-control mobile" id="phone" name="phone"
						placeholder="手机" />
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
					<button type="button" id="addBuildMessage" rangelength="2 40" class="btn btn-danger">保存</button>
				</div>
			</div>
		</form>
		
		<form class="form-horizontal" id="queryBuild" style="margin-left: 17%;display:none">
			<div class="form-group">
				<label for="locationCode" class="col-sm-3 control-label">
								&nbsp;楼栋名称</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" rangelength="2 20" id="buildName1" placeholder="楼栋名称"
						name="buildName">
				</div>
			</div>
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
								&nbsp;住宅户数</label>
				<div class="col-sm-8">
					<input type="text" class="form-control number required" id="total1" name="total1"
						placeholder="住宅户数">
				</div>
			</div>
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
								&nbsp;商用户数</label>
				<div class="col-sm-8">
					<input type="text" class="form-control number required" id="buCount1" name="buCount1"
						placeholder="商用户数">
				</div>
			</div>
			<div class="form-group">
				<label for="bureauName" class="col-sm-3 control-label">
								&nbsp;管理楼长</label>
				<div class="col-sm-8">
					<input type="text" class="form-control required" id="manager1" name="manager1"
						placeholder="管理楼长">
				</div>
			</div>
			<div class="form-group">
				<label for="bureauAddress" class="col-sm-3 control-label">手机</label>
				<div class="col-sm-8">
					<input class="form-control mobile" id="phone1" name="phone1"
						placeholder="手机" />
				</div>
			</div>
			<div class="form-group">
				<label for="bureauAddress" class="col-sm-3 control-label">补充说明</label>
				<div class="col-sm-8">
					<input class="form-control" id="note1" name="note1"
						placeholder="补充说明" />
				</div>
			</div>
		</form>

    </tiles:putAttribute>
</tiles:insertDefinition>
