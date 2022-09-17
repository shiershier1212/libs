<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="header">
    <img class="logo" src="images/logo.png">
    <div class="title">
        <h3>百疆书社 -- 图书馆管理</h3>
        <h5>BAIJIANG BOOKSTORE LIBRARY MANAGE</h5>
    </div>
    <div class="toolbar">
        <a id="account">${nowLoginUser.name}</a>
        <a id="pwdedit">修改密码</a>
        <a id="signout" onclick="signout()">注销</a>
        <img class="usericon" src="images/icons/usericon.png">
    </div>
</div>
