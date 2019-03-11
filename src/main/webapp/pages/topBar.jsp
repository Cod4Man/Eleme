<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/1
  Time: 17:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="common/common.jsp"%>
<div id="headerDiv">
    <header class="topbar">
        <div id="topDiv" align="center">
            <div id="topNavigation" align="left">
                <a href="javascript:void(0)" id="back2Restaurant">首页</a>
                <a href="${pageContext.request.contextPath}/pages/consumers/consumerCenter.jsp?orderHistory=zzzz" id="goOrderHistory">我的订单</a>
                <a href="javascript:void(0)">我的客服</a>
            </div>
            <div id="loginInner" align="right">
                <c:if test="${sessionScope.consumer == null}">
                    <a id="loginInner-a" href="${pageContext.request.contextPath}/pages/consumers/login.jsp">注册/登录</a>
                </c:if>
                <c:if test="${sessionScope.consumer != null}">
                    <jsp:include page="${pageContext.request.contextPath}/pages/consumers/consumerCenterEntrance.jsp"/>
                </c:if>
            </div>
        </div>
    </header>
</div>
<script>
    $(document).ready(function(){
        $("#back2Restaurant").click(function () {
            location.href = "${pageContext.request.contextPath}/restaurant.do?info=findAll";
        });
    });
</script>