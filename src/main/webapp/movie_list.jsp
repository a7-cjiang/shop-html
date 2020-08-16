<%--
  Created by IntelliJ IDEA.
  User: zgc
  Date: 2020/6/16
  Time: 12:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<%-- bootstarp的插件--%>
<link rel="stylesheet" href="/js/bootstrap-3.3.7-dist/css/bootstrap.css">
<script src="/js/jquery-3.3.1.min.js"></script>
<script src="/js/bootstrap-3.3.7-dist/js/bootstrap.js"></script>

<%--bootbox --%>
<script type="text/javascript"  src="/js/bootbox/bootbox.min.js"></script>
<script type="text/javascript"  src="/js/bootbox/bootbox.locales.min.js"></script>

<%--datatimer--%>
<link rel="stylesheet" href="js/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css">
<script src="js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
<script src="js/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>

<%-- 引入fileInput--%>
<link href="/js/bootstrap-fileinput-v5.0.6-17/css/fileinput.css" rel="stylesheet" type="text/css">
<script src="/js/bootstrap-fileinput-v5.0.6-17/js/fileinput.js"></script>

<!-- 引入DataTables的js -->
<link rel="stylesheet" type="text/css" href="/js/DataTables/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="/js/DataTables/js/jquery.dataTables.js"></script>

<head>
    <title>Title</title>
</head>
<body>

<div class="panel panel-primary">
    <div class="panel-heading">
        条件查询
    </div>
    <div class="panel-body">
        <form id="queryForm" class="form-horizontal">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">电影名:</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="name" placeholder="请输入用户名">
                            </div>
                        </div>
                    </div>


                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">有票无票:</label>
                                <div class="col-sm-10">
                                    <label class="radio-inline">
                                        <input type="radio" name="num" value="0"/>无
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="num" value="1"/>有
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>



                    <div class="form-group">
                        <div class="row">
                            <div class="col-sm-6">
                                <label class="col-sm-2 control-label">放映室</label>
                                <div class="col-sm-8">
                                    <select class="form-control selectpicker" id="hidquerylist">
                                        <option value="-1">===请选择===</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div style="padding-left:120px">
                            <button type="button" onclick="search()" class="btn btn-primary">
                                <span class="glyphicon glyphicon-search"></span>查询
                            </button>
                            &nbsp;
                            <button type="reset" class="btn btn-danger">
                                <span class="glyphicon glyphicon-refresh"></span>重置
                            </button>
                        </div>
                    </div>

                </div>

            </div>

        </form>
    </div>
</div>



<!-- 展示页面 -->
<button type="button"  onclick="showAddDiv()" class="btn btn-success">新增</button>




<div class="panel panel-primary">
    <div class="panel-heading">
        <h3 class="panel-title">商品列表</h3>
    </div>
    <div class="panel-body">
       <%--// <button type="button" class="btn btn-danger"  onclick="deleteAll()"><span class="glyphicon glyphicon-minus"></span>批量删除</button>--%>
        <table class="table table-condensed table-hover table-bordered table-striped" id="myTablelist">
        </table>
    </div>

    <%--<div class="panel-body ">--%>
        <%--<table class="table table-condensed table-hover table-bordered table-striped" id="myTable">--%>
        <%--</table>--%>
    <%--</div>--%>
</div>





<div id="xinzhengDiv" style="display: none">

    <form id="zhuceForm" class="form-horizontal" role="form">
        <div class="form-group">
            <label class="col-sm-2 control-label">电影名</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="names"  placeholder="请输入账号">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">价格</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="price"  placeholder="输入价格">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">余票数量</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="num"  placeholder="输入价格">
            </div>
        </div>




        <div class="form-group">
            <label class="col-sm-2 control-label">图片:</label>
            <div class="col-sm-10">
                <input id="addImg" name="img" type="file">
                <input type="hidden" name="avatar"  id="imgUrl">
            </div>
        </div>



        <div class="form-group">
            <label class="col-sm-2 control-label">时间</label>
            <div class="col-sm-10">
                <input type="date" class="form-control" id="showTime"  >
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">放映室</label>
            <div class="col-sm-6">
                <select class="form-control selectpicker" id="hidquery">
                    <option value="">===请选择===</option>
                </select>
            </div>
        </div>




        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="button"  onclick="addData()" class="btn btn-success">新增</button>
            </div>
        </div>
    </form>
</div>





</body>
<script>
    var updateBox;
    $(function () {
        UserList();
        queryBrand();


    })



    function queryBrand(){
        $.post({
            url: "http://localhost:8086/MovieController/queryhis",
            dataType:"json",
            success:function(result){

                for (var i = 0; i < result.data.length; i++) {


                    $("#hidquerylist",zhuceBootbox).append("<option value='" + result.data[i].hid + "'>" + result.data[i].hname + "</option>");
                }
                //$("#areaidquery").selectpicker("refresh");
            },
            error:function(){
                bootbox.alert("汽车选择列表失败！");
            }
        })
    }

    var zhuceBootbox;
    function showAddDiv() {

        //获取指定的元素的html
        zhuceBootbox = bootbox.dialog({
            message: $("#xinzhengDiv").html(),
            title: "注册信息"
        });

        //初始化fileINput插件
        $("#addImg",zhuceBootbox).fileinput({
            uploadUrl:"http://localhost:8086/MovieController/uploadAvatar", //上传的地址
            browseClass:"btn btn-success", //按钮样式
            dropZoneEnabled: false
        }).on("fileuploaded", function(e, data, previewiId, index) {
            //把文件的访问路径  赋给隐藏域
            $("#imgUrl",zhuceBootbox).val(data.response.data.filePath);
        });


        $.post({
            url: "http://localhost:8086/MovieController/queryhis",
            dataType: "json",
            async: false,
            success: function (result) {
                for (var i = 0; i <   result.data.length; i++) {

                    $("#hidquery",zhuceBootbox).append("<option value='" + result.data[i].hid + "'>" + result.data[i].hname + "</option>");
                }
                // $("#areaidadd",zhuceBootbox).selectpicker("refresh");
            },
            error: function () {
                bootbox.alert("放映室列表失败！");
            }
        })
    }
    function addData() {

        var name=$("#names",zhuceBootbox).val();
        var num=$("#num",zhuceBootbox).val();
        var price=$("#price",zhuceBootbox).val();
        var img=$("#imgUrl",zhuceBootbox).val();
        var  hid= $("#hidquery",zhuceBootbox).val();
        var  showTime= $("#showTime",zhuceBootbox).val();

        $.get({
            url:"http://localhost:8086/MovieController/Ttuser",
            dataType:"json",
            data:{
                "name":name,
                "num":num,
                "price":price,
                "imgUrl":img,
                "hid":hid,
                "showTime":showTime,
            },
            success:function (rs) {
                if(rs.code == 200){
                    alert("注册成功");
                    zhuceBootbox.modal("hide");
                    search();
                }
            },error:function () {
                bootbox.alert("注册失败");
            }
        });


    }






    function search(){
        drugTable.ajax.reload();
    }

    // 列表展示
    var drugTable;
    function UserList(){
        // 跟表格的id保持一致
        drugTable = $('#myTablelist').DataTable({
            //禁止排序设置
            "ordering": false,
            // 设置table表格中分页的样式
            language: {
                "sProcessing": "处理中...",
                "sLengthMenu": "显示 _MENU_ 项结果",
                "sZeroRecords": "没有匹配结果",
                "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
                "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
                "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
                "sInfoPostFix": "",
                "sSearch": "搜索:",
                "sUrl": "",
                "sEmptyTable": "表中数据为空",
                "sLoadingRecords": "载入中...",
                "sInfoThousands": ",",
                "oPaginate": {
                    "sFirst": "首页",
                    "sPrevious": "上页",
                    "sNext": "下页",
                    "sLast": "末页"
                },
            },
            // 设置其他配置功能
            "serverSide":true, // 开启后台
            "searching":false, // 关闭搜索框
            "processing":true, // 是否显示正在处理的状态
            "lengthMenu":[3,5,10], // 设置每页显示的条数
            // 禁用第一列排序
            columns : [ {
                targets : 0,
                "order" : false
            } ],
            "order":[ [ 1, 'asc' ] ],
            // 发送ajax
            "ajax":{
                "type":"post",
                "url":"http://localhost:8086/MovieController/queryMovie",
                "data":function(param){
                    param.name=$("#queryForm #name").val();

                    param.num = $("#queryForm [name=num]:checked").val();
                    param.hidquerylist=$("#queryForm #hidquerylist").val();
                },
            },
            // 渲染列表数据
            "columns":[
                {"data":"hid",
                    "render":function(data){

                        return "<input value='"+data+"' type='checkbox' name='chk'/>";
                    }
                },
                {"data":"name","title":"商品名"},


                {"data":"num","title":"数量",
                    "createdCell": function (td, cellData, rowData, row, col) {
                        if ( cellData == 0) {
                            var tr = $(td).parent();
                            tr.css("background", 'red')
                        }
                    }
                },
                {"data":"showTime","title":"日期"},

                {"data":"price","title":"价格"},
                {"data":"hname","title":"放映室"},
                {"data":"imgUrl","title":"图片",
                    "render":function(data) {
                        return "<img src='" + data + "' width='70px' height='70px'/>&nbsp;&nbsp;";
                    }
                },

                {"data":"mid","title":"操作",
                    "render":function(data,type,row) {
                    if (row.num>0){
                        return '<button type="button" class="btn btn-info btn-sm" onclick="updateUser(' + data + ')"><span class="glyphicon glyphicon-pencil"></span>购票</button>';
                    }else {
                        return '<button type="button" disabled  class="btn btn-danger"><span class="glyphicon glyphicon-pencil"></span>已售完</button>';

                    }
                    }
                },
            ]
        });
    }

    //删除
    function updateUser(hid){
        bootbox.confirm({
            //title:"购票成功",
            size:"large",
            message:"您确定要购票吗？",
            buttons:{
                confirm:{
                    label:"确认"
                },
                cancel:{
                    label:"取消",
                    className:"btn btn-danger"
                }
            },
            callback:function(result){
                //如果点击了确认按钮
                if(result) {
                    //发起一个删除图书的ajax请求
                    $.ajax({
                        url: "http://localhost:8086/MovieController/update",
                        type: "post",
                        data: {"hid": hid},
                        dataType: "json",
                        success: function (result) {
                            if (result.code==200) {
                              //  bootbox.alert("购票成功！");
                                //重新加载表格中的数据
                                search();
                            } else {
                               // alert("购票成功!");
                                search();
                            }
                        },
                        error: function () {
                           // alert("购票成功!");
                            search();
                        }
                    });
                }
            }
        });
    }



</script>
</html>












