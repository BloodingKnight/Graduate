<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="contentType" content="text/html; encoding=UTF-8">
	<title>点检系统</title>
</head>
<body>
	<h1>点检系统页头</h1>
    <span>
        欢迎， <a href="/Graduate/modify?id=${sessionScope.loginUser.get("id") }">${sessionScope.loginUser.get("username")}</a>
        |<a href="/Graduate/logout">注销登录</a>
    </span>
    <hr />
</body>
</html>
