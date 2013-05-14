<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<html>
<head>
    <title><decorator:title default="点检系统" /></title>
    <link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/main.css" />
    <decorator:head />
</head>
<body>
    <div>
        <div id="head">
            <page:applyDecorator page="/include/head.jsp" name="panel" />
        </div>
        <div id="body">
            <div id="menu">
                <page:applyDecorator page="/include/menu.jsp" name="panel" />
            </div>
            <div id="content">
                <decorator:body />
            </div>
        </div>
    </div>
</body>
</html>