<%-- 历史订单
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/4
  Time: 9:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/common.jsp"%>
<h2 id="orderHistoryTitle">最近订单</h2>
<hr>
<div id="orderhistory-div">
    <table>
        <tr id="orderhistorytable-title">
            <td width="200" >下单时间</td>
            <td width="250">店铺信息</td>
            <td width="150" align="center">支付金额(元)</td>
            <td width="150" align="center">状态</td>
            <td width="100" align="center">操作</td>
        </tr>
        <c:forEach items="${orderHistoryList}" varStatus="status" var="orderHistory">
            <tr class="orderhistory-div">
                <td>${orderHistory.orderDate.toString().replace("T"," ").substring(0,orderHistory.orderDate.toString().lastIndexOf(":"))}</td>
                <td style="cursor: pointer" onclick="location.href='${pageContext.request.contextPath}/restaurant.do?info=findById&id=${orderHistory.restaurant.restaurantNo }'">
                    <img style="vertical-align:middle" src="${pageContext.request.contextPath}/images/restaurant/${orderHistory.restaurant.restaurantPortraitURL }">
                    ${orderHistory.restaurant.restaurantName }
                </td>
                <td align="center">${orderHistory.price}</td>
                <td align="center">
                        ${orderHistory.orderStatusName}
                    <c:choose>
                        <c:when test="${orderHistory.orderStatus ==3}" > <%--配送中未签收--%>
                            <br/>
                            <a href="javascript:void(0)" class="setOrderStatus" orderId="${orderHistory.id}" setOrderStatus="5">未签收</a>
                        </c:when>
                        <c:when test="${orderHistory.orderStatus ==5}"><%--已签收未评价--%>
                            <br/>
                            <a href="javascript:void(0)" class="setOrderStatus" orderId="${orderHistory.id}" setOrderStatus="7">未评价</a>
                        </c:when>
                        <c:otherwise></c:otherwise>
                    </c:choose>
                </td>
                <td align="center">
                    <a href="javascript:void(0)" class="orderDetail-a" orderHistoryNo="${orderHistory.orderHistoryNo}">订单详情</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

<script>
    $(document).ready(function(){
        //订单详情查看
        $(".orderDetail-a").click(function () {
            var orderHistoryNo = $(this).attr("orderHistoryNo");
            $("#orderHistoryTitle").html("订单详情");
            $("#orderhistory-div").html("");
            $("#orderhistory-div").load("${pageContext.request.contextPath}/orderhistory.do?what=orderDetail&orderHistoryNo=" +orderHistoryNo);
        });
        //订单状态操作
        $(".setOrderStatus").click(function () {
            var orderId = $(this).attr("orderId");
            var setOrderStatus = $(this).attr("setOrderStatus");
            var boo = false;
            if (setOrderStatus ==5) {
                if (confirm("确认签收订单吗?签收后钱会转到商家账户！")) {
                    boo = true;
                }
            } else if (setOrderStatus ==7) {
                var orderComment = prompt("请输入评价内容","好吃！");
                boo = true;
            }
            if (boo == false) {
                return;
            }
            //ajax处理修改订单状态
            $.ajax({
                "url" : "${pageContext.request.contextPath}/orderhistory.do?what=setOrderStatus",
                "data" : "orderId=" + orderId + "&status=" + setOrderStatus,
                "type" : "post",
                "dataType" : "text",
                "success" : function (result) {
                    if (result == "true") {
                        if (setOrderStatus ==5) {
                            alert("签收成功！");
                        } else if (setOrderStatus ==7) {
                            alert("评价成功！");
                        }
                        location.href = "${pageContext.request.contextPath}/pages/consumers/consumerCenter.jsp?orderHistory=zzzz";
                    } else {
                        if (setOrderStatus ==5) {
                            alert("签收失败！");
                        } else if (setOrderStatus ==7) {
                            alert("评价失败！");
                        }
                    }
                }
            });
        });
    });
</script>



