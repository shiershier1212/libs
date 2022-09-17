<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>图书管理系统</title>
    <link href="css/dui.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
    <style type="text/css">
        .book-edit.readonly .img:after,.book-edit.readonly .img#picker,.book-edit.readonly .btns-item {display: none;}
        .book-edit button.success{width: 25%;border-radius: 5px;margin-left: 25%;}
    </style>
</head>
<body>
<div class="index container">
    <jsp:include page="head.jsp"/>
    <div class="main">
        <jsp:include page="toolbar.jsp"/>
        <div class="subpage">
            <div class="book-edit">
                <div class="title">添加用户</div>
                <div class="search-form">
                </div>
                <div class="form">
                    <form  method="post" id="myform"  action="toUserAdd.do" >
                        <div class="form-item">
                            <label>用户名</label>
                            <input id="username" name="name">
                        </div>
                        <div class="form-item">
                            <label class="name-label">手机号码</label>
                            <input id="phone" name="phone">
                        </div>
                        <div class="form-item">
                            <label class="p1">密码</label>
                            <input type="password" id="p1" name="pass" >
                        </div>
                    </form>
                    <div class="form-item btns-item" style="text-align: left;margin-top: 2%;">
                        <button class="primary success" id="save" onclick="save()">添加</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    function xmTanUploadImg(obj) {
        var file = obj.files[0];
        var reader = new FileReader();
        reader.onload = function (e) {
            var img = document.getElementById("xmTanImg");
            img.src = e.target.result;
        }
        reader.readAsDataURL(file)
    }
    function signout(){
        if(confirm("确定要注销吗？")){
            window.location = "userLoginout";
        }
    }
    function save(){
        //获取表单的值
        let myform = document.getElementById("myform");
        myform.submit();
        // alert("添加成功！");
    }
</script>
</html>