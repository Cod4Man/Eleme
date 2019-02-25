<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/2/24
  Time: 23:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/common.jsp"%>
<h2>添加新地址</h2>
<table>
    <tr>
        <td>姓名</td>
        <td><input id="name_Address" name="name_Address" type="text" placeholder="请输入您的姓名"></td>
    </tr>
    <tr>
        <td>位置</td>
        <td><button id="chooseAddress">地图选点</button></td>
    </tr>
    <tr>
        <td>详细地址</td>
        <td><input id="comment_Address" name="comment_Address" type="text" placeholder="请输入您的详细地址"></td>
    </tr>
    <tr>
        <td>手机号</td>
        <td><input id="phoneNum_Address" name="phoneNum_Address" type="text" placeholder="请输入您的手机号码"></td>
    </tr>
    <tr>
        <td colspan="2">
            <button>保存</button>
            <button>取消</button>
        </td>
    </tr>
</table>
<script>
    $(document).ready(function(){
        $("#chooseAddress").click(function () {
            location.href = "${pageContext.request.contextPath}/pages/address/chooseAddress.jsp";
        });
    });
</script>
