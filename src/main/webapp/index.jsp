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


<div class="mapfooter" map-footer="" ALIGN="CENTER" STYLE="position: relative;bottom: 0px;height: 130px" >
    <p class="mapfooter-link">
        <a href="javascript:void(0)" ubt-click="1434">我要开店</a>
        <a href="javascript:void(0)" ubt-click="1435">联系我们</a>
        <a ng-href="javascript:void(0)" ubt-click="1436" href="javascript:void(0)">服务条款和协议</a>
        <a ng-href="javascript:void(0)" target="_blank" href="javascript:void(0)">隐私政策</a>
        <a href="javascript:void(0)">营业执照</a>
        <a href="javascript:void(0)" ubt-click="1437">加入我们</a>
        <a href="javascript:void(0)">蜂鸟配送</a>
        <a href="//imview.rajax.me/im/html/dishonesty/">失信人员查询</a>
    </p>
    <div class="footer-copyright serif">互联网药品信息服务资格证书:<a href="javascript:void(0)" target="_blank">(蛙)-经营性-2016-0011</a> | 增值电信业务许可证 : <a href="javascript:void(0)" target="_blank">蛙B6-66666666</a> | <a href="javascript:void(0)" target="_blank">蛙ICP备 66666666</a> | <a href="javascript:void(0)" target="_blank">上海工商行政管理</a> Copyright ©2008-2018 厦门口德满信息科技有限公司, All Rights Reserved.</div>
    <div class="footer-police container"><a href="javascript:void(0)" rel="nofollow" target="_blank"></a></div>
</div>
</body>
</html>

<script>
    $(document).ready(function(){
        setInterval(function () {
            $("#welcome").css("color","rgb("+255*Math.random()+","+255*Math.random()+","+255*Math.random()+")")
        },600)
    });
</script>
