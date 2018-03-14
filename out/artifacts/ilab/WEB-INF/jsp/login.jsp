ate use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath }/assets/img/ilab.jpg">
    
    <title>MUC班级管理系统</title>

    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath }/assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="${pageContext.request.contextPath }/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath }/assets/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/assets/css/style-responsive.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/js/gritter/css/jquery.gritter.css" />
    
</head>

<body>

<!-- ****************************************************************************************
MAIN CONTENT
********************************************************************************************* -->
<div class="background_black"></div>
<div id="login-page">
    <div class="container">

        <form id="login" class="form-login">
            <h2 class="form-login-heading">MUC班级管理系统</h2>
            <div class="login-wrap">
                <br>
                <input type="text" name="loginUser.username" class="form-control" placeholder="用户名" autofocus>
                <br>
                <input type="password" name="loginUser.password" class="form-control" placeholder="密码">
                <br><br>
                <button type="button" id="login_button" class="btn btn-theme btn-block" href="###">登录</button>
                <button type="button" class="btn btn-theme03 btn-block" onclick="open1();">注册</button>
                <br>
            </div>
        </form>

        <form id="register" class="form-login" style="display:none;opacity:0">
            <h2 class="form-login-heading">MUC班级管理系统</h2>
            <div class="login-wrap">
                <br>
                <input name="registerUser.username" type="text" class="form-control" placeholder="用户名" autofocus>
                <br>
                <input name="registerUser.password" type="password" class="form-control" placeholder="密码">
                <br>
                <input name="registerUser.password2" type="password" class="form-control" placeholder="重复密码">
                <br>
                <input name="registerUser.name" type="text" class="form-control" placeholder="姓名">
                <br>
                <input name="registerUser.student_id" type="text" class="form-control" placeholder="学号">
                <br>
                <select name="registerUser.grade" class="form-control">
                    <option>年级</option>
                    <option>本科一年级</option>
                    <option>本科二年级</option>
                    <option>本科三年级</option>
                    <option>本科四年级</option>
                    <option>研究生一年级</option>
                    <option>研究生二年级</option>
                    <option>研究生三年级</option>
                </select>
                <br>
                <select name="registerUser.student_group" class="form-control">
                    <option>班级</option>
                    <option>软件工程</option>
                    <option>电子信息工程</option>
                    <option>自动化</option>
                    <option>计算机</option>

                </select>
                <br>
                <input name="registerUser.email" type="email" class="form-control" placeholder="邮箱">
                <br>
                <input name="registerUser.phone_number" type="text" class="form-control" placeholder="手机号码">
                <br><br>
                <button class="btn btn-theme03 btn-block" type="button" id="register_button">注册</button>
                <button class="btn btn-theme btn-block" type="button" onclick="close1()">返回登录</button>
                <br>
            </div>
        </form>

    </div>
</div>

<!-- js placed at the end of the document so the pages load faster -->
<script src="${pageContext.request.contextPath }/assets/js/jquery.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/bootstrap.min.js"></script>

<!--BACKSTRETCH-->
<!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery.backstretch.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/gritter/js/jquery.gritter.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/gritter-conf.js"></script>
<script>
    $.backstretch("${pageContext.request.contextPath }/assets/img/login-bg.jpg", {speed: 500});

    document.onkeydown = function(event_e){
        var int_keycode = event_e.charCode||event_e.keyCode;
        if( int_keycode == '13' ) {
//your handler function,please.
            $("#login_button").click();
            return false;
        }
    }

    <!-- Animation -->
    function open1(){
        $("#login").animate({opacity:'0'},"normal");
        setTimeout(function () {
            $("#login").css('display','none');
            $("#register").css('display','block');
            $("#register").animate({opacity:'1'},"normal");
        }, 400);
    };
    function close1(){
        $("#register").animate({opacity:'0'},"normal");
        setTimeout(function () {
            $("#register").css('display','none');
            $("#login").css('display','block');
            $("#login").animate({opacity:'1'},"normal");
        }, 400);
    };

    <!-- Ajax for Login -->
    $(document).ready(function () {
        $("#login_button").click(function ()  {
                $.ajax({
                    type:"post",
                    url:"${pageContext.request.contextPath }/userLogin",
                    data:$("#login").serialize(),
                    success:function (data) {
                        if(data!="")
                        {
                            var unique_id = $.gritter.add({
                                // (string | mandatory) the heading of the notification
                                title: data,
                                // (string | mandatory) the text inside the notification
                                text: data,
                                // (string | optional) the image to display on the left
                                image: '${pageContext.request.contextPath }/assets/img/ilab.jpg',
                                // (bool | optional) if you want it to fade out on its own or just sit there
                                sticky: false,
                                // (int | optional) the time you want it to be alive for before fading out
                                time: '5000',
                                // (string | optional) the class name you want to apply to that specific message
                                class_name: 'my-sticky-class'
                            });
                        }
                        else {
                            window.location.href="${pageContext.request.contextPath }/userIndexUI";
                        }
                    },
                    error:function () {
                        alert("系统异常");
                    }
                });
            }
        );
    });
    <!-- Ajax for Register -->
    $(document).ready(function () {
        $("#register_button").click(function ()  {
                $.ajax({
                    type:"post",
                    url:"${pageContext.request.contextPath }/userRegister",
                    data:$("#register").serialize(),
                    success:function (data) {
                            var unique_id = $.gritter.add({
                                // (string | mandatory) the heading of the notification
                                title: data,
                                // (string | mandatory) the text inside the notification
                                text: data,
                                // (string | optional) the image to display on the left
                                image: '${pageContext.request.contextPath }/assets/img/ilab.jpg',
                                // (bool | optional) if you want it to fade out on its own or just sit there
                                sticky: false,
                                // (int | optional) the time you want it to be alive for before fading out
                                time: '5000',
                                // (string | optional) the class name you want to apply to that specific message
                                class_name: 'my-sticky-class'
                            });
                            if(data=="注册成功，快去登陆吧") close1();
                    },
                    error:function () {
                        alert("系统异常");
                    }
                });
            }
        );
    });
</script>

</body>
</html>
