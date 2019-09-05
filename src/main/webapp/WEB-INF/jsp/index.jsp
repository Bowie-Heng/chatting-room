<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <!--图标-->
    <link rel="icon" href="img/robot.ico">

    <title>Bowie's Robot</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/grayscale.min.css" rel="stylesheet">


</head>

<body id="page-top">

<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
    <div class="container">
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
                data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
                aria-label="Toggle navigation">
            Menu
            <i class="fas fa-bars"></i>
        </button>
    </div>
</nav>

<!-- Header -->
<header class="masthead">
    <div class="container d-flex h-100 align-items-center">
        <div class="mx-auto text-center">
            <h1 class="mx-auto my-0 text-uppercase">Hi,${name}</h1>
            <h2 class="text-white-50 mx-auto mt-2 mb-5">I'm the robot made by Bowie</h2>
            <a href="#talk" class="btn btn-primary js-scroll-trigger">talk to me</a>
        </div>
    </div>
</header>


<!-- Signup Section -->
<section id="talk" class="signup-section">
    <div class="container">
        <div class="row" style="padding-top: 4rem">
            <div class="col-md-10 col-lg-8 mx-auto text-center">

                <i class="far fa-paper-plane fa-2x mb-2 text-white"></i>
                <h2 class="text-white mb-5">Enter what you want to say,and click say</h2>

                <div class="form-inline d-flex">
                    <input id="msg" class="form-control flex-fill mr-0 mr-sm-2 mb-3 mb-sm-0"
                           placeholder="the word you want to say...">
                    <button id="sendBtn" onclick="send()" type="button" class="btn btn-primary mx-auto">Say</button>
                </div>
                <br>
                <h2 id="result" class="text-white mb-5">I am waiting...</h2>

            </div>
        </div>
    </div>
</section>


<!-- Footer -->
<footer class="bg-black small text-center text-white-50">
    <div class="container">
        Copyright &copy; Bowie's Robot 2019
    </div>
</footer>

<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Plugin JavaScript -->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for this template -->
<script src="js/grayscale.min.js"></script>

</body>

<script type="application/javascript">
    var socket;

    var userId = "user : " + new Date().getTime();
    //登录过后初始化socket连接
   $(function () {
       if (typeof (WebSocket) == "undefined") {
           alert("您的浏览器不支持跟我聊天哦,请切换浏览器");
           return;
       }
       //socket连接地址: 注意是ws协议
       socket = new WebSocket("${address}" +userId);
       socket.onopen = function () {
           console.log("Socket 已打开");
       };
       //获得消息事件
       socket.onmessage = function (msg) {
           console.log(msg.data);
           var $result = $("#result");
           $result.hide();
           $result.text(msg.data);
           $result.fadeIn(1400, function () {
           });

       };
       //关闭事件
       socket.onclose = function () {
           console.log("Socket已关闭");
       };
       //错误事件
       socket.onerror = function () {
           alert("Socket发生了错误");
       };
       // $(window).unload(function () {
       //     socket.close();
       // });

       //刷新自动置顶
       if(document.body.scrollTop > 0) {
           console.log(1);
           window.scrollTo(0, -1);
           document.body.scrollTop = 0;
       }
       window.scrollTo(0, -1);
       document.body.scrollTop = 0;
   });

    //绑定回车事件
    $("#msg").keypress(function(e) {
        if((e.keyCode || e.which)==13) {
            $("#sendBtn").click();  //回车自动发送
        }
    });

    //点击按钮发送消息
    function send() {
        console.log("发送消息: " + $("#msg").val());
        socket.send($("#msg").val());
        $("#msg").val("");
    }

</script>

</html>
