<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <title>添加设备</title>
</head>
<body>
<form action="saveUser" method="post">
    <span style="color: red">${userExsists}</span>
    <%@include file="_form.jsp"%>
</form>
</body>
</html>