<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" type="text/css" href="../css/tools/select2.css" />
    <link rel="stylesheet" type="text/css" href="../css/tools/jquery-ui-1.10.1.custom.min.css" />
    <script type="text/javascript" src="../js/tools/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="../js/tools/jquery-ui-1.10.1.custom.min.js"></script>
    <script type="text/javascript" src="../js/tools/select2.js"></script>
    <!-- TODO 需要选择上device相应的inspects -->
    <script type="text/javascript">
        $(function() {
            // 使用jquery-ui datepick插件
            $("#start").datepicker({
                showOn: "button",
                buttonImage: "../images/calendar.gif",
                buttonImageOnly: true,
                dateFormat: "yy-mm-dd"
            });
            $("#deadline").datepicker({
                showOn: "button",
                buttonImage: "../images/calendar.gif",
                buttonImageOnly: true,
                dateFormat: "yy-mm-dd"
            });

            /// 取出后台传来的inspects，并选中
            var inspectsJson = ${null == inspects ? "1" : inspects};
            if (inspectsJson != "1") {
                var selected = new Array();
                $.each(inspectsJson, function(i, val) {
                    $("<option value='" + val.id + "'>" + val.name + "</opiton>").appendTo("#inspects");
                    selected.push(val.id);
                });
            }

            /// 当选择不同的device之后，更换相应的inspect
            $("#device").change(function() {
                $("#device option:selected").each(function() {
                    var d_id = $(this).attr("value");
                    // 使用ajax取得相应device的inspects
                    // 清空下拉框
                    $("#inspects").val("[]");
                    $("#inspects").select2({width: "300px"});
                    $.get("getDeviceInspects?d_id=" + d_id, function(data) {

                        $.each(data, function(i, val) {
                            $("<option value='" + val.id + "'>" + val.name + "</option>").appendTo("#inspects");
                        });
                    });
                });
            });

            $("#inspects").val(selected);
            $("#inspects").select2({width: "300px"});

            $("#device").val("${plan.device.id }");
        });
    </script>
</head>
<body>
    <fieldset>
        <legend>基本信息</legend>
        <input type="hidden" name="plan.id" value="${plan.id}" />

        <label for="name">计划名称</label>
        <input type="text" name="plan.name" value="${plan.name }" id="name" />
        <br />

        <label for="start">计划开始时间</label>
        <input type="text" name="plan.start" value="${plan.start }" id="start" />
        <br />

        <label for="deadline">计划截止日期</label>
        <input type="text" name="plan.deadline" value="${plan.deadline }" id="deadline" />
        <br />

        <label for="info">计划备注</label>
        <input type="text" name="plan.info" value="${plan.info }" id="info" />
        <br />

        <label for="admin">计划负责人</label>
        <input type="text" name="plan.admin" value="${plan.admin }" id="admin" />
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
</body>
</html>