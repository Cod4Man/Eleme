<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/2/21
  Time: 22:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file= "/pages/common/common.jsp"%>
<html>
<head>
    <title>欢迎来到Eleme</title>
</head>
<body style="margin: 0px">
<div style="background-color: #b598a1;height: 515px;">
    <div id="login" >
        <a href="${pageContext.request.contextPath}/pages/consumers/login.jsp" >注册</a>丨
        <a href="${pageContext.request.contextPath}/pages/consumers/login.jsp">登录</a>
    </div>
    <div id="searchAddress" >
        <h1 id="welcome">欢迎使用Eleme！</h1>
    </div>
</div>
<jsp:include page="/pages/bottomBar.jsp"/>
</body>
</html>

<script>
    $(document).ready(function(){
        setInterval(function () {
            $("#welcome").css("color","rgb("+255*Math.random()+","+255*Math.random()+","+255*Math.random()+")")
        },600)
    });
</script>
