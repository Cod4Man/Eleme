<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/5
  Time: 14:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="pages/common/common.jsp"%>
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
                        <c:when test="${orderHistory.orderStatus ==1}" > <%--未接单--%>
                            <br/>
                            <a href="javascript:void(0)" class="setOrderStatus" orderId="${orderHistory.id}" setOrderStatus="2">接单</a>
                        </c:when>
                        <c:when test="${orderHistory.orderStatus ==2}"><%--已接单未配送--%>
                            <br/>
                            <a href="javascript:void(0)" class="setOrderStatus" orderId="${orderHistory.id}" setOrderStatus="3">已送出</a>
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
            window.open("${pageContext.request.contextPath}/orderStatusServlet.do?what=orderDetail&orderHistoryNo=" +orderHistoryNo)
        });
        //订单状态操作
        $(".setOrderStatus").click(function () {
            var orderId = $(this).attr("orderId");
            var setOrderStatus = $(this).attr("setOrderStatus");
            var boo = false;
            if (setOrderStatus ==2) {
                if (confirm("确认接单吗？")) {
                    boo = true;
                }
            } else if (setOrderStatus ==3) {
                if (confirm("外卖已经送出了吗？")) {
                    boo = true;
                }
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
                        if (setOrderStatus ==2) {
                            alert("接单成功！");
                        } else if (setOrderStatus ==3) {
                            alert("配送成功！");
                        }
                    } else {
                        if (setOrderStatus ==2) {
                            alert("接单失败！");
                        } else if (setOrderStatus ==3) {
                            alert("配送失败！");
                        }
                    }
                }
            });
        });
    });
</script>