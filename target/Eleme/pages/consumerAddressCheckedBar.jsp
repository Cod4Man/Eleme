<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/1
  Time: 17:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="common/common.jsp"%>
<div style="margin: 20px 80px;font-size: 13px">
    <span style="color: #999999">当前位置:</span>
    <%--有默认地址--%>
    <c:if test="${sessionScope.consumer.consumerAddressChecked != null}">
        <%--显示默认地址--%>
        <span id="addressBar">
                ${sessionScope.consumer.consumerAddressChecked.city}
                ${sessionScope.consumer.consumerAddressChecked.district}
                ${sessionScope.consumer.consumerAddressChecked.comment}
            <a style="text-decoration: none;color: rgb(111,77,255)" href="javascript:void(0)" class="setAddresschecked">[切换地址]</a>
        </span>
    </c:if>
        <%--无默认地址--%>
    <c:if test="${sessionScope.consumer.consumerAddressChecked == null}">
        <%--提示设置默认地址--%>
    <span id="addressBar">
        <a href="javascript:void(0)" class="setAddresschecked">[请先设置地址以获取店家信息]</a>
    </span>
    </c:if>
</div>
<%--<div id="setAddresscheckedDiv" >
    <div><span  id="closeAddressChecked" class="closeAddressChecked">×</span></div>
    <div id="setAddresschecked"></div>
    <div id="chooseAddressOnMap">
        <iframe id="setAddressIFrame" frameborder="0" src="" width="800" height="400" />
    </div>
</div>--%>
<script>
    $(document).ready(function(){
        //地址iframe的显示隐藏
/*
        $("#setAddresscheckedDiv").hide();
        $("#addAddress").click(function () {
            $("#setAddresscheckedDiv").show();
        });
        $(".closeAddressChecked").click(function () {
            $("#setAddresscheckedDiv").hide();
        });
*/


        $(".setAddresschecked").click(function () {
            window.open("${pageContext.request.contextPath}/pages/address/setAddress.jsp?addressId=${sessionScope.consumer.consumerAddressChecked.id}")
            <%--location.href = "${pageContext.request.contextPath}/pages/address/setAddress.jsp?addressId ='${sessionScope.consumer.consumerAddressChecked.id}'";--%>
/*            var addressId ="${sessionScope.consumer.consumerAddressChecked.id}";
            $.ajax({
                "url" : "${pageContext.request.contextPath}/address.do?what=getAddressById",
                "type" : "post",
                "data" : "addressId=" + addressId,
                "dataType" : "json",
                "success" : function (result) {
                    $("#setAddressIFrame").attr("src",
                        "${pageContext.request.contextPath}/pages/address/setAddress.jsp?"+
                        "name=" + result.name + "&phoneNum=" + result.phoneNum + "&addressChecked=" + result.checked +
                        "&comment=" + result.comment + "pointLng="+ result.pointLng + "&pointLat=" +result.pointlat + "&business=" + result.business
                        + "&province=" + result.province + "&city=" + result.city + "&district=" + result.district
                        + "&street=" + result.street + "&streetNumber=" + result.streetNumber);
                    $("#setAddresscheckedDiv").show();
                }
            });*/
        });
    });
</script>
