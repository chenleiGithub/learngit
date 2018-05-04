<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%
    String basePath =
            request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
                    + request.getContextPath() + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<base href="<%=basePath%>">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>小区物业管理系统</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
          name="viewport">
    <link rel="stylesheet" href="static/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="static/plugins/dist/css/font-awesome-4.4.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="static/plugins/dist/css/ionicons/ionicons.min.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="static/plugins/dataTables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="static/css/infant.css">
    <link rel="stylesheet" href="static/plugins/dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="static/plugins/dist/css/skins/skin-blue-light.min.css">
    <link rel="stylesheet" href="static/plugins/iCheck/square/blue.css">
    <!-- REQUIRED JS SCRIPTS -->
    <script src="static/plugins/jQuery/jQuery-2.1.4.min.js" type="text/javascript"></script>
    <!-- Bootstrap 3.3.5 -->
    <script src="static/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- DataTables -->
    <script src="static/plugins/dataTables/jquery.dataTables.min.js"
            type="text/javascript"></script>
    <script src="static/plugins/dataTables/dataTables.bootstrap.js" type="text/javascript"></script>
    <script src="static/plugins/dataTables/dataTables.bootstrap.min.js"
            type="text/javascript"></script>
    <script src="static/plugins/dataTables/handlebars-1.0.0.beta.6.js"
            type="text/javascript"></script>
    <!-- SlimScroll -->
    <script src="static/plugins/slimScroll/jquery.slimscroll.min.js"
            type="text/javascript"></script>
    <!-- AdminLTE App -->
    <script src="static/plugins/dist/js/app.min.js" type="text/javascript"></script>
    <!--[if lt IE 9]>
    <script src="static/plugins/iePlugins/html5shiv.min.js"></script>
    <script src="static/plugins/iePlugins/respond.min.js"></script>
    <![endif]-->
    <script src="static/plugins/iCheck/icheck.min.js" type="text/javascript"></script>
    <script src="static/plugins/validate/jquery.validate.js" type="text/javascript"></script>
    <script src="static/plugins/validate/jquery.validate.extend.js" type="text/javascript"></script>
    <script type="text/javascript" src="static/plugins/js-cookie/js.cookie-2.1.0.min.js"></script>
    <script type="text/javascript" src="static/js/common/base.js"></script>
</head>
<body class="hold-transition skin-blue-light sidebar-mini">
<div class="wrapper">
    <tiles:insertAttribute name="main-header"/>
    <tiles:insertAttribute name="main-sidebar"/>
    <div class="content-wrapper">
        <tiles:insertAttribute name="body"/>
    </div>
</div>

<script type="text/javascript">
        $("#logOff").on("click", function() {
        	Cookies.set('token', undefined,{path:'/',domain:"localhost"});
        });
        if(Cookies.get("token")==undefined){
        	location.href = "page/logOff";
       } 
        if(Cookies.get("token") && Cookies.get("token")!="undefined") {
    		var data = eval("(" + Cookies.get("token")+ ")");
    		if (data && data!="undefined") {
    			var userImg;
    	            
    	                    if (data.photourl == null) {
    	                    	userImg = "http://localhost:8888/keyan/static/images/uploadImages/userLogo/defaultPhoto/30x30.jpg";
    	                    } else {
    	                    	userImg = "http://localhost:8888/keyan/static/images/uploadImages/userLogo/"+data.userId + "/180x180" + data.photoUrl;
    	                    }
    	               
    	            			if (data.name && "" != data.name) {
    	    		    			$(".hidden-xs:first").append(data.name);
    	    		    		} else if (data.nickName && "" != data.nickName) {
    	    		    			$(".hidden-xs:first").append(data.nickName);
    	    		    		} else {
    	    		    			$(".hidden-xs:first").append(data.userName);
    	    		    		}
    	                
    	                $(".user-image").attr("src", userImg);
    		}
    	}

</script>

</body>
</html>
