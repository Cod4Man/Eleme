<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/5
  Time: 16:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    #bottomBar-div a {
        text-decoration: none;
        /*color: #999999;*/
        cursor: pointer;
    }
    .mapfooter-link a{
        color: #666666;
    }
    div[class^=footer] a{
        color: #999999;
    }
</style>
<div id="bottomBar-div" class="mapfooter" map-footer="" ALIGN="CENTER" STYLE="color: #999999;position: relative;clear: both;bottom: -50px" >
    <p class="mapfooter-link">
        <a href="javascript:void(0)" ubt-click="1434">我要开店</a>丨
        <a href="javascript:void(0)" ubt-click="1435">联系我们</a>丨
        <a ng-href="javascript:void(0)" ubt-click="1436" href="javascript:void(0)">服务条款和协议</a>丨
        <a ng-href="javascript:void(0)" target="_blank" href="javascript:void(0)">隐私政策</a>丨
        <a href="javascript:void(0)">营业执照</a>丨
        <a href="javascript:void(0)" ubt-click="1437">加入我们</a>丨
        <a href="javascript:void(0)">蜂鸟配送</a>丨
        <a href="//imview.rajax.me/im/html/dishonesty/">失信人员查询</a>
    </p>
    <div class="footer-copyright serif">互联网药品信息服务资格证书:<a href="javascript:void(0)" target="_blank">(蛙)-经营性-2016-0011</a> | 增值电信业务许可证 : <a href="javascript:void(0)" target="_blank">蛙B6-66666666</a> | <a href="javascript:void(0)" target="_blank">蛙ICP备 66666666</a> | <a href="javascript:void(0)" target="_blank">上海工商行政管理</a> Copyright ©2008-2018 厦门口德满信息科技有限公司, All Rights Reserved.</div>
    <div class="footer-police container"><a href="javascript:void(0)" rel="nofollow" target="_blank"></a></div>
</div>
<%--<script language='javascript'>
    window.onload = function ()
    {
        if(navigator.userAgent.indexOf("MSIE")>0) {
            document.getElementById("bottomBar-div").style.top = (document.documentElement.scrollHeight) +'px';
        } else {
            document.getElementById("bottomBar-div").style.top = (document.body.scrollHeight)+'px'
        }
    }
</script>--%>
