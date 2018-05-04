<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<!-- Main Header -->
<header class="main-header">
<!-- Logo -->
	<a href="#" class="logo">
     	<!-- mini logo for sidebar mini 50x50 pixels -->
     	<span class="logo-mini"><b>I</b>EP</span>
     	<span class="logo-lg" style="font-size: 15px; !important;">小区物业管理系统</span>
 	</a>
 	<!-- Header Navbar -->
 	<nav class="navbar navbar-static-top" role="navigation">
    	<!-- Sidebar toggle button-->
     	<a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        	<span class="sr-only">Toggle navigation</span>
     	</a>
     	<a href="http://localhost:8888/keyan" class="logo">
        	<span class="logo-lg" style="text-align: left;!important;">首页</span>
     	</a>
		<div class="navbar-custom-menu">
			<ul class="nav navbar-nav">
                <li class="dropdown user user-menu">
                    <a>
                        <img src="" class="user-image" alt="User Image">
                    <span class="hidden-xs"></span>
						<input type="hidden" value="${userImage}" id="userImage">
						<input type="hidden" value="${nickName}" id="nickName">
						<input type="hidden" value="${userId}" id="userId">
                    </a>
                </li>
                <li class="dropdown">
					<a href="page/logOff" id="logOff"><i class="fa fa-power-off"></i>
                        <span class="hidden-xs" >退出</span>
                    </a>
				</li>
			</ul>
		</div>
 	</nav>
</header>
