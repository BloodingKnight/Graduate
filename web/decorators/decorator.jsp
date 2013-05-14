<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title><decorator:title default="首页..." /></title>
	<%@ include file="/include/taglibs.jsp" %>
	<style type="text/css">
	
	* { margin:0; padding:0; list-style:none;}
	html,body { height:100%; overflow:hidden;}
	.panel{
	position:absolute;
	top:0px;
	right:0px;
	bottom:0px;
	left:2px;
	height: 1px;
}
	.top { height:100px;}
	.left { top:120px; bottom:20px; width:17%; /*兼容ff*/height: auto;}
	.splitleft{left:17%; top:120px; bottom:20px; width:8px; /*兼容ff*/height: auto;}
	.main { left:18%; top:120px; bottom:20px;/*兼容ff*/height: auto;}
	.bottom { top:auto;  height:20px;}
	.panel iframe { width:100%; height:100%;}

	html { *padding:70px 0px 20px 0px;}
	.panel{*position:relative;}
	.top { *margin-top:-70px; *margin-bottom:0px; }
	.left { *height:100%; *float:left; *top:0px;  }
	.splitleft { *height:100%; *float:left; *top:0px;*left:0px; }
	.main { *height:100%;  *top:0;*left:0px;_left:-3px;}/*IE 6 float 3px bug*/
</style>

<script type="text/javascript">

window.onLoad = new function(){
//	loadRealname();
//	checkTime();
// setInterval("checkTime()",30000);
}

function checkTime(){
	
	var url= "${ctx}/MessageAction/checkNewMessage.action" ;
	
	jQuery.post(url,{},callback,"json");
	
	function callback(json){  
	if(json.messageCount!=0){
		$("#mes").attr("innerHTML","您有新消息！");
		setInterval("zhuan()",500);
    }else{
    	$("#mes").attr("innerHTML","");
    }
}
}

function viewReceiveMessage(){
	var URL = "${ctx}/message/initReceiveMessage.action";
	window.parent.frames['contextIframe'].location = URL;
}

function zhuan(){
	if($("#mes").html()==""){
		$("#mes").attr("innerHTML","您有新消息！");
	}else{
		$("#mes").attr("innerHTML","");
	}
}
jQuery(function(){
	var url = "findFun.action";
	$("li[id='selectFun']").each(
			function(){
			var data="selectFun="+$(this).attr("class");
			var select=$(this);
			jQuery.post(url, data, callback, "json");
			function callback(json) {
				var sdf=json.display;
				if(sdf=="")
					select.removeAttr("style");
				else
					select.attr("style",json.display);
				}
});});

function ShowTime() {  
<%Date date = new Date();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd");
int i = date.getDay();
String xq = "";
if(i==1){
	xq="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;星期一";
}
if(i==2){
	xq="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;星期二";
}
if(i==3){
	xq="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;星期三";
}
if(i==4){
	xq="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;星期四";
}
if(i==5){
	xq="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;星期五";
}
if(i==6){
	xq="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;星期六";
}
if(i==7){
	xq="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;星期日";
}
String ss = sdf.format(date).toString()+xq;
%>
var ss ="<%=ss%>";
<%--document.getElementById('time').innerHTML=ss.toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());--%>
document.getElementById('time').innerHTML=ss;
}  


function loadRealname(){
	
	var url= "${ctx}/loginRealName.action" ;
	
	jQuery.post(url,{},callback,"json");
	
	function callback(json){  
		$("#realname").attr("innerHTML",json.realname);
}
}
</script>

  </head>
  <body onload="ShowTime()">
  <input type="hidden" value="${sessionScope.roleId}" id="roleIdSelectId">
	    <div id="topcontentimage">
		<div class="panel top" id="main_top">
			<div id="min-width">
				<div id="topcontent">
					<div style=padding-top:5px;>
					<table border="0" cellspacing="0" cellpadding="0" align="right">
					  <tr height="38">  
					  	<td width="80"><a onclick="viewReceiveMessage()" style="cursor:hand"><font color="red" id="mes"></font></a></td>
					    <td width="25"></td>
					    <td width="50"><a id="btnchangetheme" onclick="window.location.reload();" style="cursor:hand">返回主页</a></td>
					    <td width="25"></td>
						<td width="100">欢迎您：<font id="realname">
                            <a href='../modify?id=${sessionScope.loginUser.get("id") }'
                               target="contextIframe" title="修改用户信息">
						        ${sessionScope.loginUser.get("username") }
                            </a>
                        </font></td>
						<td width="25"></td>
						<td width="50"><a href="../logout" style="cursor:pointer;">注销</a></td>
						<td width="25"></td>				
					  </tr>
					  <tr height="120">
					  <td></td>
					  <td></td>
					  <td></td>
					  <td></td>
					  <td colspan="6">
					  <div id="time" style="padding-bottom:0px;padding-right:0px"></div>
					  </td>
					  </tr>
					  </table>
					</div>
				
					<div id="menu" >
			     <!-- 系统功能部分 -->
				      <div id="module" style="padding-top:85px;padding-left: 0px">
						<ul>
                            <c:forEach items="${sessionScope.operators }" var="operator">
							    <li><a class="tab" id="current" style="cursor:hand;" target="tree" name="${operator.get("item")}">${operator.get("name") }</a></li>
                            </c:forEach>
							</ul>
					  </div>
				   </div>
				</div>
		    </div>
    	</div>
    	</div>
	    <decorator:body />
		<div class="panel bottom" id="main_bottom"><span style="font-family:Arial">©</span>&nbsp;&nbsp;2001-2010 版权所有 <a href="mailto://337223471@qq.com">胡勇刚</a> </div>
  </body>
</html>
<script type="text/javascript">
	function system(){
		window.location.href="${ctx}/jsp/body/systemManage.jsp";
		}
	function toggleleft() {
		if (document.getElementById("main_left").style.display == "none") {//显示左边
			//var className1= document.getElementById("main_splitleft").className;
			//document.getElementById("main_splitleft").className='splitleft';
			document.getElementById("main_main").style.left = "250px";
			//document.getElementById("main_splitleft").className= className.replace(/splitleft_on/gi,"");
			document.getElementById("main_left").style.display = "block";
			document.getElementById("main_splitleft").style.left = "240px";
			document.getElementById("main_splitleft").style.background = '#bdd5f9 url(${ctx}/images/splitleft.gif) no-repeat center center';
		} else {//收起左边
			document.getElementById("main_left").style.display = "none";
			document.getElementById("main_splitleft").style.left = "0px";
			document.getElementById("main_main").style.left = "10px";
			var className = document.getElementById("main_splitleft").className;
			document.getElementById("main_splitleft").className = (className + " splitleft_on");
			document.getElementById("main_splitleft").style.background = '#bdd5f9 url(${ctx}/images/splitright.gif) no-repeat center center';
			var ie6 = /*@cc_on @_jscript_version == 5.6 ||@*/false;
			if (ie6) {
				document.getElementById("main_main").style.left = "-3px";
			}
		}
	}
	function setselected() {
		document.getElementById("tree").src = "workplatform.html";
	}
	$(function() {
        $("#treeIframe").attr("src", "../include/menus/" + $("#current").attr("name") + ".jsp");
        $("a.tab").each(function() {
            $(this).click(function(event) {
                event.preventDefault();

                $("a.tab").attr("id", "");
                $(this).attr("id", "current");

                $("#treeIframe").attr("src", "../include/menus/" + $(this).attr("name") + ".jsp");
            });
        });
	});
	//退出
	function log() {
		if (confirm("确认要退出吗?")) {
			window.location = "exitLogin.action";
		} else {
			return false;
		}
	}
	jQuery(function(){
		$("li[id='roleone']").each(function(){
			if($("#roleIdSelectId").attr("value")==1)
				$(this).attr("style","display: none;");
			});
		if($("#roleIdSelectId").attr("value")==1){
		$("#module ul li").has("a")[8].click();}
		})
</script>
