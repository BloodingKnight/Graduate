<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>检查计划详细信息</title>

</head>
<body>
    <label for="name">检查计划名称</label>
    <span id="name">${plan.name }</span>
    <br />

    <label for="baseName">所属设备名称</label>
    <span id="baseName">${plan.device.name }</span>
    <br />

    <label for="info">检查计划频率</label>
    <span id="info">${plan.frequency }</span>
    <br />

    <hr />

    <fieldset>
        <legend>检查项|<a href="edit?id=${plan.id }">添加检查项</a></legend>
        <ul id="inspects">
            <c:forEach items="${plan.inspects }" var="inspect">
                <li>${inspect.name }</li>
            </c:forEach>
        </ul>
    </fieldset>
</body>
</html>
