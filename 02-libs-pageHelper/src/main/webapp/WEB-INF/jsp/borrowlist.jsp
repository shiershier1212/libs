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
    <jsp:include page="head.jsp"/>
    <div class="main">
        <jsp:include page="toolbar.jsp"/>
        <div class="subpage">
            <div class="concierge-list">
                <div class="search-form">
                    <div class="form-item">
                        <label for="uname">用户名</label><input id="uname">
                    </div>
                    <div class="form-item">
                        <label for="name">姓名昵称</label><input id="name">
                    </div>
                    <div class="form-item btns-item">
                        <button class="success" id="new" onclick="onNew()">借书</button>
                        <button class="primary" id="search" onclick="loadRecord()">查询</button>
                    </div>
                </div>
                <h2 style="margin-bottom: 5px">借阅列表</h2>
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

                    <div align="center" style="margin-top: 30px">
                        第${pageInfo.pageNum}页,共${pageInfo.pages}页,${pageInfo.total} 条记录
                        <c:choose>
                            <c:when test="${pageInfo.pageNum==1}">
                                首页
                            </c:when>
                            <c:otherwise>
                                <a href="toBorrowList.do?page=1">首页</a>
                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${pageInfo.pageNum==1}">
                                上一页
                            </c:when>
                            <c:otherwise>
                                <a href="toBorrowList.do?pn=${pageInfo.prePage}">上一页</a> 
                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${pageInfo.pageNum==pageInfo.pages}">
                                <a>下一页</a> 
                            </c:when>
                            <c:otherwise>
                                <a href="toBorrowList.do?pn=${pageInfo.nextPage}">下一页</a> 
                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${pageInfo.pageNum==pageInfo.pages}">
                                <a>尾页</a>
                            </c:when>
                            <c:otherwise>
                                <a href="toBorrowList.do?pn=${pageInfo.pages}">尾页</a>
                            </c:otherwise>
                        </c:choose>
                    </div>

                </div>

            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">

    let count = 4;
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
       window.location="toBorrowReturn.do?id="+id;
    }
    function onNew(){
       window.location="toBorrowAddJsp.do";
    }
    function newSave(){
        var myform = document.getElementById("myform");
        myform.submit();
    }
function pwdedit() {
    window.location="pwedit.jsp"
}
</script>
</html>