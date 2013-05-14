<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>设备信息</title>
    <link href="../css/common/style1.css" type="text/css" rel="stylesheet">

</head>
<body>
    <div id="add">
        <a href="addUser" id="addUser">添加用户</a>
    </div>
    <div id="list">
        <table class="gridtable" style="width: 100%">
            <caption>用户列表</caption>
            <tr>
                <td>操作</td>
                <td>id</td>
                <td>用户名</td>
                <td>真实姓名</td>
                <td>电话号码</td>
                <td>电子邮件</td>
                <td>家庭住址</td>
            </tr>
            <c:forEach items="${users }" var="user">
                <tr>
                    <td>
                        <a href="editUser?u_id=${user.id}" class="editDevice">编辑</a>
                        <a href="deleteUser?u_id=${user.id }" class="delete">删除</a>
                    </td>
                    <td>${user.id }</td>
                    <td>
                        <a href="userinfo?u_id=${user.id }">${user.username }</a>
                    </td>
                    <td>${user.name}</td>
                    <td>${user.telephone}</td>
                    <td>${user.email}</td>
                    <td>${user.address}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
