<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>系统登录 - 用户管理系统</title>
    <link rel="stylesheet" href="css/style.css"/>
    <style>
        #parent{
            width:500px;
            height:200px;
            margin-top:20%;
            margin-left:50%;
            transform:translate(-50%,-50%) ;
            background:#009688;
        }
        .password,.subBtn{
            margin-top: 2%;
            margin-left: 3%;
        }
        .loginHeader{
            padding-top: 1%;
        }
    </style>
    <script src="../res/jquery-3.5.1.min.js"></script>
</head>
<body class="login_bg">
<div id="parent">
    <section class="loginBox">
        <header class="loginHeader" style="text-align:center; ">
            <h1>用户管理系统</h1>
        </header>
        <section class="loginCont">
            <form class="loginForm" action="" method="" onsubmit="return check()">
                <div class="inputbox"  style="text-align:center; ">
                    <label for="user">账号：&nbsp&nbsp</label>
                    <input id="andrew_name" type="text" name="id" placeholder="请输入账号" required="required" />
                </div>
                <div class="password"  style="text-align:center; " >
                    <label for="mima">密码：</label>
                    <input id="andrew_passwd" type="password" name="passwd" placeholder="请输入密码" required="required" />
                </div>
                <div class="subBtn"  style="text-align:center; ">
                    <input type="submit" value="登录"  id="attr_submit"/>
                    <input type="reset" value="重置"/>
                </div>
            </form>
        </section>
    </section>
</div>
</body>
</html>
<script>
    //发送表单ajax请求
    $('#attr_submit').on('click',function(e){
        e.preventDefault();
        let data={};
        data.id=$('#andrew_name')[0].value;
        data.passwd =$('#andrew_passwd')[0].value;
        $.ajax({
            method: "post",
            url: '/login/test',
            async: true,
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
</script>