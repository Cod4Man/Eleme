<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/3
  Time: 0:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/common.jsp"%>
<h2>地址管理</h2>
<hr>
<div id="addressListDiv">
    <c:forEach items="${addressList}" var="address" varStatus="status" >
        <div id="addressId${address.id}" <c:if test="${address.checked==1}">class="checkedAddressDiv" </c:if>>
            <span>${address.name}</span>
            <span>
                <a href="javascript:void(0)" class="modifyAddress-a" addressId="${address.id}" >修改</a>
                <a href="javascript:void(0)" class="deleteAddress-a" addressId="${address.id}" >删除</a>
                <c:if test="${address.checked!=1}">
                    <a href="javascript:void(0)" class="addressChecked-a" addressId="${address.id}">设为默认地址</a>
                </c:if>
            </span>
            <br>
            <span>${address.comment}</span>
            <br>
            <span>${address.phoneNum}</span>
        </div>
    </c:forEach>
    <div id="addAddress" style="cursor: pointer;text-align: center;line-height: 100px" >
        + 添加新地址
    </div>
</div>
<div id="setAddresscheckedDiv" >
    <div><span  id="closeAddressChecked" class="closeAddressChecked">×</span></div>
    <div id="setAddresschecked"></div>
    <div id="chooseAddressOnMap">
        <iframe id="setAddressIFrame" frameborder="0" src="${pageContext.request.contextPath}/pages/address/setAddress.jsp" width="800" height="400" />
    </div>
</div>
<script>
    $(document).ready(function(){
        //地址iframe的显示隐藏
        $("#setAddresscheckedDiv").hide();
        $("#addAddress").click(function () {
            $("#setAddresscheckedDiv").show();
        });
        $(".closeAddressChecked").click(function () {
            $("#setAddresscheckedDiv").hide();
        });

        //设为默认地址
        $(".addressChecked-a").click(function () {
            var addressId = $(this).attr("addressId");
            $.ajax({
                "url" : "${pageContext.request.contextPath}/address.do?what=addressChecked",
                "type" : "post",
                "data" : "addressId=" + addressId + "&consumerNo=" + ${sessionScope.consumer.consumerNo},
                "dataType" : "text",
                "success" : function (result) {
                    if (result == "true") {
                        alert("修改默认地址成功！");
                        location.reload();
                    } else {
                        alert("修改默认地址失败！");
                    }
                }
            });
        });
        //删除地址
        $(".deleteAddress-a").click(function () {
            if (confirm("确认要删除该地址吗？")) {
                var addressId = $(this).attr("addressId");
                $.ajax({
                    "url" : "${pageContext.request.contextPath}/address.do?what=deleteAddress",
                    "type" : "post",
                    "data" : "addressId=" + addressId,
                    "dataType" : "text",
                    "success" : function (result) {
                        if (result == "true") {
                            alert("删除地址成功！");
                            location.reload();
                        } else {
                            alert("删除地址失败！");
                        }
                    }
                });
            }
        });
        //修改地址
        $(".modifyAddress-a").click(function () {
            var addressId = $(this).attr("addressId");
            $.ajax({
                "url" : "${pageContext.request.contextPath}/address.do?what=getAddressById",
                "type" : "post",
                "data" : "addressId=" + addressId,
                "dataType" : "json",
                "success" : function (result) {
                    $("#setAddressIFrame").attr("src",
                        "${pageContext.request.contextPath}/pages/address/setAddress.jsp?"+
                        "name=" + result.name + "&phoneNum=" + result.phoneNum + "&addressChecked=" + result.checked +
                        "&comment=" + result.comment + "&pointLng="+ result.pointLng + "&pointLat=" +result.pointLat + "&business=" + result.business
                            + "&province=" + result.province + "&city=" + result.city + "&district=" + result.district
                            + "&street=" + result.street + "&streetNumber=" + result.streetNumber + "&addressId=" + addressId);
                    $("#setAddresscheckedDiv").show();
                }
            });
        });
    });
</script>