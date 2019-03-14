<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="org.springframework.context.support.ClassPathXmlApplicationContext" %>
<%@ page import="com.cod4man.eleme.pojo.SetUp" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/12
  Time: 14:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    SetUp setUp = (SetUp) new ClassPathXmlApplicationContext("ApplicationContext-imagesURL.xml").getBean("imagesSource");
    out.print("test~"+setUp );

%>
</body>
</html>
