<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/1
  Time: 16:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/common.jsp"%>
<html>
<head>
    <title>个人中心</title>
</head>
<body style="height: 2000px">
<%--引入topBar--%>
<jsp:include page="${pageContext.request.contextPath}/pages/topBar.jsp"/>
<jsp:include page="${pageContext.request.contextPath}/pages/consumerAddressCheckedBar.jsp"/>
<div>
<div id="leftConsumer">
    <h2 id="showCenter">个人中心</h2>
    <h2 id="showOrder">我的订单</h2>
    <h2>我的资料</h2>
    <span id="showInfo">个人资料</span><br>
    <span id="showAddress">地址管理</span>
    <h2 id="showCollet">我的收藏</h2>
</div>
<div id="rightConsumer"><h1>个人中心</h1></div>
</div>
</body>
</html>
<script>
    $(document).ready(function(){
        $("#showCenter").click(function () {//个人中心
            location.reload();
        });
        $("#showOrder").click(function () {//我的订单
            $("#rightConsumer").html("<h1>我的订单</h1>");
        });
        $("#showInfo").click(function () {//我的资料
            $("#rightConsumer").load("${pageContext.request.contextPath}/pages/consumers/consumerInfo.jsp");
        });
        $("#showAddress").click(function () {//地址管理
            $("#rightConsumer").load("${pageContext.request.contextPath}/address.do?what=addressList");
        });
        $("#showCollet").click(function () {//我的收藏
            $("#rightConsumer").html("<h1>我的收藏</h1>");
        });
    });
</script>
