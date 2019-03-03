<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/2/24
  Time: 23:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/common.jsp"%>
<h2 align="center">
    <c:choose>
        <c:when test="${param.phoneNum !=null or param.addressId != null}">
            修改地址
        </c:when>
        <c:otherwise>
            添加新地址
        </c:otherwise>
    </c:choose>
</h2>
<div id="chooseAddressDiv">
    <table align="center">
        <tr style="display: none">
            <td width="80px">买家编号</td>
            <td><input id="consumerNo_Address" name="consumerNo_Address" type="text"
                       value="${sessionScope.consumer.consumerNo}" ></td>
        </tr>
        <tr>
            <td width="80px">姓名</td>
            <td><input id="name_Address" name="name_Address" type="text" placeholder="请输入您的姓名" value="${param.name}"></td>
        </tr>
        <tr>
            <td>位置</td>
            <td><button id="chooseAddress">地图选点</button></td>
        </tr>
        <tr>
            <td>详细地址</td>
            <td><input id="comment_Address" name="comment_Address" type="text" placeholder="请输入您的详细地址" value="${param.comment}"></td>
        </tr>
        <tr>
            <td>手机号</td>
            <td><input id="phoneNum_Address" name="phoneNum_Address" type="text" placeholder="请输入您的手机号码" value="${param.phoneNum}"></td>
        </tr>
        <tr>
            <td>默认地址</td>
            <td>
                是<input id="radio1" type="radio" name="addressChecked" value="1" checked>
                否<input id="radio2" type="radio" name="addressChecked" value="0" >
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <button id="saveAddress">保存</button>
            </td>
        </tr>
    </table>
</div>
<script>
    $(document).ready(function(){
        //设置默认地址
        if (${param.addressChecked == null or param.addressChecked == "1"}) {
            $("#radio1").attr("checked", "checked");
            $("#radio2").removeAttr("checked");
        } else if (${param.addressChecked == "0"}) {
            $("#radio2").attr("checked", "checked");
            $("#radio1").removeAttr("checked");
        }
        //地图选点
        $("#chooseAddress").click(function () {
            var phoneNum= $.trim($("#phoneNum_Address").val());
            var name= $.trim($("#name_Address").val());
            var comment = $.trim($("#comment_Address").val());
            var addressChecked = $("input[type=radio]:checked").val();
            location.href = "${pageContext.request.contextPath}/pages/address/chooseAddress.jsp"
                +"?phoneNum=" + phoneNum + "&addressId=${param.addressId}&name=" + name + "&comment=" + comment + "&addressChecked=" + addressChecked;
        });
        //提交地址
        $("#saveAddress").click(function () {
            var addressChecked = $("input[type=radio]:checked").val();
            phoneNumPattern = new RegExp("^1\\d{10}$");
            var phoneNum= $.trim($("#phoneNum_Address").val());
            var name= $.trim($("#name_Address").val());
            var consumerNo = $("#consumerNo_Address").val();
            //没有地图选点
            if (${param.pointLng == null or  param.pointLng ==''} || ${param.pointLat == null or  param.pointLat ==''}) {
                alert("请先在地图选择详细位置");
                $("#chooseAddress").click();
            } else if (consumerNo == null || consumerNo =='') { //用户session异常
                alert("请先登录！");
                location.href = "${pageContext.request.contextPath}/pages/consumers/login.jsp";
            } else if (name == null || name == '') { //联系人没写
                alert("请选择联系人！");
            } else if (!phoneNumPattern.test(phoneNum)) { //手机号码格式不对
                alert("请输入正确的手机号码！")
            } else { //一切正常
                //获取input内容
                var inputJson = $("#chooseAddressDiv").find(":input").serialize();
                inputJson = inputJson.replace(/(=\++)/g,'=').replace(/(\++&)/g,"&");
                //ajax提交
                $.ajax({
                    "url" : "/address.do?what=setAddress&addressId=${param.addressId}&consumerPhoneNum=${sessionScope.consumer.consumerPhoneNum}&pointLng=${param.pointLng}&pointLat=${param.pointLat}&business=${param.business}&province=${param.province}&city=${param.city}&district=${param.district}&street=${param.street}&streetNumber=${param.streetNumber}",
                    "type" : "post",
                    "dataType" : "text",
                    "data" : inputJson,
                    "success" : function (result) {
                        if (result == "true") {
                            //如果是默认地址，则需要刷新session的consumer(servlet实现)
                            alert("更新地址成功！");
                            location.reload();
                            $("#setAddresscheckedDiv").hide();
                        } else {
                            alert("更新地址失败！");
                        }
                    }
                });
            }
        });
    });
</script>
