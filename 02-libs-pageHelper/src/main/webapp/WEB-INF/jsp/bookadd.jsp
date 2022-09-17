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
        .book-edit.readonly .img:after, .book-edit.readonly
        .img#picker, .book-edit.readonly .btns-item {
            display: none;
        }

        .book-edit button.success {
            width: 25%;
            border-radius: 5px;
            margin-left: 25%;
        }
    </style>
</head>
<body>
<div class="index container">
    <jsp:include page="head.jsp"/>
    <div class="main">
        <jsp:include page="toolbar.jsp"/>
        <div class="subpage" style="overflow: auto">
            <div class="book-edit">
                <div class="title">添加书籍</div>
                <div class="search-form">
                </div>
                <div class="form">
                    <form method="post" id="myform" action="toBookAdd.do">
                        <div class="form-item">
                            <label>书名: </label>
                            <input id="bookname" name="name" type="text">
                        </div>
                        <div class="form-item">
                            <label>英文名: </label>
                            <input id="ename" name="ename">
                        </div>
                        <div class="form-item">
                            <label for="typeid">类别: </label>
                            <select id="typeid" name="typeid">
                                <c:forEach var="type" items="${types}">
                                    <option value="${type.id}">${type.typename}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-item">
                            <label>作者: </label>
                            <input id="author" name="author">
                        </div>
                        <div class="form-item">
                            <label>出版社: </label>
                            <input id="publish" name="publisher">
                        </div>
                        <div class="form-item">
                            <label>出版日期: </label>
                            <input id="publishdate" name="pdate" type="date">
                        </div>
                        <div class="form-item">
                            <label>ISBN: </label>
                            <input id="isbn" name="isbn">
                        </div>
                        <div class="form-item">
                            <label>价格: </label>
                            <input id="price" name="price">
                        </div>
                        <div class="form-item">
                            <label>存放位置: </label>
                            <input id="location" name="address">
                        </div>
                        <div class="text-item">
                            <label>简介: </label>
                            <textarea id="introduction" name="brief"></textarea>
                        </div>
                        <div class="file-item">
                            <label>照片: </label>
                            <input id="pic" type="file" accept="image/*"
                                   onchange="xmTanUploadImg(this)" name="image">
                            <img style="width: 100px;height:100px;float: left;" id="xmTanImg"/><br/>
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

    function signout() {
        if (confirm("确定要注销吗？")) {
            location.href = "userLoginout";
        }
    }

    function save() {
        let myform = document.getElementById("myform");
        myform.submit();
    }
</script>
</html>