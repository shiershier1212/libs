<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>图书管理系统</title>
    <link type="text/css" rel="stylesheet" href="css/main.css">
    <link type="text/css" rel="stylesheet" href="css/dui.css">
    <style type="text/css">
        body {background: #222;}
        .signbox {position: relative;top: 60px;}
        .signbox .logo {height: 90vh;width: 100%;}
        .sign-form {height: 90vh;position: relative;float: right;}
        .sign-form h2 {color: #585858;}
        .sign-form .title {padding-top: 120px;}
        .sign-form .title h4 {color: #008260;}
        .sign-form .label {padding-top: 60px;}
        .sign-form .title,.sign-form .label {text-align: center;}
        .sign-form .form-item {background: #fff;border: 1px solid #ccc;margin: 30px 60px 0;position: relative;}
        .sign-form .form-item:before {background: no-repeat center;content: '';display: block;height: 54px;left: 0;position: absolute;top: 0;width: 54px;}
        .sign-form .form-item:after {background: no-repeat center;content: '';display: block;height: 54px;position: absolute;right: 0;top: 0;width: 54px;}
        .sign-form .form-item.uwrap:before {background-image: url(images/icons/icon-user.png);}
        .sign-form .form-item.pwrap:before {background-image: url(images/icons/icon-pass.png);}
        .sign-form .form-item.success:after {background-image: url(images/icons/icon-check.png);}
        .sign-form .form-item.error:after {background-image: url(images/icons/icon-error.png);}
        .sign-form .form-item input {background: transparent;border: none;height: 54px;padding: 6px 60px;width: 100%;}
        .sign-form .btns-item {bottom: 0;position: absolute;margin-top: 30px;width: 100%;}
        .sign-form .btns-item button {border-radius: 0;height: 54px;width: 100%;}
    </style>
</head>
<body>
<div class="signbox container items-8">
    <img class="item-6 logo" src="images/icons/signin-logo.png" alt="">
    <div class="item-6 sign-form">
        <div class="title">
            <h2>百疆书社 -- 图书馆管理</h2>
            <h4>PERSONAL LIBRARY BACKGROUND MANAGEMENT</h4>
        </div>
        <div class="label">
            <h2>登&nbsp;&nbsp;录</h2>
            <h3>LOGIN</h3>
        </div>
        <form action="toLogin.do" method="post" id="myform">
            <div class="form-item uwrap"><input id="user" name="phone" value="1"></div>
            <div class="form-item pwrap"><input id="pass" type="password" name="pass" value="1"></div></form>
        <div class="btns-item"><button id="signin" class="primary success" onClick="signin()">登录</button></div>
    </div>
</div>
</body>
<script type="text/javascript">
    function signin() {
        let username = document.getElementById('user').value;
        let password = document.getElementById('pass').value;
        if (username === '') {
            alert("请输入用户名");
            return false;
        }
        if (password === '') {
            alert("请输入密码");
            return false;
        }
        let myform = document.getElementById("myform");
        myform.submit();
    }
</script>
</html>