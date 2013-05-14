<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<form action="updatePwd" method="post">
    <input type="hidden" name="user.id" value="${user.id}" />
    <input type="hidden" name="id" value="${user.id}" />
<fieldset>
    <legend>修改密码</legend>
    <label>原密码</label>
    <input type="password" name="password" />
    <label>新密码</label>
    <input type="password" name="user.password">
    <label>确认密码</label>
    <input type="password" name="confirmpassword">
</fieldset>
    <input type="submit" value="确认">
</form>
