    <%--
      Created by IntelliJ IDEA.
      User: Administrator
      Date: 2019/2/27
      Time: 14:22
      To change this template use File | Settings | File Templates.
    --%>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/registerFailed.css?v=<%=Math.random()%>">
    <html>
    <head>
        <title>注册失败</title>
    </head>
    <body id="d4">
    <div id="d3">
        <div >
            <img src="${pageContext.request.contextPath}/images/logo/logo2.jpg" id="logo">
        </div>
        <div align="center" id="d1">注册失败！</div>
        <div align="center" id="d2"><a href="javascript:void(0)" onclick="javascript:location.href='/pages/consumers/login.jsp'">重新注册</a></div>
    </div>
    </body>
    </html>
