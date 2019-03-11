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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/consumerCenter.css"/>
    <%--<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/a.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/b.css"/>--%>
    <title>个人中心</title>
</head>
<body style="height: 1000px">
<%--引入topBar--%>
<jsp:include page="${pageContext.request.contextPath}/pages/topBar.jsp"/>
<jsp:include page="${pageContext.request.contextPath}/pages/consumerAddressCheckedBar.jsp"/>
<div>
<div id="leftConsumer" style="margin: 20px 0px 0px 15px">
    <h2 id="showCenter" >个人中心</h2>
    <h2 id="showOrder"  >我的订单</h2>
    <h2 id="showSpan" >我的资料</h2>
    <span id="showInfo" style="cursor: pointer" >个人资料</span><br id="brbrbr">
    <span id="showAddress" style="cursor: pointer" >地址管理</span>
    <h2 id="showCollet" >我的收藏</h2>
</div>

   <%-- <div id="leftConsumer" style="margin: 20px 0px 0px 15px" class="leftNav-item">
        <ul>
            <li>
                <i class="fa fa-location-arrow"></i>
                <a  id="showOrder" href="javascript:void(0)" class="rota">我的订单</a>
            </li>
            <li title="个人信息">
                <i class="fa fa-comments-o"></i>
                <a id="showSpan"  href="javascript:void(0)" class="rota">个人信息</a>
            </li>
            <li lay-data="img" data-fooc="images/zizhu.png">
                <i id="showCollet" class="fa fa-money"></i><a href="javascript:;" class="rota">我的收藏</a>
            </li>
            <li title="返回顶部" class="for-top">
                <i class="fa fa-arrow-up"></i>
                <a href="javascript:;" class="rota">去顶部</a>
            </li>
        </ul>
    </div>

    <script src="${pageContext.request.contextPath}/css/c.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/d.js"></script>
--%>


<div id="rightConsumer" style="height: 780px"><h1>个人中心</h1></div>
</div>
</body>
</html>
<script>
    $(document).ready(function(){
        $("#showInfo").hide();
        $("#showAddress").hide();
        $("#brbrbr").hide();
        $("#showSpan").click(function () {
            $("#showInfo").show();
            $("#showAddress").show();
            $("#brbrbr").show();
            
        });
        function showOrderF() {//我的订单
            $("#rightConsumer").load("${pageContext.request.contextPath}/orderhistory.do?what=showAll");

        }
        if (${param.orderHistory == "zzzz"}) {
            showOrderF();
        }
        $("#showCenter").click(function () {//个人中心
            location.reload();
        });
        $("#showOrder").click(function () {//我的订单
            $("#rightConsumer").load("${pageContext.request.contextPath}/orderhistory.do?what=showAll");
        });
        $("#showInfo").click(function () {//个人资料
            $("#rightConsumer").load("${pageContext.request.contextPath}/pages/consumers/consumerInfo.jsp");
        });
        $("#showAddress").click(function () {//地址管理
            $("#rightConsumer").load("${pageContext.request.contextPath}/address.do?what=addressList");

        });
        $("#showCollet").click(function () {//我的收藏
            $("#rightConsumer").load("${pageContext.request.contextPath}/showCollectServlet.do?what=showAllCollect");
        });
    });

</script>
