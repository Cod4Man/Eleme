<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/1
  Time: 17:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/common.jsp"%>
<a id="loginInner-a" href="javascript:void(0)">
    <img class="goConsumerCore" id="consumerPortrait" src="${pageContext.request.contextPath}/images/consumer/${sessionScope.consumer.consumerPortraitURL}">
</a>
<%--//悬浮事件--%>
<div id="goConsumer" style="display: none">
    <a class="goConsumerCore" href="javascript:void(0)" id="consumerCore">个人中心</a><br>
    <a href="javascript:void(0)" id="logout">注销</a>
</div>
<script>
    $(document).ready(function(){
        //注销
        $("#logout").click(function () {
            if (confirm("确定要注销该账户吗？")) {
                $("#goConsumer").load("${pageContext.request.contextPath}/pages/removeSessionConsumer.jsp");
                alert("注销成功！")
                location.reload();
            }
        });
        $("#consumerPortrait").mouseenter(function () {
            $("#goConsumer").css("display","block")
        });
        $("#goConsumer").mouseleave(function () {
            $(this).css("display","none")
        })
        //进入个人中心
        $(".goConsumerCore").click(function () {
            location.href = "${pageContext.request.contextPath}/pages/consumers/consumerCenter.jsp";
        });
    });
</script>