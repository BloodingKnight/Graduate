<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>检查报告详细信息</title>
    <link href="../css/common/style1.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../js/tools/jquery-1.9.1.js"></script>
    <script type="text/javascript">
        $(function () {
            $("form").hide();

            $("#editMemo").click(function() {
                $("form").slideToggle();
            });
        });
    </script>

</head>
<body>
    <p>${nextInspectError }<a href="info?p_id=${plan.id }">返回计划详情</a></p>

    <label for="name">检查计划名称</label>
    <span id="name">${plan.name }</span>
    <br />

    <label for="baseName">所属设备名称</label>
    <span id="baseName">${plan.device.name }</span>

    <label for="open">检查报告开始时间</label>
    <span id="open">${report.open }</span>
    <br />

    <label for="memo">备注 | <a id="editMemo">编辑</a> </label>
    <br />
    <span id="memo">${report.memo }</span>
    <form action="update" method="post">
        <input type="hidden" name="r_id" value="${report.id }" />
        <textarea name="memo">${report.memo }</textarea>
        <br />
        <input type="submit" value="确认" />
    </form>

    <hr />

    <fieldset>
        <legend>检查报告|<a href="next?r_id=${report.id }">进行下一步检查</a></legend>
        <table id="results" class="gridtable" style="width: 100%;">
            <tr>
                <th>id</th>
                <th>检查结果</th>
                <th>检查项</th>
                <th>备注</th>
            </tr>
            <c:forEach items="${report.results }" var="result">
                <tr>
                    <td>${result.id }</td>
                    <td>${result.norm == 0 ? "正常" : "不正常"}</td>
                    <td>${result.inspect_name}</td>
                    <td>${result.info}</td>
                </tr>
            </c:forEach>
        </table>


    </fieldset>
</body>
</html>
