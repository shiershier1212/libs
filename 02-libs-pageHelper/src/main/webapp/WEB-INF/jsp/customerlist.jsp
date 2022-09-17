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
                <jsp:include page="searchform.jsp"/>
                <h2 style="margin-bottom: 5px">客户列表</h2>
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

                    <div align="center" style="margin-top: 30px">
                        第${pageInfo.pageNum}页,共${pageInfo.pages}页,${pageInfo.total} 条记录
                        <c:choose>
                            <c:when test="${pageInfo.pageNum==1}">
                                首页
                            </c:when>
                            <c:otherwise>
                                <a href="toCustomerList.do?page=1">首页</a>
                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${pageInfo.pageNum==1}">
                                上一页
                            </c:when>
                            <c:otherwise>
                                <a href="toCustomerList.do?pn=${pageInfo.prePage}">上一页</a> 
                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${pageInfo.pageNum==pageInfo.pages}">
                                <a>下一页</a> 
                            </c:when>
                            <c:otherwise>
                                <a href="toCustomerList.do?pn=${pageInfo.nextPage}">下一页</a> 
                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${pageInfo.pageNum==pageInfo.pages}">
                                <a>尾页</a>
                            </c:when>
                            <c:otherwise>
                                <a href="toCustomerList.do?pn=${pageInfo.pages}">尾页</a>
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
    var count = 4;

    function deleteEle(e) {
        if (confirm("确定要删除吗？")) {
            window.location = "toCustomerDelete.do?id=" + e;
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