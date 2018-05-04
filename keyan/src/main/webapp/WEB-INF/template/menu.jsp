<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<head>
    <title>左侧菜单页面</title>
    <script type="text/javascript" src="static/js/js.cookie-2.1.0.min.js"></script>
    <script type="text/javascript" src="static/js/jquerySession.js"></script>
    <script type="text/javascript" src="static/js/finalparameter.js"></script>
    <script type="text/javascript" src="static/js/menu/userType.js"></script>
</head>

<div class="main-sidebar">
    <aside class="main-sidebar">
        <section class="sidebar">
            <!-- Sidebar Menu -->
            <ul class="sidebar-menu">

            </ul>
        </section>
    </aside>
</div>
<script type="text/javascript">
        $(function() {
        	userType.init();
        });
</script>

