<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <%-- 获取CSRF Token --%>
    <meta name="_csrf" content="${_csrf.token}"/>
    <%-- 获取CSRF头 默认为X-CSRF-TOKEN --%>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <meta charset="utf-8">
    <title>用户管理页面</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/lib/layui-v2.6.3/css/layui.css"
          media="all">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/layui/lib/font-awesome-4.7.0/css/font-awesome.min.css"
          media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layuimini.css?v=2.0.4.2"
          media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/themes/default.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/public.css" media="all">

    <%--  引入dtree.css  --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui_ext/dtree/dtree.css">
    <%--  引入dtree-font.css  --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui_ext/dtree/font/dtreefont.css">
</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">
        <div class="layui-row">
            <%--     左侧菜单树       --%>
            <div class="layui-col-md2">
                <%--     树节点容器开始       --%>
                <ul id="menuTree" class="dtree" data-id="0" style="width: 240px;"></ul>
                <%--     树节点容器结束       --%>
            </div>

            <%--     右侧数据表格       --%>
            <div class="layui-col-md10">
                <%--     表格工具栏       --%>
                <script type="text/html" id="toolbarDemo">
                    <div class="layui-btn layui-btn-normal layui-btn-sm data-add-btn" lay-event="add">
                        <i class="layui-icon layui-icon-add-1"></i>添加
                    </div>
                </script>

                <%--     数据表格       --%>
                <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>

                <%--     行工具栏       --%>
                <script type="text/html" id="currentTableBar">
                    <a class="layui-btn layui-btn-xs data-count-edit" lay-event="edit">
                        <i class="layui-icon layui-icon-add-1"></i>编辑</a>
                    <a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete">
                        <i class="layui-icon layui-icon-close"></i>关闭</a>
                </script>

                <%--    添加和修改的窗口区域    --%>
                <div style="display: none;padding: 5px" id="addOrUpdateWindow">
                    <form class="layui-form" style="width: 90%;" id="dataFrm" lay-filter="dataFrm">
                        <%--    菜单编号    --%>
                        <input type="hidden" name="id">

                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">父级菜单</label>
                                <div class="layui-input-block">
                                    <input type="hidden" name="pid" id="pid">
                                    <ul id="menuSelectTree" class="dtree" data-id="0"></ul>
                                </div>
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">菜单名称</label>
                            <div class="layui-input-block">
                                <input type="text" name="title" autocomplete="off"
                                       lay-verifty="required"
                                       placeholder="请输入菜单名称" class="layui-input">
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">菜单地址</label>
                            <div class="layui-input-block">
                                <input type="text" name="href" autocomplete="off"
                                       lay-verifty="required"
                                       placeholder="请输入菜单地址" class="layui-input">
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">菜单图标</label>
                            <div class="layui-input-block">
                                <input type="text" name="icon" id="iconPicker"
                                       autocomplete="off" lay-filter="iconPicker"
                                       lay-verifty="required"
                                       placeholder="请输入菜单图标" class="layui-input">
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">是否展开</label>
                                <div class="layui-input-block">
                                    <input type="radio" name="spread" value="1" title="是">
                                    <input type="radio" name="spread" value="0" title="否" checked>
                                </div>
                            </div>
                        </div>

                        <div class="layui-form-item layui-row layui-col-xs12">
                            <div class="layui-input-block" style="text-align: center;">
                                <button type="button" class="layui-btn" lay-submit lay-filter="doSubmit">
                                    <span class="layui-icon layui-icon-add-1"></span>提交
                                </button>
                                <button type="reset" class="layui-btn layui-btn-warm">
                                    <span class="layui-icon layui-icon-refresh-1"></span>清空
                                </button>
                                <button type="button" class="layui-btn layui-btn-danger" id="resetMenu">
                                    <span class="layui-icon layui-icon-return"></span>返回
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

<%--导入layui的js文件--%>
<script src="${pageContext.request.contextPath}/static/layui/lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
<script>
    layui.extend({
        dtree:"${pageContext.request.contextPath}/static/layui_ext/dtree/dtree"
    }).use(["layer","table","form","jquery","dtree"],function () {
        var layer = layui.layer,
            table = layui.table,
            $ = layui.jquery,
            form = layui.form,
            dtree = layui.dtree;

        //获取<meta>标签中封装的CSRF Toekn
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");
        //将头中的CSRF Token信息进行发送
        $(document).ajaxSend(function (e, xhr, options) {
            xhr.setRequestHeader(header, token);
        });

        //渲染树形组件
        dtree.render({
            elem: "#menuTree",
            url:"/admin/permission/loadMenuTree",
            dataStyle: "layuiStyle",
            response:{message:"msg",statusCode:0}
        });
    });
</script>
</html>
