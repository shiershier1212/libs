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
        .type-list .dialog {height:980px !important;margin-left: -320px;margin-top: -250px;width: 740px;}
        .type-list .dialog input {width: 60% !important;}
        .type-list .dialog .btns-item {margin-top: -10px !important;}
        .type-add{display: none;}
        .dialog{height:980px;width:600px;}
        .dialog.dialog-page {height:980px;width:700px;margin-top: -380px;}
        .dialog.dialog-page .body{height: 980px;width:700px;}
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
        <div class="toolbar">
            <div class="btns-wrap">
                <div class="btns-tool">
                    <a id="editbook" title="借阅管理" href="http://localhost:8081/toBorrowList.do"></a>
                    <a id="addbook" title="图书管理" href="http://localhost:8081/toBookList.do"></a>
                    <a id="typemgr" title="类别管理" href="http://localhost:8081/toTypeList.do"></a>
                    <a id="bookmgr" title="客户管理" href="http://localhost:8081/toCustomerList.do" ></a>
                    <a id="usermgr" title="用户管理" href="http://localhost:8081/toUserList.do" ></a>
                </div>
            </div>
        </div>
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
<%--                    <div class="form-item btns-item">--%>
<%--                        <button class="success" id="new" onclick="onNew()">新增</button>--%>
<%--                        <button class="primary" id="search" onclick="loadRecord()">查询</button>--%>
<%--                    </div>--%>
                </div>
                <div class="listwrap">

                </div>

            </div>
            <div class="dialog dialog-page" style="display: none;" id="edit">
                <div class="header">
                    <span>编辑客户</span><i class="close" onclick="closeEdit()"></i>
                </div>
                <div class="body">
                    <div class="concierge-add">

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
    function signout(){
        if(confirm("确定要注销吗？")){
            location.href = "userLoginout";
        }
    }
    function deleteEle(e){
        if(confirm("确定要删除吗？")){
            window.location="bookDelete?id="+e;
        }
    }
    function onEdit(id){
        //使用js跳转页面
        window.location="bookEdit?id="+id;


    }
    function init() {
        var opo="${opo}";
        if(opo=="edit"){
            document.getElementById("type").value="${type.type}";


            document.getElementById("edit").style.display="block";
            document.getElementById("shadow").style.display="block";
        }
    }
    function onNew(){
        window.location="bookAdd";
    }
    function newSave(){

        //获取表单的值
        var myform = document.getElementById("myform");

        //判断到底是更新还是添加
        var opo="${opo}";
        if(opo=="edit"&&myform.title!="save"){
            //不建议使用地址加参数，使用的是get请求
            myform.action="typeUpdate?id=${type.id}";
        }
        myform.submit();
        //提交表单
    }
    function editSave(){
        alert("修改成功！");
        var para = document.createElement("tr");
        var value = document.getElementById("type").value;
        var list = document.getElementById("list-rows");
        list.appendChild(para);
        closeEdit();
    }
    function closeEdit(){
        //还原表单 js代码
        //   document.getElementById("type").value="";

        var myform = document.getElementById("myform");
        myform.title="save";//设置成一个添加标识
        myform.action="typeSave";

        document.getElementById("edit").style.display="none";
        document.getElementById("shadow").style.display="none";
    }
    function loadRecord(){
        alert("查询成功！");
    }
</script>
</html>