<%--
  Created by IntelliJ IDEA.
  User: S6203-1-08
  Date: 2020/11/16
  Time: 19:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>图书管理系统</title>
    <link href="css/dui.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
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
            <a id="pwdedit" onclick="pwdedit()">修改密码</a>
            <a id="signout" onclick="signout()">注销</a>
            <img class="usericon" src="images/icons/usericon.png">
        </div>
    </div>
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
                        <button class="success" id="new" onclick="onNew()">借书</button>
                        <button class="primary" id="search" onclick="loadRecord()">查询</button>
                    </div>
                </div>
                <div class="listwrap">
                    <table>
                        <thead>
                        <tr>
                            <th style="width: 10%;">序号</th>
                            <th style="width: 10%;">书名</th>
                            <th style="width: 10%;">借书人</th>
                            <th style="width: 10%;">借书日期</th>
                            <th style="width: 10%;">操作</th>
                        </tr>
                        </thead>
                        <tbody id="list-rows">

                        <c:forEach var="row" items="${borrows}">
                        <tr>
                            <td class="tC">${row.id}</td>
                            <td class="tC">${row.book.name}</td>
                            <td class="tC">${row.customer.name}</td>
                            <td class="tC">${row.bdate}</td>


                            <td class="tC">
                                <a class="edit btn primary" href="#" onclick="onEdit(${row.id})">还书</a>
                            </td>
                        </tr></c:forEach>


                        </tbody>
                    </table>
                </div>

            </div>
            <div class="dialog dialog-page" style="display: none;" id="edit">
                <div class="header">
                    <span>编辑客户</span><i class="close" onclick="closeEdit()"></i>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">

    var count = 4;
    function signout(){
        if(confirm("确定要注销吗？")){
            location.href = "userLoginout";
        }
    }
    function deleteEle(e){
        if(confirm("确定要删除吗？")){
            window.location="borrowDelete?id="+e;
        }
    }
    function onEdit(id){
        //使用js跳转页面
       window.location="returnBook?id="+id;


    }

    function onNew(){
       window.location="borrow";
    }
    function newSave(){

        //获取表单的值
        var myform = document.getElementById("myform");

        myform.submit();
        //提交表单
    }
function pwdedit() {
    window.location="pwedit.jsp"
}
</script>
</html>