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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/public.css" media="all">
</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">

        <%--    搜索条件区域    --%>
        <fieldset class="table-search-fieldset">

            <legend>搜索信息</legend>
            <div style="margin: 10px 10px 10px 10px">
                <form class="layui-form layui-form-pane" action="">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">用户姓名</label>
                            <div class="layui-input-inline">
                                <input type="text" name="userName" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">真实姓名</label>
                            <div class="layui-input-inline">
                                <input type="text" name="realName" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">用户性别</label>
                            <div class="layui-input-inline">
                                <select name="sex" autocomplete="off" class="layui-input">
                                    <option value="">请选择性别</option>
                                    <option value="0">男</option>
                                    <option value="1">女</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">所属部门</label>
                            <div class="layui-input-inline">
                                <select name="deptId" autocomplete="off" class="layui-input">
                                    <option value="">请选择部门</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">开始日期</label>
                            <div class="layui-input-inline">
                                <input type="text" name="startDate" id="startTime" autocomplete="off"
                                       class="layui-input" readonly>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">结束日期</label>
                            <div class="layui-input-inline">
                                <input type="text" name="endDate" id="endTime" autocomplete="off" class="layui-input"
                                       readonly>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-input-block" style="text-align: center">
                                <button type="submit" class="layui-btn" lay-submit lay-filter="data-search-btn">
                                    <i class="layui-icon"></i>搜索
                                </button>
                                <button type="reset" class="layui-btn layui-btn-warm">
                                    <i class="layui-icon layui-icon-refresh-1"></i>重置
                                </button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </fieldset>

        <%--    表格工具栏区域    --%>
        <script type="text/html" id="toolbarDemo">
            <div class="layui-btn-container">
                <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn" lay-event="add">
                    <i class="layui-icon layui-icon-add-1"></i>添加
                </button>
            </div>
        </script>

        <%--    表格区域    --%>
        <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>

        <%--    行工具栏区域    --%>
        <script type="text/html" id="currentTableBar">
            <a class="layui-btn layui-btn-xs data-count-edit" lay-event="edit">
                <i class="layui-icon layui-icon-edit"></i>编辑</a>
            <a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete">
                <i class="layui-icon layui-icon-close"></i>删除</a>
            <button class="layui-btn layui-btn-xs layui-btn-warm" lay-event="resetPwd">
                <i class="layui-icon layui-icon-refresh"></i>重置密码
            </button>
            <button class="layui-btn layui-btn-xs" lay-event="grantRole">
                <i class="layui-icon layui-icon-edit"></i>分配角色
            </button>
        </script>

        <%--    添加和修改的窗口区域    --%>
        <div style="display: none;padding: 5px" id="addOrUpdateWindow">
            <form class="layui-form" style="width: 90%;" id="dataFrm" lay-filter="dataFrm">
                <%--    隐藏域保存主键    --%>
                <input type="hidden" name="id" id="id">


                <div class="layui-form-item">
                    <div class="layui-inline">
                    <label class="layui-form-label">登录名称</label>
                    <div class="layui-input-block">
                        <input type="text" name="userName" id="userName" autocomplete="off" lay-verifty="required"
                               placeholder="请输入登录名称" class="layui-input">
                    </div>
                    </div>

                <div class="layui-inline">
                    <label class="layui-form-label">用户姓名</label>
                    <div class="layui-input-block">
                        <input type="text" name="realName" id="realName" autocomplete="off" lay-verifty="required"
                               placeholder="请输入用户姓名" class="layui-input">
                    </div>
                </div>
                </div>

                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">邮箱</label>
                            <div class="layui-input-block">
                                <input type="text" name="email" id="email" autocomplete="off" lay-verifty="required|email"
                                       placeholder="请输入电子邮箱" class="layui-input">
                            </div>
                        </div>

                        <div class="layui-inline">
                            <label class="layui-form-label">联系方式</label>
                            <div class="layui-input-block">
                                <input type="text" name="phone" id="phone" autocomplete="off" lay-verifty="required|phone"
                                       placeholder="请输入联系方式" class="layui-input">
                            </div>
                        </div>
                    </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">入职日期</label>
                        <div class="layui-input-inline">
                            <input type="text" name="hireDate" id="hireDate" autocomplete="off"
                                   placeholder="请选择入职日期" readonly class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">所属部门</label>
                        <div class="layui-input-block">
                            <select name="deptId" id="deptId" class="layui-input">
                                <option value="">请选择部门</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">用户性别</label>
                        <div class="layui-input-block">
                            <input type="radio" name="sex" value="0" title="男" checked>
                            <input type="radio" name="sex" value="1" title="女">
                        </div>
                    </div>

                    <div class="layui-inline">
                        <label class="layui-form-label">用户状态</label>
                        <div class="layui-input-block">
                            <input type="radio" name="status" value="1" title="正常" checked>
                            <input type="radio" name="status" value="2" title="异常">
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">用户备注</label>
                    <div class="layui-input-block">
                        <textarea class="layui-textarea" name="roleDesc" id="remark"></textarea>
                    </div>
                </div>
                <div class="layui-form-item layui-row layui-col-xs12">
                    <div class="layui-input-block" style="text-align: center;">
                        <button type="button" class="layui-btn" lay-submit lay-filter="doSubmit">
                            <span class="layui-icon layui-icon-add-1"></span>提交
                        </button>
                        <button type="reset" class="layui-btn layui-btn-warm">
                            <span class="layui-icon layui-icon-refresh-1"></span>重置
                        </button>
                    </div>
                </div>

            </form>
        </div>

        <%--     用户分配角色的弹出层       --%>
        <div style="display: none;" id="selectRoleMenuDive">
            <table class="layui-hide" id="roleTable" lay-filter="roleTabel"></table>
        </div>

    </div>
</div>

<script src="${pageContext.request.contextPath}/static/layui/lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form', 'jquery', 'laydate', 'table', 'layer'], function () {
        var laydate = layui.laydate,
            $ = layui.jquery,
            form = layui.form,
            table = layui.table,
            layer = layui.layer;

        //渲染日期组件
        laydate.render({
            elem: '#startTime',
            type: 'date'
        });
        laydate.render({
            elem: '#endTime',
            type: 'date'
        });
        laydate.render({
            elem: '#hireDate',
        });

        //获取<meta>标签中封装的CSRF Toekn
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");
        //将头中的CSRF Token信息进行发送
        $(document).ajaxSend(function (e, xhr, options) {
            xhr.setRequestHeader(header, token);
        });



        //渲染表格组件
        var tableIns = table.render({
            elem: '#currentTableId',
            url: '/admin/user/list',
            toolbar: '#toolbarDemo',
            cols: [[
                {field: 'id', width: 90, title: '用户编号', align: 'center'},
                {field: 'userName', width: 90, title: '登录名称', align: 'center'},
                {field: 'realName', width: 100, title: '真实姓名', align: 'center'},
                {field: 'sex', width: 70, title: '性别', align: 'center',templet:function (d) {
                        return d.sex == 0 ? "<font color='#00bfff'>男</font>":"<font color='#ff4500'>女</font>";
                    }},
                {field: 'dept', width: 100, title: '所属部门', align: 'center',templet:function (d) {
                        return d.dept.deptName;
                    }},
                {field: 'phone', width: 120, title: '联系方式', align: 'center'},
                {field: 'hireDate', width: 180, title: '入职日期', align: 'center'},
                {field: 'status', width: 70, title: '状态', align: 'center',templet:function (d) {
                        return d.status == 1 ? "<font color='#00bfff'>正常</font>":"<font color='#ff4500'>异常</font>";
                    }},
                {title: '操作', minWidth: 100, toolbar: '#currentTableBar', align: "center"}
            ]],
            page: true,
            done: function (res, curr, count) {
                //判断当前页码是否大于1并且当前页的数据量为0
                if (curr > 1 && res.data.left == 0) {
                    var pageValue = curr - 1;
                    //刷新数据表格的数据
                    tableIns.reload({
                        page: {curr: pageValue}
                    });
                }
            }
        });

        // 监听模糊查询
        form.on('submit(data-search-btn)', function (data) {
            //执行搜索重载
            tableIns.reload({
                where: data.field,//查询条件
                page: {
                    curr: 1
                }
            });
            return false;
        });

        //发送请求查询部门列表(将数据追加到部门下拉列表中)
        $.get("/admin/dept/findDeptList",function (result) {
            var html = "";
            for (let i = 0; i < result.length; i++) {
                html += "<option value='"+result[i].id+"'>"+result[i].deptName+"</option>";
            }
            //将网页代码追加到下拉列表中
            $("[name='deptId']").append(html);
            //重新渲染下拉列表
            form.render("select")
        },"json");

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
                case 'resetPwd':
                    resetPwd(obj.data);
                    break;
                case 'grantRole':
                    grantRole(obj.data);
                    break;
            }
        });

        //定义变量，分别保存提交地址和窗口索引
        var url, mainIndex;

        //打开添加窗口
        function openAddWindow() {
            mainIndex = layer.open({
                type: 1,
                title: '添加用户',
                area: ['800px', '500px'],
                content: $("#addOrUpdateWindow"),//引用的窗口内容
                success: function () {
                    //提交地址
                    url = "/admin/user/addUser";
                    //清空表单数据
                    $("#dataFrm")[0].reset();
                }
            });
        }

        //打开修改窗口
        function openUpdateWindow(data) {
            mainIndex = layer.open({
                type: 1,
                title: '修改用户',
                area: ['800px', '500px'],
                content: $("#addOrUpdateWindow"),//引用的窗口内容
                success: function () {
                    //提交地址
                    url = "/admin/user/updateUser";
                    //表单数据回显
                    form.val("dataFrm", data);

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
         * 删除角色
         * @param data
         */
        function deleteById(data) {
                    //提示用户是否确认删除
                    layer.confirm("确认要删除 [<font color='#FE784D'>" + data.realName + "</font>] 用户么？", {
                        icon: 3,
                        title: "提示"
                    }, function (index) {
                        //发送删除的请求
                        $.post("/admin/user/deleteById", {"id": data.id}, function (result) {
                            if (result.success) {
                                //提示
                                layer.alert(result.message, {icon: 1});
                                //刷新当前数据表格
                                tableIns.reload();
                            } else {
                                //提示
                                layer.alert(result.message, {icon: 2});
                            }
                        }, "json");
                        layer.close(index);
                    });
        }
        /**
         * 重置密码
         * @param data
         */
        function resetPwd(data) {
                    //提示用户是否确认重置密码
                    layer.confirm("确认要重置密码 [<font color='#FE784D'>" + data.realName + "</font>] 用户的密码么？", {
                        icon: 3,
                        title: "提示"
                    }, function (index) {
                        //发送重置密码的请求
                        $.post("/admin/user/resetPwd", {"id": data.id}, function (result) {
                            if (result.success) {
                                //提示
                                layer.alert(result.message, {icon: 1});
                                //刷新当前数据表格
                                tableIns.reload();
                            } else {
                                //提示
                                layer.alert(result.message, {icon: 2});
                            }
                        }, "json");
                        layer.close(index);
                    });
        }

        /**
         * 打开分配角色窗口
         * @param data
         */
        function grantRole(data) {
            mainIndex = layer.open({
                type: 1,
                title: "分配 [<font color=\'#FE784D\'>" + data.realName + "</font>] 角色",
                area: ['800px', '500px'],
                content: $("#selectRoleMenuDive"),//引用的窗口内容
                btn:["<i class='layui-icon layui-icon-ok'></i>确定","<i class='layui-icon layui-icon-close'></i>取消"],
                yes:function(index,layero) {
                    var checkStatus = table.checkStatus('roleTable');
                    //定义数组，保存选中行的ID
                    var idArr = [];
                    //判断是否有选中行
                    if (checkStatus.data.length > 0) {
                        //获取选中行的数据
                        for (let i = 0; i < checkStatus.data.length; i++) {
                            idArr.push(checkStatus.data[i].id);//角色ID
                        }
                        //将数组转成字符串
                        var ids = idArr.join(",");

                        //发送请求
                        $.post("/admin/user/grantRole",{"ids":ids,"userId":data.id},function (result) {
                            if (result.success) {
                                layer.alert(result.message,{icon:1});
                            } else {
                                layer.alert(result.message,{icon:2});
                            }
                        },"json");
                        //关闭分配角色窗口
                        layer.close(mainIndex);

                    } else {
                        layer.msg("至少选中一个角色");
                    }
                },
                btn2:function(index,layero) {
                    //关闭当前窗口
                    layer.close(index);
                },
                success: function () {
                    //初始化加载角色数据
                    initRoleData(data);
                }
            });
        }

        /**
         * 初始化角色列表
         * @param data
         */
        function initRoleData(data) {
            table.render({
                elem: '#roleTable',
                url: '/admin/role/initRoleListByUserId?userId='+data.id,
                cols: [[
                    {type: 'checkbox', width: 50},
                    {field: 'id', width: 120, title: '角色编号', align: 'center'},
                    {field: 'roleName', width: 120, title: '角色名称', align: 'center'},
                    {field: 'roleDesc', width: 350, title: '角色描述', align: 'center'}
                ]]
            });
        }

    });
</script>

</body>
</html>