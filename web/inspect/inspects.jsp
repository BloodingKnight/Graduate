<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>检查项列表</title>
    <link href="../css/common/style1.css" type="text/css" rel="stylesheet">

    <script type="text/javascript" src="../js/tools/jquery-1.9.1.js"></script>
    <script language="javascript">
        $(function() {
            $("#form").hide();
            $(".editInspect").each(function () {
                $(this).click(function(event) {
                    event.preventDefault();

                    var name = $(this).attr("name");
                    var params = name.split("&");
                    $("#id").attr("value", params[0]);
                    $("#name").attr("value", params[1]);
                    $("#type").attr("value", params[2]);
                    $("#method").attr("value", params[3]);

                    $("form").attr("action", "update");
                    $("#form").show();
                });
            });

            $("#addInspect").click(function(event) {
                event.preventDefault();

                $("#id").attr("value", "");
                $("#name").attr("value", "");
                $("#type").attr("value", "");
                $("#method").attr("value", "");
                $("form").attr("action", "save");
                $("#form").show();
            });

            $("#cancel").click(function(event) {
                $("#form").hide();
            });
        });
    </script>
</head>
<body>
<div id="error">
    <p>${deleteError}</p>
</div>
    <div id="add">
        <a href="addInspect" id="addInspect">添加检查项</a>
        <form id="inspect" method="post">
            <fieldset id="form">
                <legend>检查项信息</legend>
                <input id="id" name="inspect.id" type="hidden" value="${inspect.id}" />
                <label for="name">检查项名称</label>
                <input id="name" type="text" name="inspect.name" value="${inspect.name}" />
                <br />
                <label for="type">检查项类别</label>
                <input id="type" type="text" name="inspect.type" value="${inspect.type}" />
                <label for="method">检查方法</label>
                <input id="method" type="text" name="inspect.method" value="${inspect.method}" />
                <br />
                <input id="submit" type="submit" value="提交" />
                <input id="cancel" type="reset" value="取消" />
            </fieldset>
        </form>
    </div>
    <div id="list">
        <table class="gridtable" style="width: 100%">
            <caption>检查项列表</caption>
            <tr>
                <td>操作</td>
                <td>id</td>
                <td>检查项名称</td>
                <td>检查项类别</td>
                <td>检查方法</td>
            </tr>
            <c:forEach items="${inspects }" var="inspect">
            <tr>
                <td>
                    <a href="editInspect" class="editInspect"
                            name="${inspect.id }&${inspect.name }&${inspect.name }&${inspect.name }">编辑</a>
                    <a href="delete?id=${inspect.id }" class="delete">删除</a>
                </td>
                <td>${inspect.id }</td>
                <td>${inspect.name }</td>
                <td>${inspect.type }</td>
                <td>${inspect.method }</td>
            </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
