<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${restaurantName}</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/restaurant.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/shopping.css">
<!--设置样式  -->
<style>

body{
	background-color:#F0F0F0; 
	}	


#tou{
	position:fixed;
	top:0;
	width: 100%; height: 30%; background-image: url("/images/restaurant/picture/food.jpg");background-size:100%;
	}


.food_type {
			display: inline-block;
			margin-left: 20px;margin-right: 20px;
			
			
			}

#ftype {
		position:fixed; top:30%;
		width:72%; height: 15%;
		background-color: white;
	}
	
#gonggao{
		position:fixed; right:20px;top:30%;
		width:25%; height: 50%;
		background-color: white;
		}
		
#dfoods{
		margin-left:60px;
		margin-top:300px;
		width:80%; height: auto;
		}
		
.gouwu,.count,.food_type,#clear,.collectImag {
		cursor:pointer;
		}

#gtop{	
		text-align:left;
		font-size:24px;
		color:white;
		margin-left:-20px;
		width:300px;
		padding-bottom:5px ;
		height:30PX;
		background-color: #1E90FF;
		}

#gg	{
	position:absolute;
	bottom: 0;
	left:10%;
	width:80%;
	font-family:楷体;
	font-size:24px;
	}
	
#gnei{
		text-align:left;
		font-size:18px;
		margin-left:-20px;
		width:300px;
		padding-bottom:5px ;
		height:30PX;
	}
	
.gouwu{
	width:100px;
	height:30px;
	border-radius: 20px;
	background-color:#1E90FF ;
	}
	
.gouwu{
	margin-left: 70px;
	}

.nametd{
	width:150px;
	}
	
#collect{
	position: fixed;
	top: 40px;
	left: 90%;
	}
</style>
<script type="text/javascript">
var restaurantNo = ${restaurantNo};
/*点击获取li标签的值，通过ajax实现通过类型查询  */
$(function(){
    $("#foods_type").find("li").click(function(){
        var type = $(this).text();
		$.ajax({
			url : "foodsfind.do",
			data : "type=" + type+"&info=byType&restaurantNo="+restaurantNo,
			type : "post",
			dataType : "JSON",
			success : function (result){
				$("#food").html("");
				for(var i in result){
					$("#food").append("<tr style=\"width: 425px;height:120px; background-color: white; float: left;margin: 10px;\"  class=\"foods_tb\" ><td><img src=\"${pageContext.request.contextPath}/images/restaurant/"+result[i].foodsPictureURL+"\" /></td><td class=\"nametd\"><span>"+result[i].foodsName+"</span><br/><span >￥"+result[i].foodsPrice +"</span><br/>" +
                            "<span class='star'><span class='vote-star' style='display:inline-block;margin-right:6px;width:75px;height:15px;overflow:hidden;vertical-align:middle;background:url(../images/restaurant/picture/stardark.png) repeat-x;'>" +
                        "                            <i style='width:"+result[i].foodsScore*10+"%;display:inline-block;height:15px;background:url(../images/restaurant/picture/star.png) repeat-x 0;'></i>" +
                        "                        </span><span class='vote-number' style='vertical-align:middle;font-family:微软雅黑,Verdana,Geneva, sans-serif;font-size:12px;'>"+result[i].foodsScore+"分</span></span>"
                        +"</td><td style=\"display: none\">"+result[i].foodsNo+"</td><td class=\"shoptd\"><button id=\"g"+result[i].foodsNo+"\" class=\"gouwu\" style=\"display: inline-block\">加入购物车</button><ul class=\"btn-numbox\" style=\"display: none\"><li><ul class=\"count\"><li><span id=\"num-jian\" class=\"num-jian\">-</span></li><li><input type=\"text\" class=\""+result[i].foodsNo+"\" id=\"input-num\" value=\"1\" /></li><li><span id=\"num-jia\" class=\"num-jia\">+</span></li></ul></li></ul></td></tr>");
				};
			}
		}) 
    });
    
    /*点击将购物车换成加减数量的样式  */
		$( document ).on( "click", ".gouwu", function() {
		    if ($(".right").css("display")!="block") {
                $(".right").css("display","block");
			}
			$(this).css("display","none");
			$(this).next().css("display","inline-block");
			var foodNo = $(this).parent().parent().children("td").eq(2).text();
			var name=$(this).parent().parent().children("td").eq(1).children("span").eq(0).text();
			var price=$(this).parent().parent().children("td").eq(1).children("span").eq(1).text();
		 	var rowTem = "<tr><td id=\"redtNo\" style=\"display: none\">"+foodNo+"</td><td id = \""+name+"\">"+name+"</td><td>"+price+"</td><td id='d"+foodNo+"'><ul class=\"btn-numbox\"><li><ul class=\"count\"><li><span id=\"num-jian\" class=\"num-jian\">-</span></li><li><input type=\"text\" class=\""+foodNo+"\" id=\"input-num\" value=\"1\" /></li><li><span id=\"num-jia\" class=\"num-jia\">+</span></li></ul></li></ul></td></tr>";
			   $("#cheTable").append(rowTem); 
			var cTb = "<tr><td><input name=\""+name+"\" type=\"text\" value=\""+foodNo+"\" /></td><td><ul class=\"btn-numbox\"><li><ul class=\"count\"><li><span id=\"num-jian\" class=\"num-jian\">-</span></li><li><input type=\"text\" name=\""+name+"\" class=\""+foodNo+"\" id=\"input-num\" value=\"1\" /></li><li><span id=\"num-jia\" class=\"num-jia\">+</span></li></ul></li></ul></td></tr>";
				$("#clong").append(cTb);
		});
		/*点击减少数量  */
		$( document ).on( "click", ".num-jian", function() {

			var className2 = $(this).parent().next().find(":input").attr("class");
			var number2 = $("."+className2).val();
			$.ajax({
				url:"${pageContext.request.contextPath}/foods.do",
				data:"info=jian&number="+number2,
				dataType:"text",
				success:function (result){
					if(result==0){
						$("#d"+className2).parent().remove();
						$("#g"+className2).css("display","inline-block");
						$("#g"+className2).next().css("display","none");
						$("."+className2).val(1);
					}else{
						$("."+className2).val(result);
					}

                    //如果减完了就清空购物车
                    var pay = $("#epclear").next().text();
                    if(pay==""||pay==null){
                        $(".right").css("display","none");
                    }
				}
			})

		});


		/*点击增加数量  */
	$( document ).on( "click", ".num-jia", function() {
		var className = $(this).parent().prev().find(":input").attr("class");
		var number = $("."+className).val();
		$.ajax({
			url:"${pageContext.request.contextPath}/foods.do",
			data:"info=jia&number="+number,
			dataType:"text",
			success:function (result){
				$("."+className).val(result);
			}
		})
	});

	$('#addc').click(function(){
		var id=$(this).parent().prev().find("input").val();
		var rowTem = "<tr><td><input name=\""+id+"name\" style=\"width: 60px; height: 35px; font-size: 18px\" type=\"text\" value=\""+id+"\" readonly=\"true\"/></td><td><em class=\"jian\">-</em><input name=\""+id+"value\" style=\"width:30px; font-size: 18px\" type=\"text\" value=\"1\" readonly=\"true\" class=\"num\"/><em class=\"add\">+</em></td></tr>";
		$("#cheTable").append(rowTem);
	});
			

    $('#pay').click(function(){
        var pay = $("#epclear").next().text();
        if(pay==""||pay==null){
            alert("您的购物车是空的哦！")
        }else{
            var x=$("form").serializeArray();
            var y = JSON.stringify(x).replace(/{/g,"ZDKH");
            y = y.replace(/}/g,"YDKH");
            y = y.replace(/\[/g,"ZZKH");
            y = y.replace(/]/g,"YZKH");
            window.location.href ='${pageContext.request.contextPath}/testServlet.do?opr=shop&json='+y+"&restaurantNo="+restaurantNo +"&restaurantName=${restaurantName}";
        }
    })

    $('#che').click(function(){
		$('.right').animate({height:'toggle'},550);
	});
			   

	
	/* 点击收藏或取消收藏 */
		$("#collect").click(function () {
			var addr = $(".collectImag").attr("src");
			$.ajax({
				url:"${pageContext.request.contextPath}/collect.do",
				data:"addr="+addr + "&restaurantNo=" + restaurantNo,
				dataType:"text",
				success:function (result){
					$("#shoucang").html("<img id=\"shoucang\"  class=\"collectImag\"  style=\"float: right;\" src=\"${pageContext.request.contextPath}/images/restaurant/picture/"+result+".png\"/>")
				}
			});
		});
		$(".food_type").click(function () {
			$(".food_type").css({"background-color":"white","font-size":"22px"});
			$(this).css({"background-color":"#EAEAEA","font-size":"26px"});
		})
    //清空购物车
    $("#clear").click(function () {
        $("#clong").html("");
        $("#cheTable tr:gt(0)").remove();
        var pay = $("#epclear").next().text();
            if(pay==""||pay==null){
                $('.right').animate({height:'toggle'},550);
            }

        // $(".btn-numbox").remove();
        $(".gouwu").css("display","inline-block");
        $(".gouwu").next().css("display","none");
        $(".num-jian").parent().next().find(":input").val(1);
    })


});


</script>
</head>
<body style="background-color: #bcfc93;">

	<!--顶部  -->
	<div id="tou">
		<jsp:include page="topBar.jsp"/>
	</div>
    <div id="bodyy">
	
	<!--收藏  -->
	<div id="collect">
		<span id="shoucang">
            <c:if test="${collectBoo == 'true'}" > <%--收藏的--%>
				<img class="collectImag"  style="float: right;cursor: pointer;" src="${pageContext.request.contextPath}/images/restaurant/picture/取消收藏1.png"/>
			</c:if>
            <c:if test="${collectBoo == 'false'}" > <%--没有收藏的--%>
				<img class="collectImag"  style="float: right;cursor: pointer;" src="${pageContext.request.contextPath}/images/restaurant/picture/收藏0.png"/>
			</c:if>
        </span>
	</div>
<!--公告div  -->
<div id="gonggao">
	<ul style="text-align: center;">
		<li id="gtop">商家公告</li>
		<li id="gnei">${notice }</li>
		<li id="gg">举报商家</li>
	</ul>
</div>
<!--ajax食物种类  -->
<div id="ftype">
	<ul id="foods_type" style="font-size: 22px;">
		<li class="food_type">全部</li>
		<c:forEach items="${foodsTypeList }" var="foodsType">
			<li class="food_type">${foodsType.type}</li>
		</c:forEach>
	</ul>
</div>	
<!--食物列表  -->
<div id="dfoods">
	<table id="food">
	<tr id="fone"></tr>
		<c:forEach items="${foodsList }" var="foods" varStatus="status">
			<tr class="foods_tb" style="width: 425px;height:120px; background-color: white; float: left;margin: 10px;">
				<td><img src="${pageContext.request.contextPath}/images/restaurant/${foods.foodsPictureURL }" /></td>
				<td class="nametd"><span style="font-size:larger;font-weight:900;font-family: 黑体;">${status.count}:${foods.foodsName }</span><br/>
					<span >￥${foods.foodsPrice }</span><br/>
                    <span class='star'>
                        <span class='vote-star' style='display:inline-block;margin-right:6px;width:75px;height:15px;overflow:hidden;vertical-align:middle;background:url(../images/restaurant/picture/stardark.png) repeat-x;'>
                            <i style='width:${foods.foodsScore*10}%;display:inline-block;height:15px;background:url(../images/restaurant/picture/star.png) repeat-x 0;'></i>
                        </span>
                        <span class='vote-number' style='vertical-align:middle;font-family:微软雅黑,Verdana,Geneva, sans-serif;font-size:12px;'>${foods.foodsScore }分</span>
                    </span>
				</td>
				<td style="display: none">${foods.foodsNo}</td>
				<td class="shoptd">
					<button id="g${foods.foodsNo }"  class="gouwu" style="display: inline-block">加入购物车</button>
					<ul  class="btn-numbox" style="display: none">
						<li>
							<ul class="count">
								<li><span id="num-jian" class="num-jian">-</span></li>
								<li><input type="text" class="${foods.foodsNo }" id="input-num" value="1" /></li>
								<li><span id="num-jia" class="num-jia">+</span></li>
							</ul>
						</li>
					</ul>
				</td>
			</tr>
		</c:forEach>
	</table>
</div>
<!--购物车  -->
	<div class="right" style="background-color: white;">
  			<table id="cheTable" style="width:100%;" >
  				<tr id="epclear" style="height: 40px; width:120px;">
  					<td id="clear" colspan="4" style="background-color:	#D3D3D3;; width:auto;height: auto;" >清空购物车</td>
  				</tr>
			</table>
  </div>
   
 <!-- 镜像table -->
 <form>
 	<table id="clong" style="display: none" >
 		
 	</table>
 </form>
  <button id="pay">立即支付</button><button id="che">购物车</button>
</div>
	<jsp:include page="${pageContext.request.contextPath}/pages/bottomBar.jsp"/>
</body>
</html>