<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>设备详细信息</title>
    <link href="../css/common/style1.css" type="text/css" rel="stylesheet">
</head>
<body>
    <table class="gridtable">
        <tr>
            <td>设备名称</td>
            <td>${device.name }</td>
        </tr>
        <tr>
            <td>所属仓库名称</td>
            <td>${device.warehouse.name }</td>
        </tr>
        <tr>
            <td>设备类别</td>
            <td>${device.type }</td>
        </tr>
        <tr>
            <td>设备备注</td>
            <td>${device.info }</td>
        </tr>
    </table>
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
