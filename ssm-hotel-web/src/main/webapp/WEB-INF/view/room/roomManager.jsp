<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <%-- 获取CSRF Token --%>
    <meta name="_csrf" content="${_csrf.token}"/>
    <%-- 获取CSRF头 默认为X-CSRF-TOKEN --%>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <meta charset="utf-8">
    <title>房间管理页面</title>
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
                            <label class="layui-form-label">房间编号</label>
                            <div class="layui-input-inline">
                                <input type="text" name="roomNum" autocomplete="off" class="layui-input">
                            </div>
                        </div>

                        <div class="layui-inline">
                            <label class="layui-form-label">房间类型</label>
                            <div class="layui-input-inline">
                                <select name="roomTypeId" id="s_roomTypeId" autocomplete="off" class="layui-input">
                                    <option value="">全部</option>
                                </select>
                            </div>
                        </div>

                        <div class="layui-inline">
                            <label class="layui-form-label">所属楼层</label>
                            <div class="layui-input-inline">
                                <select name="floorId" id="s_floorId" autocomplete="off" class="layui-input">
                                    <option value="">全部</option>
                                </select>
                            </div>
                        </div>

                        <div class="layui-inline">
                            <label class="layui-form-label">房间状态</label>
                            <div class="layui-input-inline">
                                <select name="status" id="s_status" autocomplete="off" class="layui-input">
                                    <option value="">全部</option>
                                    <option value="1">可预订</option>
                                    <option value="2">已预订</option>
                                    <option value="3">入住中</option>
                                </select>
                            </div>
                        </div>

                        <div class="layui-inline">
                            <button type="submit" class="layui-btn" lay-submit lay-filter="data-search-btn">
                                <i class="layui-icon"></i>搜索
                            </button>
                            <button type="reset" class="layui-btn layui-btn-warm">
                                <i class="layui-icon layui-icon-refresh-1"></i>重置
                            </button>
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
        </script>

        <%--    添加和修改的窗口区域    --%>
        <div style="display: none;padding: 5px" id="addOrUpdateWindow">
            <form class="layui-form" style="width: 90%;" id="dataFrm" lay-filter="dataFrm">
                <%--    隐藏域保存房型id编号    --%>
                <input type="hidden" name="id" id="id">


                    <div class="layui-col-md12 layui-col-xs12">
                        <div class="layui-row layui-col-space10">
                             <div class="layui-col-md9 layui-col-xs7">
                                 <div class="layui-form-item-magt3" style="margin-top:8px">
                                    <label class="layui-form-label">房间编号</label>
                                         <div class="layui-input-block">
                                             <input type="text" name="roomNum" autocomplete="off" class="layui-input">
                                         </div>
                                 </div>

                                 <div class="layui-inline">
                                     <label class="layui-form-label">房间类型</label>
                                     <div class="layui-input-inline">
                                         <select name="roomTypeId" id="roomTypeId" autocomplete="off" class="layui-input">
                                             <option value="">请选择房型</option>
                                         </select>
                                     </div>
                                 </div>

                                 <div class="layui-form-item">
                                     <label class="layui-form-label">房间备注</label>
                                     <div class="layui-input-block">
                                         <textarea class="layui-textarea" name="remark" id="remark"></textarea>
                                     </div>
                                 </div>
                             </div>

                            <div class="layui-col-md3 layui-col-xs5">
                                <div class="layui-upload-list thumbBox mag0 magt3">
                                    <input type="hidden" name="photo" id="photo" value="/static/images/defaultimg.jpg">
                                    <img class="layui-upload-img thumbImg" width="280px" height="92px"
                                         src="/static/images/defaultimg.jpg">
                                </div>
                            </div>
                        </div>

                        <div class="layui-form-item margb0">
                            <div class="layui-inline">
                            <label class="layui-form-label">所属楼层</label>
                                <div class="layui-input-inline">
                                    <select name="floorId" id="floorId" autocomplete="off" class="layui-input">
                                        <option value="">请选择楼层</option>
                                    </select>
                                </div>
                            </div>
                         </div>

                        <div class="layui-inline">
                            <label class="layui-form-label">房间状态</label>
                            <div class="layui-input-inline">
                                <select name="status" id="status" autocomplete="off" class="layui-input">
                                    <option value="">全部</option>
                                    <option value="1">可预订</option>
                                    <option value="2">已预订</option>
                                    <option value="3">入住中</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">房间要求</label>
                        <div class="layui-input-block">
                            <textarea class="layui-textarea" name="roomRequirement" id="roomRequirement"></textarea>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">房间详情</label>
                        <div class="layui-input-block">
                            <textarea class="layui-textarea" name="roomDesc" id="roomDesc" style="display: none;"></textarea>
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

    </div>
</div>
</body>

<%--导入layui的js文件--%>
<script src="${pageContext.request.contextPath}/static/layui/lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
<script>
    layui.use(["layer", "table", "form", "jquery","laydate"], function () {
        var layer = layui.layer,
            table = layui.table,
            $ = layui.jquery,
            form = layui.form,
            laydate = layui.laydate;

        //获取<meta>标签中封装的CSRF Toekn
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");
        //将头中的CSRF Token信息进行发送
        $(document).ajaxSend(function (e, xhr, options) {
            xhr.setRequestHeader(header, token);
        });


        var tableIns = table.render({
            elem: '#currentTableId',
            url: '${pageContext.request.contextPath}/admin/room/list',
            toolbar: '#toolbarDemo',
            cols: [[
                {field: 'id', width: 60, title: '编号', align: 'center'},
                {field: 'title', width: 150, title: '房间名称', align: 'center'},
                {field: 'roomNum', minWidth: 120, title: '房间编号', align: 'center'},
                {field: 'roomType', minWidth: 100, title: '房间类型', align: 'center',templet:function (d) {
                    return d.roomType.typeName;
                    }},
                {field: 'floor', minWidth: 100, title: '所属楼层', align: 'center',templet:function (d) {
                        return d.floor.floorName;
                    }},
                {field: 'status', minWidth: 100, title: '房间状态', align: 'center'},
                {title: '操作', minWidth: 120, toolbar: '#currentTableBar', align: "center"}
            ]],
            page: true,
            done: function (res,curr,count) {
                //判断当前页码是否大于1并且当前页的数据量为0
                if (curr > 1 && res.data.length == 0) {
                    var pageValue = curr - 1;
                    //刷新数据表格的数据
                    tableIns.reload({
                        page: {curr: pageValue}
                    });
                }

            }
        });

        //监听搜索操作
        form.on('submit(data-search-btn)',function (data) {
            tableIns.reload({
                where: data.field,
                page: {
                    curr : 1
                }
            });
            return false;
        });

        //发送请求查询楼层列表(将数据追加到部门下拉列表中)
        $.get("/admin/floor/floorList",function (result) {
            var html = "";
            for (let i = 0; i < result.length; i++) {
                html += "<option value='"+result[i].id+"'>"+result[i].floorName+"</option>";
            }
            //将网页代码追加到下拉列表中
            $("[name='floorId']").append(html);
            //重新渲染下拉列表
            form.render("select")
        },"json");

        //发送请求查询房型列表(将数据追加到部门下拉列表中)
        $.get("/admin/roomType/roomTypeList",function (result) {
            var html = "";
            for (let i = 0; i < result.length; i++) {
                html += "<option value='"+result[i].id+"'>"+result[i].typeName+"</option>";
            }
            //将网页代码追加到下拉列表中
            $("[name='roomTypeId']").append(html);
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

            }
        });

        //渲染文件上传组件
        upload.render({
            elem:".thumbBox",//绑定元素
            url:'/admin/room/uploadFile',//文件上传地址
            acceptMime: 'image/*',//规定打开文件选择框时，筛选出的文件类型
            field:'attach',//文件上传的字段值,等同于input标签的name属性值，该值必须与控制器中的方法参数名一致
            method:"post",
            //文件上传成功后的回调函数
            done: function (res,index,upload) {
                //设置图片回显路径
                $(".thumbImg").attr("src",res.data.src);
                $('.thumbBox').css("background","#fff");
                //给图片隐藏域赋值
                $("#photo").val(res.imagePath);
            }
        });

        //定义变量，分别保存提交地址和窗口索引
        var url, mainIndex;

        //打开添加窗口
        function openAddWindow() {
            mainIndex = layer.open({
                type: 1,
                title: '添加房间',
                area: ['800px', '500px'],
                maxmin:true,
                content: $("#addOrUpdateWindow"),//引用的窗口内容
                success: function () {
                    //清空表单数据
                    $("#dataFrm")[0].reset();
                    //提交地址
                    url = "/admin/room/addRoom";
                    //设置隐藏域默认值
                    $("#photo").val("images/defaultimg.jpg");
                    //设置默认图片
                    $(".thumbImg").attr("src","/upload/images/defaultimg.jpg");
                }
            });
            layer.full(mainIndex);
        }

        //打开修改窗口
        function openUpdateWindow(data) {
            mainIndex = layer.open({
                type: 1,
                title: '修改楼层',
                area: ['800px', '400px'],
                content: $("#addOrUpdateWindow"),//引用的窗口内容
                success: function () {
                    //提交地址
                    url = "/admin/floor/updateFloor";
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


    });
</script>
</html>
