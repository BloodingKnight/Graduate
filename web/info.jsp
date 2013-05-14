<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<form action="update" method="post">
<fieldset>
    <a href="pwd?id=${user.id }">修改密码</a>
    <br />
    <input type="hidden" name="user.id" value="${user.id}" />
    <legend>基本信息</legend>
    <label for="username">用户名</label>
    <input id="username" name="user.username" value="${user.username}" type="text" /><br />
    <label for="name">真实姓名</label>
    <input id="name" name="user.name" value="${user.name}" type="text" /><br />
    <label for="telephone">电话号码</label>
    <input id="telephone" name="user.telephone" value="${user.telephone}" type="text" /><br />
    <label for="email">电子邮件</label>
    <input id="email" name="user.email" value="${user.email}" type="text" /><br />
    <label for="address">家庭住址</label>
    <input id="address" name="user.address" value="${user.address}" type="text" /><br />

</fieldset>
    <input type="submit" value="确认">
</form>
