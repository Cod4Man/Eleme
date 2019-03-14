<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="common/common.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/restaurants.css?v=<%=Math.random()%>"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dist/main.css?v=<%=Math.random()%>">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dist/sortable.min.css?v=<%=Math.random()%>">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/dist/sortable.min.js"></script>--%>
<meta charset="UTF-8">
<title>饿了么首页</title>
<style>
#restname {
	color: red;
}
.rest_type{display: inline-block;}
</style>
<script type="text/javascript">
    $(document).ready(function(){
        //插件
        // $('#sortable')[0].sortablejs();
        var page = 0;
        //滚动条下拉事件
            $(document).scroll(function(){
                var type = $("#ttyy").val();
                var info = "findAll";
                if(type!="findAll"&&type!="全部"){
                    info= "type";
                }
                if($(document).scrollTop()>1050*(1+ page/20)){
                    page = page+20;
                    // $("#sortable").load("/page.do", "type="+type+"+&page="+page+"&info="+info);
/*                    $.ajax({
                        url:"page.do",
                        type : "get",
                        dataType : "html",
                        data:"type="+type+"+&page="+page+"&info="+info,
                        success : function (result) {
                            alert("ttt" + result)
                            $("#sortable").html(result);
                        }
                    });*/
                    $.ajax({
                        url:"page.do",
                        dataType : "json",
                        data:"type="+type+"+&page="+page+"&info="+info,
                        success:function (result){
                            if(result.length==0){
                                $("#noRestaurant").html("我们是有底线的！");
                            }else{
                                // $("#restList2").load();
                                for (var i=0;i<result.length;i++){
                                    // if(i%4==0){$("#trp").append("<tr height=\"1px\"></tr>");};
                                    $("#trp").append("<div onclick=\"location.href='<%=request.getContextPath()%>/restaurant.do?info=findById&id="+result[i].restaurantNo+"'\"  class='restaurantDiv' style=\"float:left;margin: 25px;height: 150px;width: 300px;\"><div><img src=\"${pageContext.request.contextPath}/images/restaurant/"+result[i].restaurantPortraitURL+"\"/></div><div><span id=\"typename\" onclick=\"lookRest()\" width=\"200px\" style=\"color:red\" >"+result[i].restaurantName+"</span></div></div>");
                                }
                            };
                        }
                    });
                }
            })


        function lookRest() {
            var name = $("#typename").text();
            var path = $("#hidd").val();
            location.href=path+"/restaurant.do?info=findByName&name="+name;
        }

        function getType(type){
            $.ajax({
                url : "${pageContext.request.contextPath}/type.do",
                data : "type=" + type  ,
                type : "post",
                dataType : "JSON",
                success : function (result){
                    $("#tb").html("");
                    for(var i in result){
                        $("#tb").append("<div onclick=\"location.href='<%=request.getContextPath()%>/restaurant.do?info=findById&id="+result[i].restaurantNo+"'\" class='restaurantDiv'><div><img src=\"${pageContext.request.contextPath}/images/restaurant/"+result[i].restaurantPortraitURL+"\"/></div><div  class=\"restname\" restaurantNo=\""+ result[i].restaurantNo +"\"  width=\"200px\" style=\"color:red\" >"+result[i].restaurantName+"</div></div></div>");
                    };
                }
            })
        }
        getType("全部");
        x();
        function x(){
            $("#rest_type").find("li").click(function () {
                //导航栏样式
                $("#rest_type").find("a[class^=three-d]").attr("class", "three-d  active/* nav__link*/");
                $(this).find("a[class^=three-d]").attr("class", "three-d active  active/* nav__link*/");
                var type = $(this).find(".front").text();
                $("#ttyy").val(type);
                getType(type);
            });
        }
    });
</script>
</head>
<body style="background-color: #fcf2dc;">
<div >
    <jsp:include page="${pageContext.request.contextPath}/pages/topBar.jsp"/>
    <%--<%@include file= "consumerAddressCheckedBar.jsp"%>--%>
    <jsp:include page="${pageContext.request.contextPath}/pages/consumerAddressCheckedBar.jsp"/>
    <div id="restList" style="margin: 0px 80px">
        <main class="sortable">
            <div class="container">
                <div id="nav" class="wrapper" style="float: left" align="center">

                    <ul id="rest_type" class="nav-menu clearfix unstyled <%--sortable__nav nav--%>">
                        <li class="rest_type"><a href="#" class="three-d active<%-- nav__link--%>" data-sjslink="all">
                            全部
                            <span class="three-d-box"><span class="front">全部</span><span class="back">全部</span></span>
                        </a></li>
                        <li class="rest_type"><a href="#" class="three-d<%-- nav__link--%>" data-sjslink="快餐便当">
                            快餐便当
                            <span class="three-d-box"><span class="front">快餐便当</span><span class="back">快餐便当</span></span>
                        </a></li>
                        <li class="rest_type"><a href="#" class="three-d<%-- nav__link--%>" data-sjslink="商店超市">
                            商店超市
                            <span class="three-d-box"><span class="front">商店超市</span><span class="back">商店超市</span></span>
                        </a></li>
                        <li class="rest_type"><a href="#" class="three-d<%-- nav__link--%>" data-sjslink="营养快餐">
                            营养快餐
                            <span class="three-d-box"><span class="front">营养快餐</span><span class="back">营养快餐</span></span>
                        </a></li>
                        <li class="rest_type"><a href="#" class="three-d<%-- nav__link--%>" data-sjslink="汉堡超市">
                            汉堡超市
                            <span class="three-d-box"><span class="front">汉堡超市</span><span class="back">汉堡超市</span></span>
                        </a></li>
                    </ul>

                    <div id="dtb" style=" padding-top: 50px">
                        <div id="tb">
                            <div   class='restaurantDiv' onclick="location.href='<%=request.getContextPath()%>/restaurant.do?info=findById&id=${relist.restaurantNo }'">
                                <c:forEach items="${relist }" var="relist" varStatus="i">
                                <div style="width: 380px; height: 30px"><img
                                        src="${relist.restaurantPortraitURL }"><span id="restname">${relist.restaurantName }</span></div>
                            </c:forEach>
                            </div>
                        </div>
                        <div id="trp"></div>
                    </div>
                </div>
            </div>
    </main>
    </div>
</div>
	<input type="hidden" id="hidd" value="<%=request.getContextPath()%>" />
    <input type="hidden" id="ttyy" value="findAll" />
<div style="clear: both;color: #999999" align="center">
    <h2 id="noRestaurant"></h2>
</div>
<jsp:include page="${pageContext.request.contextPath}/pages/bottomBar.jsp"/>
</body>
</html>