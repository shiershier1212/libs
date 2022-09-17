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
            height: 360px !important;
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
            height: 320px;
            width: 600px;
        }

        .dialog.dialog-page {
            height: 320px;
            width: 700px;
        }

        .dialog.dialog-page .body {
            height: 320px;
            width: 700px;
        }
    </style>
</head>
<body onload="init()">
<div class="index container">
    <jsp:include page="head.jsp"/>
    <div class="main">
        <jsp:include page="toolbar.jsp"/>
        <div class="subpage">
            <div class="concierge-list">
                <div class="search-form">
                    <div class="form-item">
                        <label>用户名</label>
                        <input id="uname">
                    </div>
                    <div class="form-item">
                        <label>姓名昵称</label>
                        <input id="name">
                    </div>
                    <div class="form-item btns-item">
                        <button class="success" id="new" onclick="onNew()">新增</button>
                        <button class="primary" id="search" onclick="loadRecord()">查询</button>
                    </div>
                </div>
                <div class="listwrap">
                    <table>
                        <thead>
                        <tr>
                            <th style="width: 10%;">序号</th>
                            <th style="width: 10%;">手机号码</th>
                            <th style="width: 10%;">用户名</th>
                            <th style="width: 17%;">地址</th>
                            <th style="width: 17%;">工作单位</th>
                            <th style="width: 10%;">操作</th>
                        </tr>
                        </thead>
                        <tbody id="list-rows">

                        <c:forEach var="customer" items="${customers}">
                            <tr>
                                <td class="tC">${customer.id}</td>
                                <td class="tC">${customer.phone}</td>
                                <td class="tC">${customer.name}</td>
                                <td class="tC">${customer.address}</td>
                                <td class="tC">${customer.company}</td>
                                <td class="tC">
                                    <a class="edit btn primary" href="#" onclick="onEdit(${customer.id})">修改信息</a>
                                    <a class="delete btn danger" href="#" onclick="deleteEle(${customer.id})">删除</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>

            </div>
            <div id="shadow"></div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    var count = 4;

    function deleteEle(e) {
        if (confirm("确定要删除吗？")) {
            window.location = "customerDelete?id=" + e;
        }
    }

    function onEdit(id) {
        window.location = "toCustomerEditJsp.do?id=" + id;
    }

    function init() {
        let opo = "${opo}";
        if (opo === "edit") {
            document.getElementById("username").value = "${customer.name}";
            document.getElementById("phone").value = "${customer.phone}";
            document.getElementById("address").value = "${customer.address}";
            document.getElementById("company").value = "${customer.company}";

            document.getElementById("edit").style.display = "block";
            document.getElementById("shadow").style.display = "block";
        }
    }

    function onNew() {
        window.location = "toCustomerAddJsp.do";
    }

    function newSave() {
        var myform = document.getElementById("myform");
        var opo = "${opo}";
        if (opo == "edit" && myform.title != "save") {
            myform.action = "customerUpdate?id=${customer.id}";
        }
        myform.submit();
    }

    function editSave() {
        alert("修改成功！");
        var para = document.createElement("tr");
        var value = document.getElementById("typename").value;
        var list = document.getElementById("list-rows");
        list.appendChild(para);
        closeEdit();
    }

    function closeEdit() {
        document.getElementById("username").value = "";
        document.getElementById("phone").value = "";
        document.getElementById("address").value = "";
        document.getElementById("company").value = "";
        var myform = document.getElementById("myform");
        myform.title = "save";//设置成一个添加标识
        myform.action = "customerSave";
        document.getElementById("edit").style.display = "none";
        document.getElementById("shadow").style.display = "none";
    }

    function loadRecord() {
        alert("查询成功！");
    }
</script>
</html>