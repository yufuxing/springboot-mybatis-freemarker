<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户信息</title>
    <link rel="stylesheet" href="../res/bootstrap-4.5.0-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../res/font-awesome-4.7.0/css/font-awesome.min.css">
    <script src="../res/jquery-3.5.1.min.js"></script>
    <script src="../res/popper.min.js"></script>
    <script src="../res/bootstrap-4.5.0-dist/js/bootstrap.min.js"></script>
    <script src="../res/layer/layer.js"></script>
    <style>
        .form-text {
            width: 100px;
            text-align: center;
        }
    </style>
</head>
<body>
&nbsp;&nbsp;&nbsp;&nbsp;
<button type="button" class="btn btn-primary" id="btn_add"><i class="fa fa-plus-square" aria-hidden="true"></i>&nbsp;添加
</button>
&nbsp;&nbsp;&nbsp;&nbsp;
<button type="button" class="btn btn-primary" id="btn_del"><i class="fa fa-trash" aria-hidden="true"></i>&nbsp;删除
</button>
&nbsp;&nbsp;&nbsp;&nbsp;
<button type="button" class="btn btn-primary" id="btn_edit"><i class="fa fa-pencil-square" aria-hidden="true"></i>&nbsp;修改
</button>
&nbsp;&nbsp;&nbsp;&nbsp;
<button type="button" class="btn btn-primary" id="btn_info"><i class="fa fa-info-circle" aria-hidden="true"></i>&nbsp;查看
</button>

<div class="form-group"  style="margin-top: 10px;margin-left: 20px">
    <label for="roleId">工号</label>
    <input style="display: initial;width: 15%" class="form-control form-edit" id="andrew_id"  type="text" placeholder=""
           name="id"
           value=""
           autocomplete="off">
    <label for="roleId">角色</label>
    <input style="display: initial;width: 15%" class="form-control form-edit" id="andrew_roleId"  type="text" placeholder=""
           name="rname"
           value=""
           autocomplete="off">
    <label for="name">用户名</label>
    <input style="display: initial;width: 15%" class="form-control form-edit" id="andrew_name"  type="text" placeholder=""
           name="name"
           value="" autocomplete="off">
    <button class="btn btn-primary" id="btn_andrew" style="margin-bottom: 5px">查询</button>
</div>
<div>
<table class="table table-hover table-bordered">
    <thead class="thead-light">
    <tr align="center">
        <th><input type="checkbox" id="isAll"></th>
        <th>工号</th>
        <th>角色</th>
        <th>用户名</th>
        <th>性别</th>
    </tr>
    </thead>
    <tbody id="index_table">
    <#list userList as user>
        <tr align="center">
            <td><input type="checkbox" name="id" class="form-check" value="${user.id}"></td>
            <td id="b">${user.id!"null"}</td>
            <td id="c">${user.rname!"null"}</td>
            <td id="d">${user.name!"null"}</td>
            <#if user.sex == '0'>
                <td d="e">男</td>
            <#else>
                <td d="e">女</td>
            </#if>
        </tr>
    </#list>
    </tbody>
</table>
</div>
<!-- 新增模态框 -->
<div id="addModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <button class="close" data-dismiss="modal">
                    <span>×</span>
                </button>
            </div>
            <div class="modal-title">
                <h1 class="text-center">用户信息</h1>
            </div>
            <div class="modal-body">
                <form class="form-group" action="">
                    <div class="form-group">
                        <label for="roleId">角色</label>
                       <#-- <input class="form-control form-add" id="roleId" type="text" placeholder="" name="roleId"
                               value=""
                               autocomplete="off">-->
                        <select class="form-control form-add" id="roleId" type="text" placeholder="" name="roleId">
                            <option value="1">后端开发</option>
                            <option value="2">前端开发</option>
                            <option value="3">测试</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="name">用户名</label>
                        <input class="form-control form-add" id="name" type="text" placeholder="" name="name"
                               value="" autocomplete="off">
                    </div>
                    <div class="form-group">
                        <label for="sex">性别</label>
                        <#--<input class="form-control form-add" id="sex" type="text" placeholder="" name="sex"
                               value="" autocomplete="off">-->
                        <select class="form-control form-add" id="sex" type="text" placeholder="" name="sex">
                            <option value="0">男</option>
                            <option value="1">女</option>
                        </select>
                    </div>
                    <div class="text-right">
                        <button class="btn btn-primary" id="add_submit" type="submit">提交</button>
                        <button class="btn btn-danger" data-dismiss="modal">取消</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- 信息模态框 -->
<div id="infoModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <button class="close" data-dismiss="modal">
                    <span>×</span>
                </button>
            </div>
            <div class="modal-title">
                <h1 class="text-center">用户信息</h1>
            </div>
            <div class="modal-body">
                <form class="form-group" action="">
                    <div class="form-group">
                        <label for="name">用户名</label>
                        <input class="form-control form-edit" id="info_name" readonly type="text" placeholder=""
                               name="name"
                               value="" autocomplete="off">
                    </div>
                    <div class="form-group">
                        <label for="sex">性别</label>
                        <input class="form-control form-edit" id="info_sex" readonly type="text" placeholder=""
                               name="sex"
                               value="" autocomplete="off">
                    </div>
                    <div class="form-group">
                        <label for="status">status</label>
                        <input class="form-control form-edit" id="info_status" readonly type="text" placeholder=""
                               name="status"
                               value="" autocomplete="off">
                    </div>
                    <div class="form-group">
                        <label for="rname">Rame</label>
                        <input class="form-control form-edit" id="info_rname" readonly type="text" placeholder=""
                               name="rname"
                               value="" autocomplete="off">
                    </div>
                    <div class="text-right">
                        <button class="btn btn-danger" data-dismiss="modal">关闭</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script>
    $(function (e) {
        $('#addModal').on('show.bs.modal', function (e) {
            var $this = $(this);
            var $modal_dialog = $this.find('.modal-dialog');
            $this.css('display', 'block');
            $modal_dialog.css({'margin-top': Math.max(0, ($(window).height() - $modal_dialog.height()) / 2 - 30)});

        });
        var addOrSave = true;
        $('#btn_add').on('click', function (e) {
            e.preventDefault();
            addOrSave = true;
            $("#addModal").modal({backdrop: true, keyboard: true});
        });
        $('#add_submit').on('click', function (e) {
            e.preventDefault();
            let data = {};
            let forms = $('.form-add');
            $.each(forms, function(index, input){
                data[input.name] = input.value;
            });
            data.roleId= $("#roleId")[0].value;
            data.name= $("#name")[0].value;
            data.sex= $("#sex")[0].value;
            // data.test = ["3","5",{"a":"asd"}];
            if(!addOrSave){
                let list = sessionStorage.getItem('ids');
                data['ids'] = JSON.parse(list);
            }
            let methodName = addOrSave ? 'add' : 'edit';
            $.ajax({
                method: "post",
                url: '/user/' + methodName,
                async: false,
                data: JSON.stringify(data),
                dataType: 'json',
                contentType: "application/json; charset=utf-8",
                success: function (respose) {
                    switch (respose.code) {
                        case "200": {
                            window.location.replace("/user/table");
                            break;
                        }
                    }
                }
            });
        });
        $('#btn_andrew').on('click', function (e) {
            e.preventDefault();
            let data = {};
            var temp='';
            if ($('#andrew_id')[0].value){

                addOrSave = false;
            }else {

                addOrSave = true;
            }

            data.id = $('#andrew_id')[0].value;
            data.rname = $('#andrew_roleId')[0].value;
            data.name = $('#andrew_name')[0].value;
            $.ajax({
                method: "post",
                url: '/user/queryAllByLimit',
                async: true,
                data: JSON.stringify(data),
                dataType: 'json',
                contentType: "application/json; charset=utf-8",
                success: function (respose) {
                    switch (respose.code) {
                        case "200": {

                            if(respose.data==""){
                                $("#index_table").empty();
                                layer.msg('无记录');
                            }else{

                                for (let i = 0; i < respose.data.length; i++) {
                                    temp +=
                                        '<tr align="center">' +
                                        '<td><input type="checkbox" name="id" class="form-check" value="'+respose.data[i].id+'"></td>'+
                                        '<td>' + respose.data[i].id + '</td>' +
                                        '<td>' + respose.data[i].rname + '</td>' +
                                        '<td>' + respose.data[i].name + '</td>'
                                        if(respose.data[i].sex=='0'){

                                            temp+='<td>'+'男'+'</td>'

                                        }else{

                                            temp+='<td>'+'女'+'</td>'
                                        }
                                    temp+='</tr>';

                                }
                                $("#index_table").empty();

                                $("#index_table").append(temp);
                            }

                            break;
                        }
                    }

                }

            });
        });
        $('#isAll').change(function (e) {
            if ($('#isAll').is(':checked')) {
                $('.form-check').each(function (index, element) {
                    if (!element.checked) {
                        element.checked = true;
                    }
                });
            } else {
                $('.form-check').each(function (index, element) {
                    if (element.checked) {
                        element.checked = false;
                    }
                });
            }
        });
        $('.form-check').click(function (e) {
            e.preventDefault();
        });
        $('tr').slice(1).click(function (e) {
            // let checkbox = $("input[type='checkbox']",this)[0];
            let checkbox = $("input:checkbox", this)[0];
            if (checkbox.checked) {
                checkbox.checked = false;
            } else {
                checkbox.checked = true;
            }
            check($('.form-check'));
        })

        function check(items) {
            let flag = true;
            $(items).each(function (index, element) {
                if (!element.checked) {
                    flag = false;
                }
            });
            let isAll = window.document.querySelector(`#isAll`)
            isAll.checked = flag;
        }

        $('#btn_del').click(function (e) {
            e.preventDefault();
            let list = new Array();
            $('.form-check').each(function (index, element) {
                if (element.checked) {
                    list.push(element.value);
                }
            });
            if (list.length > 0) {
                $.ajax({
                    method: "post",
                    url: '/user/delete',
                    async: false,
                    data: JSON.stringify({"ids": JSON.parse(JSON.stringify(list))}),
                    dataType: 'json',
                    contentType: "application/json; charset=utf-8",
                    success: function (respose) {
                        switch (respose.code) {
                            case "200": {
                                window.location.replace("/user/table");
                                break;
                            }
                        }
                    }
                });
            } else {
                layer.msg('请选择要删除的用户', {icon: 2});
            }
        });
        $('#btn_info').click(function (e) {
            e.preventDefault();
            let list = new Array();
            $('.form-check').each(function (index, element) {
                if (element.checked) {
                    list.push(element.value);
                }
            });
            if (list.length > 0) {
                $.ajax({
                    method: "post",
                    url: '/user/getUserById',
                    async: false,
                    data: JSON.stringify({"ids":[...list]}),
                    contentType: "application/json; charset=utf-8",
                    dataType: 'json',
                    success: function (respose) {
                        switch (respose.code) {
                            case "200": {
                                $("#infoModal").modal({backdrop: true, keyboard: true});
                                $('#info_roleId').val(respose.data.roleId);
                                $('#info_sex').val(respose.data.sex);
                                $('#info_status').val(respose.data.status);
                                $('#info_name').val(respose.data.name);
                                $('#info_rname').val(respose.data.rname);
                                break;
                            }
                        }
                    }
                });
            } else {
                layer.msg('请选择要查看的用户', {icon: 2});
            }
        });
        $('#btn_edit').click(function(e){
            e.preventDefault();
            addOrSave = false;
            let list = new Array();
            $('.form-check').each(function (index, element) {
                if (element.checked) {
                    list.push(element.value);
                }
            });
            sessionStorage.setItem('ids',JSON.stringify(list));
            if (list.length > 0) {
                $.ajax({
                    method: "post",
                    url: '/user/getUserById',
                    async: false,
                    data: JSON.stringify({'ids':JSON.parse(JSON.stringify(list))}),
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (respose) {
                        switch (respose.code) {
                            case "200": {
                                $("#addModal").modal({backdrop: true, keyboard: true});
                                $('#roleId').val(respose.data.roleId);
                                $('#sex').val(respose.data.sex);
                                $('#status').val(respose.data.status);
                                $('#name').val(respose.data.name);
                                $('#rname').val(respose.data.rname);
                                break;
                            }
                        }
                    }
                });
            } else {
                layer.msg('请选择要查看的用户', {icon: 2});
            }
        });
    });
</script>