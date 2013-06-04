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
    <div id="list">
        <table class="gridtable" style="width: 100%;">
            <caption>计划列表</caption>
            <tr>
                <td>id</td>
                <td>计划名称</td>
                <td>计划对应设备名</td>
                <td>计划负责人</td>
                <td>计划截止日期</td>
            </tr>
            <c:forEach items="${plans }" var="plan">
            <tr>
                <td>${plan.id }</td>
                <td>
                    <a href="info?p_id=${plan.id}">${plan.name }</a>
                </td>
                <td>${plan.device.name }</td>
                <td>${plan.admin }</td>
                <td>${plan.deadline }</td>
            </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
