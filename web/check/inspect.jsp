<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>检查</title>

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

    <label for="open">检查报告开始时间</label>
    <span id="open">${report.open }</span>
    <br />

    <hr />

    <label>检查项</label>
    <span>${inspect.name }</span>
    <br />

    <form action="save" method="post">
        <input type="hidden" name="r_id" value="${report.id}">
        <input type="hidden" name="result.i_id" value="${inspect.id}">
        <input type="hidden" name="result.r_id" value="${report.id}">
        <label>是否正常</label>
        <input type="radio" value="0" name="result.norm" />正常
        <input type="radio" value="1" name="result.norm" />不正常
        <br />

        <label>备注</label>
        <input type="text" name="result.info" />

        <input type="submit" value="检查完成" />
    </form>
</body>
</html>
