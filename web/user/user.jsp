<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>用户详细信息</title>

</head>
<body>
    <label for="username">用户名</label>
    <span id="username">${user.username }</span>
    <br />

    <label for="name">真实姓名</label>
    <span id="name">${user.name }</span>
    <br />

    <label for="telephone">电话</label>
    <span id="telephone">${user.telephone }</span>
    <br />

    <label for="email">电子邮件</label>
    <span id="email">${user.email }</span>
    <br />

    <label for="address">家庭住址</label>
    <span id="address">${user.address }</span>
    <br />

    <a href="editUser?u_id=${user.id }">编辑用户信息</a>

    <hr />

    <fieldset>
        <legend>权限|<a href="editUser?u_id=${user.id }">编辑用户权限</a></legend>
        <ul id="operators">
            <c:forEach items="${user.operators }" var="inspect">
                <li>${operator.name }</li>
            </c:forEach>
        </ul>
    </fieldset>
</body>
</html>
