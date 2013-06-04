<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>仓库信息</title>

    <link href="../css/common/style1.css" type="text/css" rel="stylesheet">

    <script type="text/javascript" src="../js/tools/jquery-1.9.1.js"></script>
	<script language="javascript">
		$(function() {
			$("#form").hide();
			$(".editWarehouse").each(function () {
				$(this).click(function(event) {
					event.preventDefault();

					var name = $(this).attr("name");
					var params = name.split("&");
					$("#id").attr("value", params[0]);
					$("#name").attr("value", params[1]);
					$("#admin").attr("value", params[2]);
					$("#address").attr("value", params[3]);
					$("#phone").attr("value", params[4]);

                    $("form").attr("action", "update");
					$("#form").show();
				});
			});

			$("#addWarehouse").click(function(event) {
				event.preventDefault();


                $("#id").attr("value", "");
                $("#name").attr("value", "");
                $("#admin").attr("value", "");
                $("#address").attr("value", "");
                $("#phone").attr("value", "");
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
    <div id="error" style="color: red">
        <c:if test="${not empty nameMsg}">
            <p>${nameMsg}</p>
        </c:if>
        <c:if test="${not empty adminMsg}">
            <p>${adminMsg}</p>
        </c:if>
        <c:if test="${not empty deleteError}">
            <p>${deleteError}</p>
        </c:if>
    </div>
    <div id="add">
        <a href="addWarehouse" id="addWarehouse">添加仓库</a>
        <form id="warehouse" method="post">
            <fieldset id="form">
                <legend>仓库信息</legend>
                <input id="id" name="warehouse.id" type="hidden" value="${warehouse.id}" />
                <label for="name">仓库名称</label>
                <input id="name" type="text" name="warehouse.name" value="${warehouse.name}" />
                <label for="admin">仓库管理员</label>
                <input id="admin" type="text" name="warehouse.admin" value="${warehouse.admin}" />
                <br />
                <label for="address">仓库地址</label>
                <input id="address" type="text" name="warehouse.address" value="${warehouse.address}" />
                <label for="phone">仓库电话</label>
                <input id="phone" type="text" name="warehouse.phone" value="${warehouse.phone}" />
                <br />
                <input id="submit" type="submit" value="提交" />
                <input id="cancel" type="reset" value="取消" />
            </fieldset>
        </form>
    </div>
    <div id="list">
        <table class="gridtable" style="width: 100%">
            <caption>仓库列表</caption>
            <tr>
                <th>操作</th>
                <th>id</th>
                <th>仓库名称</th>
                <th>仓库地址</th>
                <th>仓库电话号码</th>
                <th>仓库管理员</th>
            </tr>
            <c:forEach items="${warehouseList }" var="warehouse">
            <tr>
                <td>
                    <a href="editWarehouse" class="editWarehouse"
                        name="${warehouse.id}&${warehouse.name}&${warehouse.admin}&${warehouse.address}&${warehouse.phone}">编辑</a>
                    <a href="delete?id=${warehouse.id }" class="delete">删除</a>
                </td>
                <td>${warehouse.id }</td>
                <td>${warehouse.name }</td>
                <td>${warehouse.address}</td>
                <td>${warehouse.phone}</td>
                <td>${warehouse.admin }</td>
            </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
