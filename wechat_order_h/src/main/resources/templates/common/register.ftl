<html>
<head>
    <meta  charset="utf-8">
    <title>卖家管理系统后台</title>
    <link  rel="stylesheet"  href="/sell/css/style.css">
    <link  href="https://cdn.bootcss.com/bootstrap/3.0.1/css/bootstrap.min.css"  rel="stylesheet">
    <style>
        .to_loin{
            position: absolute;
            left: 430px;
            top: 10px;
        }
    </style>
</head>
<body>
<div  class="container  login"  style="margin-top:100px;">
    <div  class="row  clearfix">
        <div  class="col-md-12  column">
            <div  class="col-md-12  column">
                <h1>卖家后台管理系统</h1>
            </div>
            <form  class="form-horizontal"  action="#"  method="post">
                <div  class="form-group">
                    <label  for="inputName3"  class="col-sm-2  control-label">名字</label>
                    <div  class="col-sm-6">
                        <input  type="text"  name="name"  class="form-control"  placeholder="请输入您的名字"  id="inputName3"/>
                    </div>
                </div>
                <div  class="form-group">
                    <label  for="inputPhone3"  class="col-sm-2  control-label">手机号</label>
                    <div  class="col-sm-6">
                        <input  type="text"  class="form-control  inputName"  id="inputPhone3"  name="username"    title="提示"
                                data-container="body"  data-toggle="popover"  data-placement="top"
                                placeholder="请输入您的手机号"  data-content="请输入11位手机号"/>
                    </div>
                </div>
                <div  class="form-group">
                    <label  for="inputPassword3"  class="col-sm-2  control-label">密码</label>
                    <div  class="col-sm-6">
                        <input  type="password"  name="password"  class="form-control"  placeholder="请输入您的密码"  id="inputPassword3"/>
                    </div>
                </div>
                <div  class="form-group">
                    <div  class="col-sm-offset-2  col-sm-10">
                        <button  class="btn  btn-default"  id="toRegister">注册</button>
                        <div class="to_loin">
                            <a href="/sell/seller/order/list" >  已注册，返回登录页！</a>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
<!--  JavaScript  -->
<script  src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script  src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!--自动机定义的本地js请求-->
<#--<script  src="../../js/login.js"  th:src="@{/js/login.js}"></script>-->
<script>
    $(function  ()  {
        $("[data-toggle='popover']").popover({
            trigger:  'manual',
            container:  'body'
        }).focus(function  ()  {
            $(this).popover('show');
        }).blur(function  ()  {
            $(this).popover('hide');
        });

        $("#toRegister").click(function  ()  {
            // var  username  =  $("#inputName3").val().trim();
            // var  phone  =  $("#inputPhone3").val().trim();
            // var  password  =  $("#inputPassword3").val().trim();
            //alert(username+"----------"+phone+"------------"+ password)
            register();
        });


        function register() {
            //验证手机号是否正确
            var  username  =  $("#inputName3").val().trim();
            var  phone  =  $("#inputPhone3").val().trim();
            var  password  =  $("#inputPassword3").val().trim();
            if (username == undefined || username == "") {
                alert("请输入用户名");
                return;
            }
            if  (!/^[1][3,4,5,7,8][0-9]{9}$/.test(phone))  {
                alert("请输入11位正确的手机号码！");
                return;
            }
            if (password == undefined || password == "") {
                alert("请输入密码");
                return;
            }
            $.ajax({
                url: "/sell/admin/save",
                type:"POST",
                contentType:'application/json;charset=UTF-8',
                data: JSON.stringify( {"username": username,"phone": phone,"password": password,}),
                success: function (data) {
                    console.log("注册成功！", data);
                    window.location.href = "/sell/admin/login";
                }
            });
        }
    });
</script>
</html>
