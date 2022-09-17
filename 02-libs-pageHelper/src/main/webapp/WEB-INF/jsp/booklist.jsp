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
        .type-list .dialog {
            height: 980px !important;
            margin-left: -320px;
            margin-top: -250px;
            width: 740px;
        }

        .type-list .dialog input {
            width: 60% !important;
        }

        .type-list .dialog .btns-item {
            margin-top: -10px !important;
        }

        .type-add {
            display: none;
        }

        .dialog {
            height: 980px;
            width: 600px;
        }

        .dialog.dialog-page {
            height: 980px;
            width: 700px;
            margin-top: -380px;
        }

        .dialog.dialog-page .body {
            height: 980px;
            width: 700px;
        }
    </style>
</head>
<body onload="init()">
<div class="index container">
    <jsp:include page="head.jsp"/>
    <div class="main">
        <jsp:include page="toolbar.jsp"/>
        <div class="subpage" style="overflow: auto">
            <div class="concierge-list">
                <jsp:include page="searchform.jsp"/>
                <h2 style="margin-bottom: 5px">图书列表</h2>
                <div class="listwrap">
                    <table>
                        <thead>
                        <tr>
                            <th style="width: 10%;">序号</th>
                            <th style="width: 10%;">书名</th>
                            <th style="width: 10%;">作者</th>
                            <th style="width: 10%;">出版社</th>
                            <th style="width: 10%;">价格</th>
                            <th style="width: 10%;">类别</th>
                            <th style="width: 10%;">图片</th>
                            <th style="width: 10%;">操作</th>
                        </tr>
                        </thead>
                        <tbody id="list-rows">

                        <c:forEach var="book" items="${books}">
                            <tr>
                                <td class="tC">${book.id}</td>
                                <td class="tC">${book.name}</td>
                                <td class="tC">${book.author}</td>
                                <td class="tC">${book.publisher}</td>
                                <td class="tC">${book.price}</td>
                                <td class="tC">${book.type.typename}</td>
                                <td class="tC"><img src="/upload/${book.image}" style="height: 100px;width:100px;"></td>

                                <td class="tC">
                                    <a class="edit btn primary" href="#" onclick="onEdit(${book.id})">修改信息</a>
                                    <a class="delete btn danger" href="#" onclick="deleteEle(${book.id})">删除</a>
                                </td>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>

                    <div align="center" style="margin-top: 30px">
                        第${pageInfo.pageNum}页,共${pageInfo.pages}页,${pageInfo.total} 条记录
                        <c:choose>
                            <c:when test="${pageInfo.pageNum==1}">
                                首页
                            </c:when>
                            <c:otherwise>
                                <a href="toBookList.do?page=1">首页</a>
                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${pageInfo.pageNum==1}">
                                上一页
                            </c:when>
                            <c:otherwise>
                                <a href="toBookList.do?pn=${pageInfo.prePage}">上一页</a> 
                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${pageInfo.pageNum==pageInfo.pages}">
                                <a>下一页</a> 
                            </c:when>
                            <c:otherwise>
                                <a href="toBookList.do?pn=${pageInfo.nextPage}">下一页</a> 
                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${pageInfo.pageNum==pageInfo.pages}">
                                <a>尾页</a>
                            </c:when>
                            <c:otherwise>
                                <a href="toBookList.do?pn=${pageInfo.pages}">尾页</a>
                            </c:otherwise>
                        </c:choose>
                    </div>

                </div>

            </div>
            <div id="shadow"></div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    //选择图片，马上预览
    function xmTanUploadImg(obj) {

        var file = obj.files[0];

        var reader = new FileReader();
        reader.onload = function (e) {
            var img = document.getElementById("xmTanImg");
            img.src = e.target.result;
        }
        reader.readAsDataURL(file)
    }

    var count = 4;

    function signout() {
        if (confirm("确定要注销吗？")) {
            location.href = "userLoginout";
        }
    }

    function deleteEle(e) {
        if (confirm("确定要删除吗？")) {
            window.location = "toBookDelete.do?id=" + e;
        }
    }

    function onEdit(id) {
        window.location = "toBookEditJsp.do?id=" + id;
    }

    function init() {
        var opo = "${opo}";
        if (opo == "edit") {
            document.getElementById("type").value = "${type.type}";


            document.getElementById("edit").style.display = "block";
            document.getElementById("shadow").style.display = "block";
        }
    }

    function onNew() {
        window.location = "toBookAddJsp.do";
    }

    function newSave() {

        //获取表单的值
        var myform = document.getElementById("myform");

        //判断到底是更新还是添加
        var opo = "${opo}";
        if (opo == "edit" && myform.title != "save") {
            //不建议使用地址加参数，使用的是get请求
            myform.action = "typeUpdate?id=${type.id}";
        }
        myform.submit();
        //提交表单
    }

    function editSave() {
        alert("修改成功！");
        var para = document.createElement("tr");
        var value = document.getElementById("type").value;
        var list = document.getElementById("list-rows");
        list.appendChild(para);
        closeEdit();
    }

    function closeEdit() {
        //还原表单 js代码
        //   document.getElementById("type").value="";

        var myform = document.getElementById("myform");
        myform.title = "save";//设置成一个添加标识
        myform.action = "typeSave";

        document.getElementById("edit").style.display = "none";
        document.getElementById("shadow").style.display = "none";
    }

    function loadRecord() {
        alert("查询成功！");
    }
</script>
</html>