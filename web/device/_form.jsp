<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<link rel="stylesheet" type="text/css" href="../css/tools/select2.css" />
<style type="text/css">
    #inspects {
        width: 300px;
    }
</style>
<script type="text/javascript" src="../js/tools/jquery-1.9.1.js"></script>
<script type="text/javascript" src="../js/tools/select2.js"></script>
<script type="text/javascript">
    $(function() {
        var insectsJson = ${null == device.inspects ? "1" : device.inspects};
        if (insectsJson != "1") {
            var selected = new Array();
            $.each(insectsJson, function(i, val) {
                selected.push(val.id);
            });
        }
        $("#inspects").val(selected);
        $("#inspects").select2({width: "300px"});
    });
</script>
<fieldset>
    <input type="hidden" name="device.id" value="${device.id}" />
    <legend>基本信息</legend>
    <label for="name">设备名称</label>
    <input id="name" name="device.name" value="${device.name}" type="text" /><br />
    <label for="info">设备信息</label>
    <input id="info" name="device.info" value="${device.info}" type="text" /><br />
    <label for="type">设备类别</label>
    <input id="type" name="device.type" value="${device.type}" type="text" /><br />
    <label for="warehouse">所属仓库</label>
    <select id="warehouse" name="device.w_id">
        <c:forEach items="${warehouses }" var="warehouse">
            <option value="${warehouse.id }">${warehouse.name}</option>
        </c:forEach>
    </select>

</fieldset>
<fieldset>
    <legend>所含检查项</legend>
    <select id="inspects" name="inspects" multiple="multiple">
        <c:forEach items="${inspects }" var="inspect">
            <option value="${inspect.id }">${inspect.name}</option>
        </c:forEach>
    </select>
    <br />
    <input value="提交" type="submit" />
</fieldset>
