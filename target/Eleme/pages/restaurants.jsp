<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>饿了么首页</title>
<style>
#restname {
	color: red;
}
.rest_type{display: inline-block;}
</style>
<script type="text/javascript">
    $(document).ready(function(){
        function getType(type){
            $.ajax({
                url : "${pageContext.request.contextPath}/type.do",
                data : "type=" + type,
                type : "post",
                dataType : "JSON",
                success : function (result){
                    $("#tb").html("");
                    for(var i in result){
                        $("#tb").append("<tr><td><img src=\"${pageContext.request.contextPath}/images/restaurant/"+result[i].restaurantPortraitURL+"\"/></td><td onclick=\"location.href='${pageContext.request.contextPath}/restaurant.do?info=findById&id="+result[i].restaurantNo+"'\" class=\"restname\" restaurantNo=\""+ result[i].restaurantNo +"\"  width=\"200px\" style=\"color:red\" >"+result[i].restaurantName+"</td></td></tr>");
                    };
                }
            })
        }
        getType("全部");
        x();
        function x(){
            $("#rest_type").find("li").click(function () {
                var type = $(this).text();
                getType(type);
            });
        }
    });
</script>
</head>
<body >
<div>
    <jsp:include page="${pageContext.request.contextPath}/pages/topBar.jsp"/>
    <%--<%@include file= "consumerAddressCheckedBar.jsp"%>--%>
    <jsp:include page="${pageContext.request.contextPath}/pages/consumerAddressCheckedBar.jsp"/>
    <div id="restList">
        <ul id="rest_type">
            <li class="rest_type">全部</li>
            <li class="rest_type">小吃夜宵</li>
            <li class="rest_type">快餐便当</li>
            <li class="rest_type">商店超市</li>
            <li class="rest_type">营养快餐</li>
            <li class="rest_type">汉堡超市</li>
        </ul>
        <table id="tb">
            <c:forEach items="${restList }" var="relist">
                <tr>
                    <td><img src="${pageContext.request.contextPath}/images/restaurant/${relist.restaurantPortraitURL }"></td>
                    <td class="restname" restaurantNo="${relist.restaurantNo }"
                        onclick="location.href='<%=request.getContextPath()%>/restaurant.do?info=findById&id=${relist.restaurantNo }'"
                        width="200px">${relist.restaurantName }</td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
	<input type="hidden" id="hidd" value="<%=request.getContextPath()%>" />
</body>
</html>