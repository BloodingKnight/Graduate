<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>检查计划详细信息</title>
    <link href="../css/common/style1.css" type="text/css" rel="stylesheet">

</head>
<body>
    <p>${openReportError }</p>
    <label for="name">检查计划名称</label>
    <span id="name">${plan.name }</span>
    <br />

    <label for="baseName">所属设备名称</label>
    <span id="baseName">${plan.device.name }</span>
    <br />

    <label for="start">检查计划开始时间</label>
    <span id="start">${plan.start }</span>
    <br />

    <label for="deadline">检查计划截止日期</label>
    <span id="deadline">${plan.deadline }</span>
    <br />

    <label for="info">检查计划备注</label>
    <span id="info">${plan.info }</span>
    <br />

    <hr />

    <fieldset>
        <legend>检查报告|<a href="open?p_id=${plan.id }">新建检查报告</a></legend>
        <table id="reports" class="gridtable" style="width: 100%;">
            <tr>
                <th>操作</th>
                <th>id</th>
                <th>开始时间</th>
                <th>结束时间</th>
                <th>备注</th>
            </tr>
            <c:forEach items="${plan.reports }" var="report">
                <tr>
                    <td>
                        <a href="check?r_id=${report.id }">继续检查</a>
                    </td>
                    <td>${report.id }</td>
                    <td>${report.open}</td>
                    <td>${empty report.close ? "-" : report.close}</td>
                    <td>${empty report.memo ? "-" : report.memo}</td>
                </tr>
            </c:forEach>
        </table>
    </fieldset>
</body>
</html>
