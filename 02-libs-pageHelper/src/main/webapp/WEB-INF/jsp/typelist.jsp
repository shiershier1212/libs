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
            height: 200px !important;
            margin-left: -320px;
            margin-top: -180px;
            width: 740px;
        }

        .type-list .dialog input {
            width: 60% !important;
        }

        .type-list .dialog .btns-item {
            margin-top: 30px !important;
        }

        .type-add {
            display: none;
        }

        .dialog {
            height: 200px;
            width: 600px;
        }

        .dialog.dialog-page {
            height: 200px;
            width: 700px;
        }

        .dialog.dialog-page .body {
            height: 200px;
            width: 700px;
        }
    </style>
</head>
<body onload="init()">
<div class="index container">
    <div class="header">
        <img class="logo" src="images/logo.png">
        <div class="title">
            <h3>百疆书社 -- 图书馆管理</h3>
            <h5>BAIJIANG BOOKSTORE LIBRARY MANAGE</h5>
        </div>
        <div class="toolbar">
            <a id="account">${user.name}</a>
            <a id="pwdedit">修改密码</a>
            <a id="signout" onclick="signout()">注销</a>
            <img class="usericon" src="images/icons/usericon.png">
        </div>
    </div>
    <div class="main">
        <jsp:include page="toolbar.jsp"/>
        <div class="subpage">
            <div class="concierge-list">
                <jsp:include page="searchform.jsp"/>
                <h2 style="margin-bottom: 5px">类型列表</h2>
                <div class="listwrap">
                    <table>
                        <thead>
                        <tr>
                            <th style="width: 10%;">序号</th>
                            <th style="width: 10%;">类别</th>
                            <th style="width: 10%;">操作</th>
                        </tr>
                        </thead>
                        <tbody id="list-rows">

                        <c:forEach var="type" items="${types}">
                            <tr>
                                <td class="tC">${type.id}</td>
                                <td class="tC">${type.typename}</td>

                                <td class="tC">
                                    <a class="edit btn primary" href="#" onclick="onEdit(${type.id})">修改信息</a>
                                    <a class="delete btn danger" href="#" onclick="deleteEle(${type.id})">删除</a>
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
                                <a href="toTypeList.do?page=1">首页</a>
                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${pageInfo.pageNum==1}">
                                上一页
                            </c:when>
                            <c:otherwise>
                                <a href="toTypeList.do?pn=${pageInfo.prePage}">上一页</a> 
                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${pageInfo.pageNum==pageInfo.pages}">
                                <a>下一页</a> 
                            </c:when>
                            <c:otherwise>
                                <a href="toTypeList.do?pn=${pageInfo.nextPage}">下一页</a> 
                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${pageInfo.pageNum==pageInfo.pages}">
                                <a>尾页</a>
                            </c:when>
                            <c:otherwise>
                                <a href="toTypeList.do?pn=${pageInfo.pages}">尾页</a>
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
    let count = 4;

    function signout() {
        if (confirm("确定要注销吗？")) {
            location.href = "userLoginout";
        }
    }

    function deleteEle(id) {
        if (confirm("确定要删除吗？")) {
            window.location = "toTypeDelete.do?id=" + id;
        }
    }

    function onEdit(id) {
        //使用js跳转页面
        // window.location = "typeList?id=" + id;
        window.location = "toTypeEditJsp.do?id=" + id;
    }

    function init() {
        let opo = "${opo}";
        if (opo === "edit") {
            document.getElementById("type").value = "${type.type}";
            document.getElementById("edit").style.display = "block";
            document.getElementById("shadow").style.display = "block";
        }
    }

    function onNew() {
        // document.getElementById("edit").style.display = "block";
        // document.getElementById("shadow").style.display = "block";
        // 跳转到 增加类别 的页面
        window.location = "toTypeAddJsp.do";
    }

    function newSave() {
        //获取表单的值
        let myform = document.getElementById("myform");

        //判断到底是更新还是添加
        let opo = "${opo}";
        if (opo == "edit" && myform.title != "save") {
            //不建议使用地址加参数，使用的是get请求
            myform.action = "typeUpdate?id=${type.id}";
        }
        myform.submit();
        //提交表单
    }

    function editSave() {
        alert("修改成功！");
        let para = document.createElement("tr");
        let value = document.getElementById("type").value;
        let list = document.getElementById("list-rows");
        list.appendChild(para);
        closeEdit();
    }

    function closeEdit() {
        //还原表单 js代码
        document.getElementById("type").value = "";

        var myform = document.getElementById("myform");
        myform.title = "save";//设置成一个添加标识
        myform.action = "typeSave";

        document.getElementById("edit").style.display = "none";
        document.getElementById("shadow").style.display = "none";
    }

    function loadRecord() {
        // alert("查询成功！");
    }
</script>
</html>