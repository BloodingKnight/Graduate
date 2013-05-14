<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>检查计划列表</title>
    <link href="../css/common/style1.css" type="text/css" rel="stylesheet">

    <script type="text/javascript" src="../js/tools/jquery-1.9.1.js"></script>
</head>
<body>
    <div id="add">
        <a href="add">添加计划</a>
    </div>
    <div id="list">
        <table class="gridtable" style="width: 100%">
            <caption>计划列表</caption>
            <tr>
                <td>操作</td>
                <td>id</td>
                <td>计划名称</td>
                <td>计划对应设备名</td>
            </tr>
            <c:forEach items="${plans }" var="plan">
            <tr>
                <td>
                    <a href="edit?id=${plan.id }">编辑</a>
                    <a href="delete?id=${plan.id }" class="delete">删除</a>
                </td>
                <td>${plan.id }</td>
                <td>
                    <a href="info?id=${plan.id}">${plan.name }</a>
                </td>
                <td>${plan.device.name }</td>
            </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
