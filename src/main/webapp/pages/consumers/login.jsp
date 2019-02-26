<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/2/23
  Time: 22:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/common.jsp"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div style="height: 555px">
    <div id="completeTableDiv">
        <form name="Username" id="u1" >
            <table class="tb" border="0" cellspacing="5" cellpadding="0" align="center">
                <tr>
                    <td width="80px" class="text_tabledetail2">手机号</td>
                    <td width="200px"><input type="text" name="phoneNum" value="" placeholder="请输入手机号码"/></td>
                    <td width="130px"><a id="getAuthCode-a" href="javascript:void(0)">获取验证码</a></td>
                </tr>
                <tr id="loginByPsw">
                    <td class="text_tabledetail2">密码</td>
                    <td><input type="password" name="password" value="" placeholder="请输入密码"/></td>
                    <td width="130px"><a id="loginByAuthCode-a" href="javascript:void(0)" >使用验证码登录</a></td>
                </tr>
                <tr id="loginByAuthCode">
                    <td class="text_tabledetail2">验证码</td>
                    <td><input type="text" name="authCode" value="" placeholder="请输入验证码"/></td>
                    <td width="130px"><a id="loginByPsw-a" href="javascript:void(0)">使用密码登录</a></td>
                </tr>
                <tr>
                    <td colspan="2">
                        新用户登录即自动注册，<br/>表示用户已同意
                        <a href="//h5.ele.me/service/agreement/#initTitle=%E7%94%A8%E6%88%B7%E6%9C%8D%E5%8A%A1%E5%8D%8F%E8%AE%AE&amp;key=ruleQue18">《用户服务协议》</a>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:center;" colspan="2">
                        <input id="login-submit" type="button" class="page-btn" name="return" value="登录"/>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>
<div class="mapfooter" map-footer="" ALIGN="CENTER" STYLE="position: relative;bottom: 0px;height: 130px" >
    <div> 所有方：厦门口德满信息科技有限公司</div>
    <div class="footer-copyright serif">互联网药品信息服务资格证书:<a href="javascript:void(0)" target="_blank">(蛙)-经营性-2016-0011</a> | 增值电信业务许可证 : <a href="javascript:void(0)" target="_blank">蛙B6-66666666</a> | <a href="javascript:void(0)" target="_blank">蛙ICP备 66666666</a> | <a href="javascript:void(0)" target="_blank">上海工商行政管理</a> Copyright ©2008-2018 厦门口德满信息科技有限公司, All Rights Reserved.</div>
    <div class="footer-police container"><a href="javascript:void(0)" rel="nofollow" target="_blank"></a></div>
</div>
</body>
</html>
<script>
    $(document).ready(function(){
        var loginType = "authCode";
        phoneNumPattern = new RegExp("^1\\d{10}$");
        passwordPattern  = new RegExp("^\\w{6,20}$");
        authCodePattern = new RegExp("^\\d{6}$");
        authCodeReturn = "666";
        $("#login-submit").click(function () {
            var phoneNum = $("[name=phoneNum]").val();
            var authCode =$("[name=authCode]").val();
            var password =$("[name=password]").val();
            if (!phoneNumPattern.test(phoneNum)) { //电话号码匹配错误
                alert("请输入正确的电话号码！");
            } else if (loginType == "authCode") { //如果是验证码登录，则验证验证码
                if (!authCodePattern.test(authCode)) { //验证码格式错误
                    alert("验证码错误！(6位数字)")
                } else {
                    $.ajax({
                        "url" : "${pageContext.request.contextPath}/consumer.do?what=loginByAuthCode",
                        "data" : "phoneNum=" + phoneNum + "&authCode=" + authCode + "&authCodeReturn=" + authCodeReturn,
                        "dataType" : "text",
                        "type" : "post",
                        "success" : function (result) {
                            if (result == "false") {
                                alert("验证码错误！");
                            } else if (result == "true") {
                                location.href = "${pageContext.request.contextPath}/consumer.do?what=getConsumerByPhoneNum&phoneNum=" + phoneNum;
                            }
                        }
                    });
                }
            } else if (loginType == "password") { //验证密码
                if (!passwordPattern.test(password)) {//密码格式错误
                    alert("密码格式错误，密码为6-20位，数字、字母、下划线组成");
                } else {
                   // location.href = "${pageContext.request.contextPath}/consumer.do?what=loginByPsw&phoneNum=" + phoneNum + "&password=" + password;
                    $.ajax({
                        "url" : "${pageContext.request.contextPath}/consumer.do?what=loginByPsw",
                        "data" : "phoneNum=" + phoneNum + "&password=" + password,
                        "dataType" : "text",
                        "type" : "post",
                        "success" : function (result) {
                            if (result == "false") {
                                alert("密码错误！");
                            } else if (result == "true") {
                                location.href = "${pageContext.request.contextPath}/consumer.do?what=getConsumerByPhoneNum&phoneNum=" + phoneNum;
                            }
                        }
                    });
                }
            }
        });
    //获取验证码
        $("#getAuthCode-a").click(function () {
            var phoneNum2 =$("[name=phoneNum]").val();
            if (!phoneNumPattern.test(phoneNum2)) { //电话号码匹配错误
                alert("请输入正确的电话号码！");
            } else {
                //ajax发送验证码
                $.ajax({
                    "url" : "${pageContext.request.contextPath}/consumer.do?what=sendAuthCode",
                    "type" : "post",
                    "dataType" : "json",
                    "data" : "phoneNum=" + phoneNum2,
                    "success" : function (result) {
                        if (result.result == "false") {
                            alert("发送验证码异常！请重试！");
                        } else if (result.result == "true") {
                            //发送验证码成功
                            authCodeReturn = result.authCode;
                        }
                    }
                });
            }
        });



        $("#loginByAuthCode-a").hide();
        $("#loginByPsw").hide();
        $("#loginByPsw-a").click(function () {
            loginType = "password";
            $(this).hide();
            $("#getAuthCode-a").hide();
            $("#loginByAuthCode").hide();
            $("#loginByAuthCode-a").show();
            $("#loginByPsw").show();
        });
        $("#loginByAuthCode-a").click(function () {
            loginType = "authCode";
            $(this).hide();
            $("#getAuthCode-a").show();
            $("#loginByPsw").hide();
            $("#loginByPsw-a").show();
            $("#loginByAuthCode").show();
        });
    });
</script>
