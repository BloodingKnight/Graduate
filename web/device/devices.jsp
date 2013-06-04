<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>设备信息</title>
    <link href="../css/common/style1.css" type="text/css" rel="stylesheet">

</head>
<body>
    <div id="error">
        <p>${nameMsg }</p>
        <p>${adminMsg }</p>
    </div>
    <div id="add">
        <a href="add" id="addDevice">添加设备</a>
    </div>
    <div id="list">
        <table style="width: 100%;" class="gridtable">
            <caption>设备列表</caption>
            <tr>
                <th>id</th>
                <th>设备名称</th>
                <th>设备类别</th>
                <th>设备所属仓库名称</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${devices }" var="device">
                <tr>
                    <td>${device.id }</td>
                    <td>
                        <a href="info?id=${device.id }">${device.name }</a>
                    </td>
                    <td>${device.type}</td>
                    <td>${device.warehouse_name}</td>
                    <td>
                        <a href="edit?id=${device.id}" class="editDevice">编辑</a>
                        <a href="delete?id=${device.id }" class="delete">删除</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
