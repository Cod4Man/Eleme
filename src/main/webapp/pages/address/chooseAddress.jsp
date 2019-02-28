<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/2/21
  Time: 16:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="http://api.map.baidu.com/api?v=2.0&ak=5jREYhf5kGPrexqwMz8X4SmirVREay4O"></script>
<%@include file= "/pages/common/common.jsp"%>
<%--<script src="http://api.map.baidu.com/location/ip?ip=192.168.1.103&ak=5jREYhf5kGPrexqwMz8X4SmirVREay4O&coor=bd09ll"></script>--%>
<html>
<head>
    <style type="text/css">
        body, html{width: 100%;height: 100%;margin:0;font-family:"微软雅黑";font-size:14px;}
        #l-map{height:100%;width:91%;float: left;}
        #r-result{width:8%;float: left;}
    </style>
    <title>地址选择</title>
</head>
<body>
<div id="l-map"></div>
<div id="r-result">按地址搜索:<input type="text" id="suggestId" size="20" value="百度" style="width:150px;" /></div>
<div id="searchResultPanel" style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;"></div>
</body>
</html>
<script type="text/javascript">
    //初始化定位
    var geolocation = new BMap.Geolocation();
    geolocation.getCurrentPosition(function(r){
        if(this.getStatus() == BMAP_STATUS_SUCCESS){
            var mk = new BMap.Marker(r.point);
            map.addOverlay(mk);
            mk.setAnimation(BMAP_ANIMATION_BOUNCE);
            // map.panTo(r.point);
            // setLocation(r.point);
        }else {
            $("#start").attr("placeholder","请输入您的当前位置")
            alert('无法定位到您的当前位置，导航失败，请手动输入您的当前位置！'+this.getStatus());
        }
    },{enableHighAccuracy: true});
    // 百度地图API功能
    function G(id) {
        return document.getElementById(id);
    }
    var map = new BMap.Map("l-map");
    map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
    map.centerAndZoom("厦门",12);                   // 初始化地图,设置城市和地图级别。
    var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
        {"input" : "suggestId"
            ,"location" : map
        });
    ac.addEventListener("onhighlight", function(e) {  //鼠标放在下拉列表上的事件
        var str = "";
        var _value = e.fromitem.value;
        var value = "";
        if (e.fromitem.index > -1) {
            value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
        }
        str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;
        value = "";
        if (e.toitem.index > -1) {
            _value = e.toitem.value;
            value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
        }
        str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
        G("searchResultPanel").innerHTML = str;
    });
    var myValue;
    ac.addEventListener("onconfirm", function(e) {    //鼠标点击下拉列表后的事件
        var _value = e.item.value;
        myValue = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
        G("searchResultPanel").innerHTML ="onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;
        setPlace();
    });
    function setPlace(){
        map.clearOverlays();    //清除地图上所有覆盖物
        function myFun(){
            var pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
            map.centerAndZoom(pp, 18);
            var marker2 = new BMap.Marker(pp);
            map.addOverlay(marker2);    //添加标注
            marker2.setAnimation(BMAP_ANIMATION_BOUNCE);
        }
        var local = new BMap.LocalSearch(map, { //智能搜索
            onSearchComplete: myFun
        });
        local.search(myValue);
    }
    var addComp;
    var geoc = new BMap.Geocoder();
    //鼠标点击事件
    function showInfo(e){
        var pt = e.point;
        var pointLng = pointLng = e.point.lng;
        var pointlat = pointlat = e.point.lat;
        var marker = new BMap.Marker(new BMap.Point(pointLng,pointlat));  // 创建标注
        map.clearOverlays();
        map.addOverlay(marker);
        marker.setAnimation(BMAP_ANIMATION_BOUNCE);
        var province ="" ;
        var city=""  ;
        var district=""  ;
        var street ="" ;
        var streetNumber ="" ;
        var business = "";
        var addComp;
        geoc.getLocation(pt, function(rs) {
            addComp = rs.addressComponents;
            province = addComp.province.toString();
            city = addComp.city.toString();
            district = addComp.district.toString();
            street = addComp.street.toString();
            streetNumber = addComp.streetNumber.toString();
            business = rs.business.toString();
            if (confirm("是否设置该地址为收获地址?")) {
                // alert("维度：" +pointLng + "经度： " + pointlat + "商圈：" + business
                //     + "省份：" + province + "城市：" + city + "区域：" + district
                //     + "街道：" + street + "门牌号：" + streetNumber);
                if (district == null || district =='') {
                    alert("请具体到区域/县城");
                    return;
                }
                setTimeout(function () {
                    location.href = "${pageContext.request.contextPath}/pages/address/setAddress.jsp?pointLng="+ pointLng + "&pointLat=" +pointlat + "&business=" + business
                        + "&province=" + province + "&city=" + city + "&district=" + district
                        + "&street=" + street + "&streetNumber=" + streetNumber
                        +"&phoneNum=${param.phoneNum}&name=${param.name}&comment="
                        + "${param.comment}&addressChecked=${param.addressChecked}";

                },800)

            }
        });
    }
    //触发点击事件
    map.addEventListener("click", showInfo);
</script>