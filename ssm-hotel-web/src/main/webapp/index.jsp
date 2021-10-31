<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" class="fly-html-layui fly-html-store">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/layui/dist/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/global.css" charset="utf-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/global(1).css" charset="utf-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/store.css" charset="utf-8">
    <link rel="icon" href="${pageContext.request.contextPath}/statics/images/favicon.ico">
    <title>首页-欢迎来到冰冰酒店</title>
</head>
<body>
<!-- 顶部start -->
<div class="layui-header header header-store" style="background-color: #393D49;">
    <div class="layui-container">
        <a class="logo" href="/index">
            <img src="${pageContext.request.contextPath}/statics/images/logo.png" alt="layui">
        </a>
        <div class="layui-form component" lay-filter="LAY-site-header-component"></div>
        <ul class="layui-nav" id="layui-nav-userinfo">
            <li data-id="index" class="layui-nav-item layui-hide-xs layui-this">
                <a class="fly-case-active" data-type="toTopNav" href="/">首页</a>
            </li>
            <li data-id="room" class="layui-nav-item layui-hide-xs">
                <a class="fly-case-active" data-type="toTopNav" href="/room/list.html">房间</a>
            </li>
            <li data-id="login" class="layui-nav-item layui-hide-xs ">
                <a class="fly-case-active" data-type="toTopNav" <c:if test="${account.id != null}">style="visibility:hidden"</c:if> href="/login.jsp">登入</a>
            </li>
            <li data-id="register" class="layui-nav-item layui-hide-xs ">
                <a class="fly-case-active" data-type="toTopNav" <c:if test="${account.id != null}">style="visibility:hidden"</c:if> href="/register.jsp">注册</a>
            </li>
            <li data-id="register" class="layui-nav-item layui-hide-xs ">
                <a class="fly-case-active" data-type="toTopNav" <c:if test="${account.id == null}">style="visibility:hidden"</c:if> href="/logout">退出登录</a>
            </li>
            <span class="layui-nav-bar" style="left: 560px; top: 55px; width: 0px; opacity: 0;"></span>
        </ul>
    </div>
</div>
<!-- 顶部end -->

<!-- 中间区域开始 -->
<div class="shop-nav shop-index">
    <!--搜索 start-->
    <div id="LAY-topbar" style="height: auto;">
        <form class="layui-form layuimini-form">
            <div class="input-search">
                <div id="searchRoom">
                    <input type="text" placeholder="搜索你需要的房间" name="keywords" id="searchKeywords"
                           autocomplete="off" value="">
                    <button class="layui-btn layui-btn-shop" lay-submit="" lay-filter="searchHotelRoom"
                            style="background-color: #009688"><i
                            class="layui-icon layui-icon-search"></i></button>
                </div>
                <div class="layui-container layui-hide-xs"><a href="#" class="topbar-logo"> <img
                        src="${pageContext.request.contextPath}/statics/images/logo-1.png" alt="layui"> </a>
                </div>
            </div>
        </form>
    </div>
    <!--搜索 end-->
    <div class="shop-banner">
        <!-- 左侧导航开始 -->
        <div class="layui-container layui-hide-xs">
            <div class="product-list">
                <dl id="getIndexRoomType">
                    <dt style="background-color: #009688"><a href="lists.html" target="_blank">房间分类</a></dt>
<%--                                        <dd data-id="1"><a class="fly-case-active" href="JavaScript:void(0);" data-type="toRoomTypeList">单人间</a></dd>--%>
<%--                                        <dd data-id="2"><a class="fly-case-active" href="JavaScript:void(0);" data-type="toRoomTypeList">双人间</a></dd>--%>
                </dl>
            </div>
        </div>
        <!-- 左侧导航结束 -->

        <!-- 轮播图开始 -->
        <div class="layui-carousel" lay-filter="LAY-store-banner" id="LAY-store-banner" lay-anim lay-indicator="inside">
            <div carousel-item>
                <div class="">
                    <div class="layui-container">
                        <a href="javascript:;" target="_blank">
                            <img src="${pageContext.request.contextPath}/statics/images/2.jpg" alt="酒店系统">
                        </a>
                    </div>
                </div>
                <div class="">
                    <div class="layui-container">
                        <a href="javascript:;" target="_blank">
                            <img src="${pageContext.request.contextPath}/statics/images/3.jpg" alt="酒店系统">
                        </a>
                    </div>
                </div>
                <div class="layui-this">
                    <div class="layui-container">
                        <a href="javascript:;" target="_blank">
                            <img src="${pageContext.request.contextPath}/statics/images/4.jpg" alt="酒店系统">
                        </a>
                    </div>
                </div>
                <div class="">
                    <div class="layui-container">
                        <a href="javascript:;" target="_blank">
                            <img src="${pageContext.request.contextPath}/statics/images/5.jpg" alt="酒店系统">
                        </a>
                    </div>
                </div>
                <div class="">
                    <div class="layui-container">
                        <a href="javascript:;" target="_blank">
                            <img src="${pageContext.request.contextPath}/statics/images/1.jpg" alt="酒店系统">
                        </a>
                    </div>
                </div>
                <div class="">
                    <div class="layui-container">
                        <a href="javascript:;" target="_blank">
                            <img src="${pageContext.request.contextPath}/statics/images/6.jpg" alt="酒店系统">
                        </a>
                    </div>
                </div>
            </div>


            <div class="layui-carousel-ind">
                <ul>
                    <li class=""></li>
                    <li class=""></li>
                    <li class="layui-this"></li>
                    <li class=""></li>
                    <li class=""></li>
                    <li class=""></li>
                </ul>
            </div>
            <button class="layui-icon layui-carousel-arrow" lay-type="sub"></button>
            <button class="layui-icon layui-carousel-arrow" lay-type="add"></button>
        </div>
        <!-- 轮播图结束 -->

        <!-- 酒店楼层开始 -->
        <div class="shop-temp" id="getIndexFloor">

            <c:forEach var="floor" items="${floorList}" varStatus="status">
                <%-- 如果是偶数行，背景颜色为白色 --%>
            <c:if test="${status.index%2==0}">
            <div class="temp-hot">
                </c:if>
                <c:if test="${status.index%2!=0}">
                <div class="temp-normal" style="background-color: #f2f2f2">
                    </c:if>
                    <div class="layui-container">
                        <p class="temp-title-cn"><span></span>酒店${floor.floorName}<span></span></p>
                        <div class="layui-row layui-col-space20">
                            <c:forEach var="room" items="${roomList}">
                                <c:if test="${room.floorId == floor.id }">
                                    <div data-id="${room.id}" class="layui-col-xs6 layui-col-md3">
                                        <a class="template store-list-box fly-case-active"
                                           href="/room/detail/${room.id}.html" data-type="toRoomInfo">
                                            <img src="http://localhost:8080/upload/room-pic/main/${room.photo}"
                                                 class="store-list-cover">
                                            <h2 class="layui-elip">${room.title}</h2>
                                            <p class="price"><span title="金额"> ￥${room.roomType.price} </span>
                                                <span title="房号"
                                                      style="color:  #fff;background: #0e88cc;padding: 3px;text-align: center;border: 1px solid #4cffb3;font-size: 13px;"> NO.${room.roomNum} </span>
                                            </p>
                                        </a>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                </c:forEach>

            </div>
            <!-- 酒店楼层结束 -->

        </div>
    </div>
    <!-- 中间区域结束 -->
</div>
    <!-- 底部 -->
    <div class="fly-footer">
        <p><a href="#">酒店系统</a> 2020 © 冰冰
    </div>


    <!-- 脚本开始 -->
    <script src="${pageContext.request.contextPath}/statics/layui/dist/layui.js"></script>
    <script>
        layui.use(["form", "element", "carousel"], function () {
            var form = layui.form,
                layer = layui.layer,
                element = layui.element,
                carousel = layui.carousel,
                $ = layui.$;

            //渲染轮播图
            carousel.render({
                elem: '#LAY-store-banner'
                , width: '100%' //设置容器宽度
                , height: '460' //设置容器高度
                , arrow: 'always' //始终显示箭头
            });

            //加载房间分类
            $.get("/roomType/roomTypeList", function (result) {
                var html = "";
                for (let i = 0; i < result.length; i++) {
                    html += "<dd data-id='" + result[i].id + "'>";
                    html += "<a class='fly-case-active' href='/room/list/" + result[i].id + ".html' data-type='toRoomTypeList'>" + result[i].typeName + "</a>";
                    html += "</dd>";
                }
                //将网页追加到dl标签中
                $("#getIndexRoomType").append(html);
            }, "json");
        });
    </script>
    <!-- 脚本结束 -->
    <ul class="layui-fixbar">
        <li class="layui-icon layui-fixbar-top" lay-type="top" style=""></li>
    </ul>
    <div class="layui-layer-move"></div>
</body>
</html>
