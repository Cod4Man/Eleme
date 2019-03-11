<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/2/23
  Time: 23:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/common.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/completeConsumerInfo.css?v=<%=Math.random()%>">
<html>
<head>
    <title>完善信息</title>
</head>
<body>
<h1 align="center">请完善个人信息</h1>
<%--复合式提交form表单，包含文件上传enctype="multipart/form-data"--%>
    <form action="${pageContext.request.contextPath}/consumer.do?what=addConsumer" method="post" enctype="multipart/form-data">
        <div  id="completeConInfoTable" align="center">
            <div  style="display: none">
                <div width="90" >phoneNum</div>
                <div width="200">
                    <input style="display: none" type="text" name="authCode" value="${param.authCode}">
                    <input style="display: none" type="text" name="authCodeReturn" value="${param.authCodeReturn}">
                    <input type="text" id="consumerPhoneNum" name="consumerPhoneNum" value="${param.phoneNum}">
                </div>
            </div>
        <div id="name1">
                <div  id="name">昵称：</div>
                <div  id="nameinp"><input  type="text" id="consumerNickName" name="consumerNickName" placeholder="请输入昵称"
                            required pattern="[\u4e00-\u9fa5_a-zA-Z0-9_]{1,20}"></div>
        </div>
        <div id="pd1" align="center">
                <div id="pd">密码：</div>
                <div id="pdinp"><input type="password" id="consumerLoginPsw" name="consumerLoginPsw"
                           placeholder="请输入密码(大小写字母/数字组成)" required pattern="[A-Za-z0-9]{6,20}"></div>
                <div id="passwordStrongTd" align="left" width="250" >
                    <span class="passwordStrong" style="border-radius:5px 5px 5px 5px;">&nbsp;&nbsp;</span>
                    <span class="passwordStrong" style="border-radius:5px 5px 5px 5px;">&nbsp;&nbsp;</span>
                    <span class="passwordStrong" style="border-radius:5px 5px 5px 5px;">&nbsp;&nbsp;</span>
                    <span class="passwordStrong" style="border-radius:5px 5px 5px 5px;">&nbsp;&nbsp;</span>
                    <span class="passwordStrong" style="border-radius:5px 5px 5px 5px;">&nbsp;&nbsp;</span>
                    <span id="passwordStrong"></span>
                </div>
        </div>
        <div id="pwd1">
                <div id="pwd">确认密码：</div>
                <div id="pwdinp"><input type="password" id="consumerLoginPsw2" name="consumerLoginPsw2"
                           placeholder="请再次输入密码" required pattern="[A-Za-z0-9]{6,20}"></div>
        </div>
        <div id="em1">
                <div id="em">邮箱：</div>
                <div id="eminp"><input type="text" id="consumerMail" name="consumerMail" placeholder="请输入邮箱"
                           required pattern="[a-zA-Z0-9]{4,11}@163\.com"></div>
        </div>
        <div id="ph1">
                <div id="ph">上传头像：</div>
                <div id="phinp"><input type="file" id="consumerPortraitURL" name="consumerPortraitURL" required ></div>
        </div>
        <div align="center">
                <div colspan="2">
                    <input id="submitConInfo" type="submit" value="提交">
                </div>
        </div>
        </div>
    </form>
</body>
</html>
<script>
    $(document).ready(function(){
        $("#consumerLoginPsw").change(function () {
                var loginPsw = $("#consumerLoginPsw").val();
                var loginPswLenght = loginPsw.length;
                var patternNum = new RegExp("[0-9]{"+loginPswLenght+"}");
                var patternLetterU = new RegExp("[A-Z]{"+loginPswLenght+"}");
                var patternLetterL = new RegExp("[a-z]{"+loginPswLenght+"}");
                var patternNumOne = new RegExp("[0-9]+");
                var patternLetterUOne = new RegExp("[A-Z]+");
                var patternLetterLOne = new RegExp("[a-z]+");
                if (patternNum.test(loginPsw) || patternLetterL.test(loginPsw) || patternLetterU.test(loginPsw)) { //弱：密码为全字母或全数字
                    $("#passwordStrong").html("密码强度：弱");
                    $(".passwordStrong").css("background-color","#239903");
                } else if ((!patternNumOne.test(loginPsw) || !patternLetterUOne.test(loginPsw) || !patternLetterLOne.test(loginPsw)) &&
                    (!patternNum.test(loginPsw) && !patternLetterL.test(loginPsw) && !patternLetterU.test(loginPsw))) {
                    $("#passwordStrong").html("密码强度：中");
                    $(".passwordStrong").css("background-color","#995d06");
                } else {
                    $("#passwordStrong").html("密码强度：强");
                    $(".passwordStrong").css("background-color","#991d11");
                }
        });
        $("#submitConInfo").click(function () {
            var consumerPhoneNum = $("#consumerPhoneNum").val();
            var consumerLoginPsw = $("#consumerLoginPsw").val();
            var consumerLoginPsw2 = $("#consumerLoginPsw2").val();
            if (consumerPhoneNum == null || consumerPhoneNum =="") {
                alert("注册异常！");
                location.href = "${pageContext.request.contextPath}/pages/consumers/login.jsp";
                return false;
            } else if (consumerLoginPsw != consumerLoginPsw2) {
                alert("两次输入的密码不一致！");
                return false;
            }
        });
    });
</script>
