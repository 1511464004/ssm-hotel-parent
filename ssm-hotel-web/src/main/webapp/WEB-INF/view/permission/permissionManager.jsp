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
                        <i class="layui-icon layui-icon-close"></i>删除</a>
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
                                    <%--    父菜单编号    --%>
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
                                <%--    保存选中图标名称    --%>
                                <input type="hidden" name="icon" id="icon">
                                <input type="text" name="iconFa" id="iconPicker"
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

                            <div class="layui-inline">
                                <label class="layui-form-label">菜单类型</label>
                                <div class="layui-input-block">
                                    <input type="radio" name="type" value="menu" title="菜单" checked
                                           lay-filter="checkPermission">
                                    <input type="radio" name="type" value="permission" title="权限"
                                           lay-filter="checkPermission">
                                </div>
                            </div>
                        </div>
                        <div class="layui-form-item" style="display: none" id="permissionCodeDiv">
                            <label class="layui-form-label">权限编码</label>
                            <div class="layui-input-block">
                                <input type="text" name="permissionCode" autocomplete="off"
                                       placeholder="请输入权限编码" class="layui-input">
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
                                    <span class="layui-icon layui-icon-return"></span>重置父极菜单
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
        dtree: "${pageContext.request.contextPath}/static/layui_ext/dtree/dtree",
        iconPickerFa: "${pageContext.request.contextPath}/static/layui/js/lay-module/iconPicker/iconPickerFa"
    }).use(["layer", "table", "form", "jquery", "dtree", "iconPickerFa"], function () {
        var layer = layui.layer,
            table = layui.table,
            $ = layui.jquery,
            form = layui.form,
            iconPickerFa = layui.iconPickerFa,
            dtree = layui.dtree;

        //获取<meta>标签中封装的CSRF Toekn
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");
        //将头中的CSRF Token信息进行发送
        $(document).ajaxSend(function (e, xhr, options) {
            xhr.setRequestHeader(header, token);
        });

        //渲染树形组件
        var menuTree = dtree.render({
            elem: "#menuTree",
            url: "/admin/permission/loadMenuTree",
            dataStyle: "layuiStyle",
            dataFormat: "list",//配置data的风格为list
            response: {message: "msg", statusCode: 0}//修改response中返回数据的定义
        });

        //树形菜单点击事件
        dtree.on("node('menuTree')", function (obj) {
            tableIns.reload({
                where: {
                    "id": obj.param.nodeId
                },//选择为节点的id值
            });
        });

        var tableIns = table.render({
            elem: '#currentTableId',
            url: '${pageContext.request.contextPath}/admin/permission/list',
            toolbar: '#toolbarDemo',
            cols: [[
                {field: 'id', width: 90, title: '菜单编号', align: 'center'},
                {field: 'title', width: 100, title: '菜单名称', align: 'center'},
                {field: 'type', width: 90, title: '菜单类型', align: 'center'},
                {field: 'permissionCode', minWidth: 100, title: '权限编码', align: 'center'},
                {field: 'href', width: 250, title: '菜单地址', align: 'center'},
                {
                    field: 'icon', width: 90, title: '菜单图标', align: 'center', templet: function (d) {
                        return "<i class='" + d.icon + "'></i>";
                    }
                },
                {
                    field: 'spread', width: 90, title: '是否展开', align: 'center', templet: function (d) {
                        return d.spread == 1 ? "<font color='00bfff'>是</font>" : "<font color='ff4500'>否</font>";
                    }
                },
                {title: '操作', minWidth: 90, toolbar: '#currentTableBar', align: "center"}
            ]],
            page: true,
        });

        // 监听表格头部工具栏事件
        table.on("toolbar(currentTableFilter)", function (obj) {
            switch (obj.event) {  // 监听添加操作
                case 'add':
                    openAddWindow();
                    break;
            }
        });

        // 监听表格行工具栏事件
        table.on("tool(currentTableFilter)", function (obj) {
            switch (obj.event) {  // 监听修改操作
                case 'edit':
                    openUpdateWindow(obj.data);
                    break;
                case 'delete':
                    deleteById(obj.data);
                    break;

            }
        });

        //渲染下拉菜单树组件
        var menuSelectTree = dtree.renderSelect({
            elem: "#menuSelectTree",
            url: "/admin/permission/loadMenuTree",
            dataStyle: "layuiStyle",
            dataFormat: "list",
            response: {message: "msg", statusCode: 0}
        });

        //树形菜单点击事件
        dtree.on("node('menuSelectTree')", function (obj) {
            $("#pid").val(obj.param.nodeId);//将选中的节点ID赋值给父节点隐藏域
        });

        //渲染图标选择器组件
        iconPickerFa.render({
            //选择器，推荐使用input
            elem: '#iconPicker',
            //fa 图标接口
            url: "/static/layui/lib/font-awesome-4.7.0/less/variables.less",
            //是否开启搜索:true/false,默认是true
            search: true,
            page: true,
            limit: 12,
            //点击回调
            click: function (data) {
                //给图标隐藏域赋值
                $("#icon").val("fa " + data.icon);
            },
            //渲染成功后的回调
            success: function (d) {
                console.log(d);
            }
        });

        //监听菜单类型单选按钮的点击事件
        form.on("radio(checkPermission)", function (data) {
            if (data.value == "permission") {
                $("#permissionCodeDiv").show();//显示权限编码区域
            } else {
                $("#permissionCodeDiv").hide();//隐藏
            }
        })

        //重置下拉菜单
        $("#resetMenu").click(function () {
            menuSelectTree.selectResetVal();
        });

        //定义变量，分别保存提交地址和窗口索引
        var url, mainIndex;

        //打开添加窗口
        function openAddWindow() {
            mainIndex = layer.open({
                type: 1,
                title: '添加菜单',
                area: ['800px', '500px'],
                content: $("#addOrUpdateWindow"),//引用的窗口内容
                success: function () {
                    //清空表单数据
                    $("#dataFrm")[0].reset();
                    //提交地址
                    url = "/admin/permission/addPermission";
                    //设置默认图标
                    iconPickerFa.checkIcon('iconPicker','fa fa-star');
                    $("#icon").val("fa fa-star");
                }
            });
        }

        //打开修改窗口
        function openUpdateWindow(data) {
            mainIndex = layer.open({
                type: 1,
                title: '修改菜单',
                area: ['800px', '500px'],
                content: $("#addOrUpdateWindow"),//引用的窗口内容
                success: function () {
                    //提交地址
                    url = "/admin/permission/updatePermission";
                    //表单数据回显
                    form.val("dataFrm", data);
                    //父级下拉菜单树回显  下拉菜单树id , 父节点ID值
                    dtree.dataInit("menuSelectTree",data.pid);
                    dtree.selectVal("menuSelectTree");
                    //图标回显
                    iconPickerFa.checkIcon('iconPicker',data.icon);
                    $("#icon").val(data.icon);
                    //判断当前选中节点是否是一级菜单/请选择
                    if (data.pid == 0) {
                        menuSelectTree.reload();
                    }
                }
            });
        }

        //监听表单提交事件
        form.on("submit(doSubmit)", function (data) {
            //发送请求
            $.post(url, data.field, function (result) {
                if (result.success) {
                    //提示
                    layer.alert(result.message, {icon: 1});
                    //刷新当前表格
                    tableIns.reload();
                    //刷新左侧菜单
                    menuTree.reload();
                    //刷新下拉菜单
                    menuSelectTree.reload();
                    //关闭当前窗口
                    layer.close(mainIndex);
                } else {
                    //提示
                    layer.alert(result.message, {icon: 2});
                }
            }, "json");
            return false;
        });

        /**
         * 删除菜单
         * @param data
         */
        function deleteById(data) {
            //发送请求查询该菜单下是否存在子菜单
            $.get("/admin/permission/checkPermission", {"id": data.id}, function (result) {
                if (result.exist) {
                    layer.msg(result.message, {icon: 0});
                } else {
                    //提示用户是否确认删除
                    layer.confirm("确认要删除 [<font color='#FE784D'>" + data.title + "</font>] 菜单么？", {
                        icon: 3,
                        title: "提示"
                    }, function (index) {
                        //发送删除的请求
                        $.post("/admin/permission/deleteById", {"id": data.id}, function (result) {
                            if (result.success) {
                                //提示
                                layer.alert(result.message, {icon: 1});
                                //刷新当前数据表格
                                tableIns.reload();
                                //刷新左侧菜单
                                menuTree.reload();
                                //刷新下拉菜单
                                menuSelectTree.reload();
                            } else {
                                //提示
                                layer.alert(result.message, {icon: 2});
                            }
                        }, "json");
                        layer.close(index);
                    });
                }
            }, "json");
        }





    });
</script>
</html>
