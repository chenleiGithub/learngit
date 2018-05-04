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
        <script src="static/js/disApprove.js"></script>
        <script id="tpl" type="text/x-handlebars-template">
            {{#each func}}
            <button type="button" class="btn btn-primary btn-sm" onclick="{{this.fn}}">
                {{this.name}}
            </button>
            {{/each}}
        </script>
        <script type="text/javascript">
            $(function () {
            	disApprove.init();
            });
        </script>
        <div>
            <div>
                <section class="content-header">
                    <h1>
                       	 审核未通过的项目
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
                                         <input type="button" id="deleteList" value="删除"
                                       class="btn btn-danger" name="deleteList">
                                        <input type="button" id="approve" value="审核通过"
                                       class="btn btn-danger" name="deleteList">
                                        <input type="button" id="updateProject" value="修改项目"
                                       class="btn btn-danger" name="updateProject">
                                    </div>
                                    <table id="projectInfo" class="table table-bordered table-striped">
                                        <thead>
                                        <tr>
                                        	<th style="width:5%;">
                                        		<input type="checkbox" id="chkAll" name="chkAll" class="chkAll" >
                                        	</th>
                                            <th class="table-list-align-center" style="width: 15%">项目类型</th>
                                            <th class="table-list-align-center" style="width: 30%">项目名称</th>
                                            <th class="table-list-align-center" style="width: 15%">项目申请人</th>
                                            <th class="table-list-align-center" style="width: 20%">截止日期</th>
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

    </tiles:putAttribute>
</tiles:insertDefinition>
