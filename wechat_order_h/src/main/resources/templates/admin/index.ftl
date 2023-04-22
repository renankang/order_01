<html>
<#include "../common/header.ftl">
<body>
<div id="wrapper" class="toggled">
    <!--侧边栏sidebar-->
    <#include "../common/nav.ftl">

    <!--主要内容content-->
    <div id="page-content-wrapper">
        <div class="container-fluid">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <#--<form>-->
                        <div class="form-group">
                            <label>名字</label>
                            <input name="username"  id="inputName3" type="text" class="form-control" value="${(sellerInfo.username)!""}" />
                        </div>
                        <div class="form-group">
                            <label>密码</label>
                            <input name="password"  id="inputPassword3" type="text" class="form-control" value="${(sellerInfo.password)!""}" />
                        </div>
                        <div class="form-group">
                            <label>手机号</label>
                            <input name="phone" id="inputPhone3" type="number" class="form-control" value="${(sellerInfo.phone)!""}" />
                        </div>
                        <input hidden type="text" id="sellerId" name="sellerId" value="${(sellerInfo.sellerId)!""}">
                        <button type="button" class="btn btn-default" id="update_user">提交</button>
                    <#--</form>-->
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<!--  JavaScript  -->
<script  src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script  src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
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

        $("#update_user").click(function  ()  {
            register();
        });


        function register() {
            //验证手机号是否正确
            var  username  =  $("#inputName3").val().trim();
            var  phone  =  $("#inputPhone3").val().trim();
            var  password  =  $("#inputPassword3").val().trim();
            var  sellerId  =  $("#sellerId").val().trim();

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
            console.log("after",password)
            $.ajax({
                url: "/sell/admin/save",
                type:"POST",
                contentType:'application/json;charset=UTF-8',
                data: JSON.stringify( {"username": username,"phone": phone,"password": password,"sellerId":sellerId}),
                success: function (data) {
                    alert("修改成功！")
                    console.log("data",data)
                },error(err){
                    alert("修改失败！")
                    console.log("err",err)
                }
            });
        }
    });

</script>
</html>