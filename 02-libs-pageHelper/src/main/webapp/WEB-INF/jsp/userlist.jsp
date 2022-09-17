<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>图书管理系统-用户</title>
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
        <div class="subpage" style="overflow: auto">
            <div class="concierge-list">
                <jsp:include page="searchform.jsp"/>
                <h2 style="margin-bottom: 5px">用户列表</h2>
                <div class="listwrap" style="overflow: auto">
                    <table>
                        <thead>
                        <tr>
                            <th style="width: 10%;">序号</th>
                            <th style="width: 20%;">手机号码</th>
                            <th style="width: 20%;">用户名</th>
                            <th style="width: 17%;">操作</th>
                        </tr>
                        </thead>
                        <tbody id="list-rows">

                        <c:forEach var="user" items="${users}">
                            <tr>
                                <td class="tC">${user.id}</td>
                                <td class="tC">${user.phone}</td>
                                <td class="tC">${user.name}</td>
                                <td class="tC">
                                    <a class="edit btn primary" href="#" onclick="onEdit(${user.id})">修改信息</a>
                                    <a class="delete btn danger" href="#" onclick="deleteEle(${user.id})">删除</a>
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
                                <a href="toUserList.do?page=1">首页</a>
                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${pageInfo.pageNum==1}">
                                上一页
                            </c:when>
                            <c:otherwise>
                                <a href="toUserList.do?pn=${pageInfo.prePage}">上一页</a> 
                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${pageInfo.pageNum==pageInfo.pages}">
                                <a>下一页</a> 
                            </c:when>
                            <c:otherwise>
                                <a href="toUserList.do?pn=${pageInfo.nextPage}">下一页</a> 
                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${pageInfo.pageNum==pageInfo.pages}">
                                <a>尾页</a>
                            </c:when>
                            <c:otherwise>
                                <a href="toUserList.do?pn=${pageInfo.pages}">尾页</a>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <%--添加分页结束--%>
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
            window.location = "toUserDelete.do?id=" + e;
        }
    }

    function onEdit(id) {
        window.location = "toUserEditJsp.do?id=" + id;
    }

    function init() {
        var opo = "${opo}";
        if (opo == "edit") {
            document.getElementById("username").value = "${user.name}";
            document.getElementById("phone").value = "${user.phone}";
            document.getElementById("p1").value = "${user.pass}";
            document.getElementById("p2").value = "${user.pass}";

            document.getElementById("edit").style.display = "block";
            document.getElementById("shadow").style.display = "block";
        }
    }

    // 新增
    function onNew() {
        window.location = "toUserAddJsp.do";
    }

    function newSave() {
        //获取表单的值
        var tr = document.createElement("tr");
        var username = document.getElementById("username").value;
        var phone = document.getElementById("phone").value;
        var p1 = document.getElementById("p1").value;
        var p2 = document.getElementById("p2").value;
        var myform = document.getElementById("myform");
        //判断两次密码是否一致
        if (p1 != p2) {
            alert("两次输入的密码不一致！");
            return false;
        }
        //判断到底是更新还是添加
        var opo = "${opo}";

        if (opo == "edit" && myform.title != "save") {
            //不建议使用地址加参数，使用的是get请求
            myform.action = "userUpdate?id=${user.id}";
        }

        myform.submit();

        //提交表单
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
        //还原表单 js代码
        document.getElementById("username").value = "";
        document.getElementById("phone").value = "";
        document.getElementById("p1").value = "";
        document.getElementById("p2").value = "";
        var myform = document.getElementById("myform");
        myform.title = "save";
        myform.action = "userSave";
        document.getElementById("edit").style.display = "none";
        document.getElementById("shadow").style.display = "none";
    }

    function loadRecord() {
        // alert("查询成功！");
    }
</script>
</html>