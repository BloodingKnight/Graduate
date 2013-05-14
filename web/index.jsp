<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="include/taglibs.jsp" %>
<meta http-equiv="refresh" content="600"/>
<script type="text/javascript">
    //用来刷新新消息红字不出现
    function delNewMessage(){
        var a=$("#mes").hide();
    }
</script>
<div class="panel left" id="main_left">
    <iframe id="treeIframe" frameborder="0"  name="treeIframe" src ="include/menu.jsp"></iframe>
</div>
<div class="panel splitleft" id="main_splitleft" onClick="toggleleft();"></div>
<div class="panel main" id="main_main" >
    <iframe  id="contextIframe" frameborder="0" src="" name="contextIframe"></iframe>
</div>
