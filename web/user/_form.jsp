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
        var operatorsJson = ${null == user.operators ? "1" : user.operators };
        if (operatorJson != "1") {
            var selected = new Array();
            $.each(operatorsJson, function(i, val) {
                selected.push(val.id);
            });
        }
        $("#operators").val(selected);
        $("#operators").select2({width: "300px"});
    });
</script>
<fieldset>
    <input type="hidden" name="user.id" value="${user.id}" />
    <legend>基本信息</legend>
    <label for="username">用户名</label>
    <input id="username" name="user.username" value="${user.username}" type="text" /><br />
    <label for="name">真实姓名</label>
    <input id="name" name="user.name" value="${user.name}" type="text" /><br />
    <label for="telephone">电话号码</label>
    <input id="telephone" name="user.telephone" value="${user.telephone}" type="text" /><br />
    <label for="email">电子邮件</label>
    <input id="email" name="user.email" value="${user.email}" type="text" /><br />
    <label for="address">家庭住址</label>
    <input id="address" name="user.address" value="${user.address}" type="text" /><br />

</fieldset>
<fieldset>
    <legend>权限</legend>
    <select id="operators" name="operators" multiple="multiple">
        <c:forEach items="${operators }" var="operator">
            <option value="${operator.id }">${operator.name}</option>
        </c:forEach>
    </select>
    <br />
    <input value="提交" type="submit" />
</fieldset>
