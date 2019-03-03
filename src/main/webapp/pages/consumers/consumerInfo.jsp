<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/1
  Time: 20:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<h2>个人资料</h2>
<hr>
<table id="consumerInfoTable" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td width="80">昵称</td>
        <td>${sessionScope.consumer.consumerNickName}</td>
    </tr>
    <tr>
        <td>邮箱</td>
        <td>${sessionScope.consumer.consumerMail}</td>
    </tr>
    <tr>
        <td>头像</td>
        <td>
            <img class="goConsumerCore" id="consumerPortrait" src="${pageContext.request.contextPath}/images/consumer/${sessionScope.consumer.consumerPortraitURL}">
        </td>
    </tr>
    <tr>
        <td>手机号码</td>
        <td>${sessionScope.consumer.consumerPhoneNum}</td>
    </tr>
</table>
