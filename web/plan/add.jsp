<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <title>添加检查计划</title>
    <link rel="stylesheet" type="text/css" href="../css/tools/select2.css" />
    <script type="text/javascript" src="../js/tools/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="../js/tools/select2.js"></script>
    <script type="text/javascript">
        $(function() {
            /// 取出后台传来的inspects，并选中
            var insectsJson = ${null == inspects ? "1" : inspects};
            if (insectsJson != "1") {
                var selected = new Array();
                $.each(insectsJson, function(i, val) {
                    $("<option value='" + val.id + "'>" + val.name + "</opiton>").appendTo("#inspects");
                });
            }

            /// 当选择不同的device之后，更换相应的inspect
            $("#device").change(function() {
                $("#device option:selected").each(function() {
                    var d_id = $(this).attr("value");
                    // 使用ajax取得相应device的inspects
                    $.get("getDeviceInspects?d_id=" + d_id, function(data) {
                        // 清空下拉框
                        $("#inspects").empty();

                        $.each(data, function(i, val) {
                            $("<option value='" + val.id + "'>" + val.name + "</option>").appendTo("#inspects");
                        });
                    });
                });
            });

            $("#inspects").select2({width: "300px"});
            $("#device").val("${device.id }");
        });
    </script>
</head>
<body>
<form action="save" method="post">
    <fieldset>
        <legend>基本信息</legend>

        <label for="name">计划名称</label>
        <input type="text" name="plan.name" value="${plan.name }" id="name" />
        <br />

        <label for="frequency">计划检查频率</label>
        <input type="text" name="plan.frequency" value="${plan.frequency }" id="frequency" />
        <br />
    </fieldset>

    <fieldset>
        <legend>高级信息</legend>
        <label for="device">检查计划所属设备</label>
        <select id="device" name="plan.d_id">
            <c:forEach items="${devices }" var="device">
                <option value="${device.id }">${device.name }</option>
            </c:forEach>
        </select>
        <br />

        <label for="inspects">所有检查项</label>
        <select id="inspects" name="inspects" multiple="multiple">
        </select>
    </fieldset>

    <input type="submit" value="确认">
</form>
</body>
</html>