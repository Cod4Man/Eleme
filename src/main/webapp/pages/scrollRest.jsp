<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/8
  Time: 17:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/dist/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/dist/sortable.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/dist/sortable.min.js"></script>
<%--<%@include file="common/common.jsp"%>--%>
<c:forEach items="${relist}" var="relist">
<div data-sjsel="${relist.restaurantType.type}" style="width: 200px" class="restname" restaurantNo="${relist.restaurantNo }" onclick="location.href='<%=request.getContextPath()%>/restaurant.do?info=findById&id=${relist.restaurantNo }&restaurantName=${relist.restaurantName}'">
    <div class="card"> <img class="card__picture" src="${pageContext.request.contextPath}/images/restaurant/${relist.restaurantPortraitURL }" alt="点击进入店铺"><!--图片-->
        <div class="card-infos">
            <h2 class="card__title">${relist.restaurantName }</h2>
            <p class="card__text">描述</p>
        </div>
    </div>
</div>
</c:forEach>
<script>
    $(document).ready(function(){
        onload = function () {
            $('#sortable')[0].sortablejs();
        }
    });
</script>
