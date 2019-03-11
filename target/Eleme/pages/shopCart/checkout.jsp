<%-- <%@page import="com.cod4man.eleme.pojo.Foods"%> --%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@include file="../common/common.jsp"%>
<%-- <%@include file="../common/common.jsp"%> --%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>确认下单</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" style="text/css" href="${pageContext.request.contextPath}/css/checkout.css">
  </head>
  <script type="text/javascript">
$(document).ready(function(){
  	function addOption(){
  	var arr = ["0:00","1:00","2:00","3:00","4:00","5:00","6:00","7:00","8:00","9:00","10:00","11:00","12:00","13:00","14:00","15:00","16:00","17:00","18:00","19:00","20:00","21:00","22:00","23:00","24:00"];
  	var time = 0;	
  		$.each(arr, function(){ 
  		 $("#time").append("<option value='"+time+"'>"+this+"</option>");
  		 time+=1;    
		});
  	}
 	function getNow(s) {
		return s < 10 ? '0' + s: s;
	}
	function getShopId(){
  	    var consumerNo = "${sessionScope.consumer.consumerNo}"
		var myDate = new Date();		//获取当前年
		var year=myDate.getFullYear();	//获取当前月
		var month=myDate.getMonth()+1;	//获取当前日
		var date=myDate.getDate(); 
		var h=myDate.getHours();       //获取当前小时数(0-23)
		var m=myDate.getMinutes();     //获取当前分钟数(0-59)
		var s=myDate.getSeconds(); 
		//var ms=myDate.getMilliseconds(); //获取毫秒值
		var now=consumerNo + year+getNow(month)+getNow(date)+getNow(h)+getNow(m)+getNow(s);
		$("#shopId").val(now);
	}
  	getShopId();
  	addOption();
});
  </script>
  <body style="background-color: #bcfc93;">
<div id="tou">
	<jsp:include page="${pageContext.request.contextPath}/pages/topBar.jsp"/>
  	 <%-- <jsp:include page="${pageContext.request.contextPath}/pages/topBar.jsp"/> --%>
</div>
<div id="body">
<form action="<%=request.getContextPath()%>/testServlet.do?opr=checkout&restaurantNo=${param.restaurantNo}" method="post">
  	<div id="left">
  			<table>
  				<tr>
  					<td colspan="2"><h2>订单详情</h2></td>
                    <td >
                     <a href="javascript:location.href='${pageContext.request.contextPath}/restaurant.do?info=findById&id=${param.restaurantNo}'">返回商家修改..</a>
                    </td>
  				</tr>
  				<tr style="height: 35px">
  					<td colspan="3"><h3>订单号:&nbsp;&nbsp;&nbsp;<input name="WIDout_trade_no" style="color:#EE0000; font-size:20px; border-width:0;width: 260px" type="text" id="shopId" readonly="true"></h3></td>
  				</tr>
  				<tr style="height: 35px">
  					<td colspan="2"><h4>订单名称:&nbsp;&nbsp;&nbsp;<input name="WIDsubject" style="color:#EE0000;font-size:18px; border-width:0;" type="text" id="shopName" readonly="true" value="${param.restaurantName}"></h4></td>
  				</tr>
  				<tr style="height: 50px">
  					<td>商品</td><td>份数</td><td>价格(元)</td>
  				</tr>
  					${body}
  			</table>

  			<span style="position: relative;left:70%;">
  			<br>
  			总价格:<input name="WIDtotal_amount" style="color:#EE0000; font-size:30px; border-width:0; width: 100px;" type="text" id="shopPrice" readonly="true" value="${jiage}">
 			<br>
 			共${fenshu}份商品<input type="hidden" readonly="true" value="${fenshu}">
 	 		</span>
 	 </div>
  	 <div id="right">
  		<ul style="list-style-type: none">
  		<li><span style="font-size: 30px; font-family: fantasy;">收货地址:</span><button style="display: none;float: right; margin-right: 40px;">修改地址</button></li>
		<li>
            <input readonly="true" name="dizhi" title="默认地址" style=" display: none;width:95%;height: 100px; resize:none; " value="${sessionScope.consumer.consumerAddressChecked.id}"/>
            ${sessionScope.consumer.consumerAddressChecked.name}${sessionScope.consumer.consumerAddressChecked.phoneNum}<br/>
            ${sessionScope.consumer.consumerAddressChecked.comment}
        </li>
  		<br>
  		<li><h2>其他信息</h2></li>
  		<table>
  			<tr>
  				<td style="width: 100px; height: 50px;">配送时间</td>
  				<td >
  					<select id="time">
  						<option value="-1" selected="selected">立即配送</option>
  					</select>
  				</td>
  			</tr>

  			<tr>
  				<td style="width: 100px; height: 50px;">餐具份数</td>
  				<td >
  					<select id="tableware" >
  						<option value="-1" selected="selected">为选择:</option>
  						<option value="1">1份</option>
  						<option value="2">2份</option>
  						<option value="3">3份</option>
  						<option value="4">4份</option>
  						<option value="5">5份</option>
  						<option value="6">6份</option>
  					</select>
  				</td>
  			</tr>

  			<tr>
  				<td style="width: 100px; height: 50px;">订单备注:</td>
  				<td><input name="WIDbody" value="" type="text" style="width: 200px;"></td>
  			</tr>
  		</table>
  		<input id="sumbit" type="submit" value="确认下单">
  		</ul>
  	 </div>
  	 </form>
	<jsp:include page="${pageContext.request.contextPath}/pages/bottomBar.jsp"/>
</div>

</body>
</html>
