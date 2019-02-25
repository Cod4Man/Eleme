<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/2/23
  Time: 23:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/common.jsp"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="${pageContext.request.contextPath}/consumer.do?what=addConsumer" method="post">
        <table  id="completeConInfoTable" align="center">
            <tr  style="display: none">
                <td>phoneNum</td>
                <td><input type="text" id="consumerPhoneNum" name="consumerPhoneNum" value="${param.phoneNum}"></td>
            </tr>
        <tr>
                <td>昵称：</td>
                <td><input type="text" id="consumerNickName" name="consumerNickName" placeholder="请输入昵称"></td>
        </tr>
        <tr>
                <td>密码：</td>
                <td><input type="password" id="consumerLoginPsw" name="consumerLoginPsw" placeholder="请输入密码"></td>
        </tr>
        <tr>
                <td>确认密码：</td>
                <td><input type="password" id="consumerLoginPsw2" name="consumerLoginPsw2" placeholder="请再次输入密码"></td>
        </tr>
        <tr>
                <td>邮箱：</td>
                <td><input type="text" id="consumerMail" name="consumerMail" placeholder="请输入邮箱"></td>
        </tr>
        <tr>
                <td>上传头像：</td>
                <td><input type="file" id="consumerPortraitURL" name="consumerPortraitURL" ></td>
        </tr>
        <tr align="center">
                <td colspan="2">
                    <input type="submit" value="提交">
                </td>
        </tr>
        </table>
    </form>
</body>
</html>
