<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <title>修改设备</title>
</head>
<body>
<form action="update" method="post">
    <%@include file="_form.jsp"%>
</form>
<fieldset>
    <legend>检测方案</legend>
    <a href="../plan/add?d_id=${device.id }">添加检测计划</a>
    <ul>
        <c:forEach items="${device.plans }" var="plan">
            <li>
                    <span>
                        <a href="../plan/edit?id=${plan.id }">修改</a>
                        |
                        <a href="../plan/delete?id=${plan.id }">删除</a>
                        |
                        <a href="../plan/info?id=${plan.id }">${plan.name }</a>
                    </span>
            </li>
        </c:forEach>
    </ul>
</fieldset>
</body>
</html>