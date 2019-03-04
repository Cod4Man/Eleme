<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/4
  Time: 17:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/common.jsp"%>

<c:forEach items="${restaurantCollets}" varStatus="status" var="RestaurantCollet">
    <div  style="cursor: pointer;margin: 20px" onclick="location.href='${pageContext.request.contextPath}/restaurant.do?info=findById&id=${RestaurantCollet.restaurant.restaurantNo }'">
            ${status.count}&nbsp;&nbsp;<img style="vertical-align:middle" src="${pageContext.request.contextPath}/images/restaurant/${RestaurantCollet.restaurant.restaurantPortraitURL }">
            ${RestaurantCollet.restaurant.restaurantName }
    </div>
</c:forEach>




