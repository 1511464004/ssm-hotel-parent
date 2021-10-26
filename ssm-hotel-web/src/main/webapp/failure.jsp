<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>访问失败</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/lib/layui-v2.6.3/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/error.css">

    <style>
        .listen-btn a{
            color: #ffffff;
        }
        .listen-btn a:hover{
            color: #ffffff;
        }
    </style>
</head>
<body marginwidth="0" marginheight="0">
<div class="page-loading">
    <div class="ball-loader">
        <span></span><span></span><span></span><span></span>
    </div>
</div>
<div class="error-page">
    <img class="error-page-img" src="${pageContext.request.contextPath}/static/layui/images/ic_404.png">
    <div class="error-page-info">
        <h2>您的账号或者密码有误！</h2>
        <div class="error-page-info-desc">访问失败</div>
        <div>
            <button class="layui-btn listen-btn"><a href="/">返回首页</a></button>
        </div>
    </div>
</div>