<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/5
  Time: 14:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="pages/common/common.jsp"%>
<html>
<head>
    <title>卖家=订单处理</title>
</head>
<body>
<div id="xxxxx">

</div>


</body>
</html>
<script>
    $(document).ready(function(){
        $("#xxxxx").load("${pageContext.request.contextPath}/orderStatusServlet.do?what=showAllOrder");
    });
</script>
