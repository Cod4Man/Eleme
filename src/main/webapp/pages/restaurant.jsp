<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${restaurantName}</title>
<link rel="stylesheet"  href="css/restaurant.css">
<link rel="stylesheet"  href="css/shopping.css">
<!--设置样式  -->
<style>
li{display: inline-block;}

</style>
<script type="text/javascript">
var restaurantNo = ${restaurantNo};
/*点击获取li标签的值，通过ajax实现通过类型查询  */
$(function(){
    $("#foods_type").find("li").click(function(){
        var type = $(this).text();
		$.ajax({
			url : "${pageContext.request.contextPath}/foodsfind.do",
			data : "type=" + type+"&info=byType&restaurantNo="+restaurantNo,
			type : "post",
			dataType : "JSON",
			success : function (result){
				$("#food").html("");
				$(".foods_tb").html("");
				for(var i in result){
					$("#food").append("<tr class=\"foods_tb\"><td>"+result[i].foodsName+"</td><td>"+result[i].foodsPrice+"</td><td>"+result[i].foodsScore+"</td><td><ul id=\"g"+result[i].foodsName+"\" class=\"gouwu\" style=\"display: inline-block\">加入购物车</ul><ul class=\"btn-numbox\" style=\"display: none\"><li><ul class=\"count\"><li><span id=\"num-jian\" class=\"num-jian\">-</span></li><li><input type=\"text\" class=\""+result[i].foodsName+"\" id=\"input-num\" value=\"1\" /></li><li><span id=\"num-jia\" class=\"num-jia\">+</span></li></ul></li></ul></td></tr>");
				};
			}
		})
    });
    
    /*点击将购物车换成加减数量的样式  */
		$( document ).on( "click", ".gouwu", function() {
			$(this).css("display","none");
			$(this).next().css("display","inline-block");
			var restNo = $(this).parent().parent().children("td").eq(1).text();
			var name=$(this).parent().parent().children("td").eq(0).text();
			var price="￥"+$(this).parent().parent().children("td").eq(2).text();
		 	var rowTem = "<tr><td id=\"redtNo\" style=\"display: none\">"+restNo+"</td><td id = \""+name+"\">"+name+"</td><td>"+price+"</td><td><ul class=\"btn-numbox\"><li><ul class=\"count\"><li><span id=\"num-jian\" class=\"num-jian\">-</span></li><li><input type=\"text\" class=\""+name+"\" id=\"input-num\" value=\"1\" /></li><li><span id=\"num-jia\" class=\"num-jia\">+</span></li></ul></li></ul></td></tr>";
			   $("#cheTable").append(rowTem); 
			var cTb = "<tr><td><input name=\""+name+"\" type=\"text\" value=\""+restNo+"\" /></td><td><ul class=\"btn-numbox\"><li><ul class=\"count\"><li><span id=\"num-jian\" class=\"num-jian\">-</span></li><li><input type=\"text\" name=\""+name+"\" class=\""+name+"\" id=\"input-num\" value=\"1\" /></li><li><span id=\"num-jia\" class=\"num-jia\">+</span></li></ul></li></ul></td></tr>";
				$("#clong").append(cTb);
		});
})
$(function () {
		/*点击减少数量  */
		$( document ).on( "click", ".num-jian", function() {
			var className2 = $(this).parent().next().find(":input").attr("class");
			var number2 = $("."+className2).val();
			$.ajax({
                type : "post",
				url:"${pageContext.request.contextPath}/foods.do",
				data:"info=jian&number="+number2,
				dataType:"text",
				success:function (result){
					if(result==0){
						$("#"+className2).parent().remove();
						$("#g"+className2).css("display","inline-block");
						$("#g"+className2).next().css("display","none");
						$("."+className2).val(1);
					}else{
						$("."+className2).val(result);
					}
				}
			})
		});
		
		
		/*点击增加数量  */
	$( document ).on( "click", ".num-jia", function() {
		var className = $(this).parent().prev().find(":input").attr("class");
		var number = $("."+className).val();
		$.ajax({
                type : "post",
			url:"${pageContext.request.contextPath}/foods.do",
			data:"info=jia&number="+number,
			dataType:"text",
			success:function (result){
				$("."+className).val(result);
			}
		})
	});
})

$(function () {
	$('#addc').click(function(){
		var id=$(this).parent().prev().find("input").val();
		var rowTem = "<tr><td><input name=\""+id+"name\" style=\"width: 60px; height: 35px; font-size: 18px\" type=\"text\" value=\""+id+"\" readonly=\"true\"/></td><td><em class=\"jian\">-</em><input name=\""+id+"value\" style=\"width:30px; font-size: 18px\" type=\"text\" value=\"1\" readonly=\"true\" class=\"num\"/><em class=\"add\">+</em></td></tr>";
		$("#cheTable").append(rowTem);
	});
			
	
	$('#pay').click(function(){
		var x=$("form").serializeArray();
		var y = JSON.stringify(x).replace(/{/g,"ZDKH");
		y = y.replace(/}/g,"YDKH");
		y = y.replace(/\[/g,"ZZKH");
		y = y.replace(/]/g,"YZKH");
		
		
		window.location.href ='${pageContext.request.contextPath}/testServlet.do?opr=shop&json='+y+"&restaurantNo="+restaurantNo + "&restaurantName=${restaurantName}" ;
	});
			   
	 $('#che').click(function(){
		$('.right').animate({height:'toggle'},550);
	});
			   
})
	
	
	/* 点击收藏或取消收藏 */
 	$(function () {
		$("#collect").click(function () {
			var addr = $("img").attr("src");
			$.ajax({
                type : "post",
				url:"${pageContext.request.contextPath}/collect.do",
				data:"addr="+addr + "&restaurantNo=${restaurantNo}" ,
				dataType:"text",
				success:function (result){
					$("#shoucang").html("<img id=\"shoucang\" style=\"float: right;\" src=\"${pageContext.request.contextPath}/images/restaurant/picture/"+result+".png\"/>")
				}
			});
		});
	});
 	
</script>
</head>
<body>
	<div id="collect">
		<span id="shoucang">
            <c:if test="${collectBoo == 'true'}" > <%--收藏的--%>
                <img  style="float: right;cursor: pointer;" src="${pageContext.request.contextPath}/images/restaurant/picture/取消收藏1.png"/>
            </c:if>
            <c:if test="${collectBoo == 'false'}" > <%--没有收藏的--%>
                <img  style="float: right;cursor: pointer;" src="${pageContext.request.contextPath}/images/restaurant/picture/收藏0.png"/>
            </c:if>
        </span>
	</div>


<!--ajax食物种类  -->
	<ul id="foods_type">
		<li class="food_type">全部</li>
		<c:forEach items="${foodsTypeList }" var="foodsType">
			<li class="food_type">${foodsType.type}</li>
		</c:forEach>
	</ul>
	
<!--食物列表  -->
	<table >
		<tr id="food"></tr>
		<c:forEach items="${foodsList }" var="foods">
			<tr class="foods_tb">
				<td >${foods.foodsName }</td>
				<td style="display: none">${foods.foodsNo}</td>
				<td >${foods.foodsPrice }</td>
				<td >${foods.foodsScore }</td>
				<td>
					<ul id="g${foods.foodsName }"  class="gouwu" style="display: inline-block">加入购物车</ul>
					<ul  class="btn-numbox" style="display: none">
						<li>
							<ul class="count">
								<li><span id="num-jian" class="num-jian">-</span></li>
								<li><input type="text" class="${foods.foodsName }" id="input-num" value="1" /></li>
								<li><span id="num-jia" class="num-jia">+</span></li>
							</ul>
						</li>
					</ul>
				</td>
			</tr>
		</c:forEach>
	</table>

<!--购物车  -->
	<div class="right">
  			<table id="cheTable">
  				<tr>
  					<td id="clear">清空购物车</td>
  				</tr>
			</table>
  </div>
   
 <!-- 镜像table -->
 <form>
 	<table id="clong" style="display: none" >
 		
 	</table>
 </form>
  <button id="pay">立即支付</button><button id="che">购物车</button>
</body>
</html>