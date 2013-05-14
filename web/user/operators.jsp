<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>权限列表</title>
    <link href="../css/common/style1.css" type="text/css" rel="stylesheet">

    <script type="text/javascript" src="../js/tools/jquery-1.9.1.js"></script>
    <script language="javascript">
        $(function() {
            $("#form").hide();
            $(".editOperator").each(function () {
                $(this).click(function(event) {
                    event.preventDefault();

                    var name = $(this).attr("name");
                    var params = name.split("&");
                    $("#id").attr("value", params[0]);
                    $("#item").attr("value", params[1]);
                    $("#name").attr("value", params[2]);

                    $("form").attr("action", "updateOperator");
                    $("#form").show();
                });
            });

            $("#addOperator").click(function(event) {
                event.preventDefault();


                $("#id").attr("value", "");
                $("#item").attr("value", "");
                $("#name").attr("value", "");
                $("form").attr("action", "saveOperator");
                $("#form").show();
            });

            $("#cancel").click(function(event) {
                $("#form").hide();
            });
        });
    </script>

</head>
<body>
    <div id="add">
        <a href="add" id="addOperator">添加权限</a>
        <form id="form" action="saveOperator" method="post">
            <input type="hidden" id="id" name="operator.id" />
            <label for="name">权限名称</label>
            <input id="name" name="operator.name" type="text" />
            <label for="item">权限范围</label>
            <input id="item" name="operator.item" type="text" />
            <input type="submit" value="提交" />
            <input type="reset" value="取消" id="cancel" />
        </form>
    </div>
    <div id="list">
        <table class="gridtable" style="width: 100%;">
            <caption>权限列表</caption>
            <tr>
                <td>操作</td>
                <td>id</td>
                <td>权限名称</td>
                <td>权限范围</td>
            </tr>
            <c:forEach items="${operators }" var="operator">
                <tr>
                    <td>
                        <a href="editOperator" class="editOperator"
                            name="${operator.id }&${operator.item }&${operator.name }">编辑</a>
                        <a href="deleteOperator?o_id=${operator.id }" class="delete">删除</a>
                    </td>
                    <td>${operator.id }</td>
                    <td>
                        <a href="info?id=${operator.id }">${operator.name }</a>
                    </td>
                    <td>${operator.item }</td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
