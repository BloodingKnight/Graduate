<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>设备详细信息</title>

</head>
<body>
    <label for="name">设备名称</label>
    <span id="name">${device.name }</span>
    <br />

    <label for="baseName">所属仓库名称</label>
    <span id="baseName">${device.warehouse.name }</span>
    <br />

    <label for="info">备注</label>
    <span id="info">${device.info }</span>
    <br />

    <hr />

    <fieldset>
        <legend>检查项|<a href="edit?id=${device.id }">添加检查项</a></legend>
        <ul id="inspects">
            <c:forEach items="${device.inspects }" var="inspect">
                <li>${inspect.name }</li>
            </c:forEach>
        </ul>
    </fieldset>

    <fieldset>
        <legend>检查计划|<a href="../plan/add?d_id=${device.id }">添加计划</a></legend>
        <ul id="plans">
            <c:forEach items="${device.plans }" var="plan">
                <li>
                    <a href="../plan/info?id=${plan.id }">${plan.name }</a>
                </li>
            </c:forEach>
        </ul>
    </fieldset>
</body>
</html>
