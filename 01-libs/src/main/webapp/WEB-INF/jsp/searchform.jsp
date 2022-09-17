<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
