<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">


        <!--
        body {
            margin: 0px;
            font-family: "宋体";
            font-size: 12px;
        }

        .box {
            background-color: #ffffff;
            border: 1px solid #7f9db9;
        }

        .buttonlogin {
            border: 0px none;
            background: url('images/loginbtback.png') no-repeat;
            color: #000;
            width: 75px;
            height: 22px;
        }
        -->
    </style>

    <script type="text/javascript" src="js/common/jquery-1.5.1.min.js"></script>

    <script type="text/javascript">
        function check(){
            var userName=$("#userName").val();
            var password=$("#password").val();

            if(userName==""){
                $("#checkUserName").html("<font color='red'>用户名不能为空！</font>");
                return false;
            }
            if(password==""){
                $("#checkPassword").html("<font color='red'>密码不能为空！</font>");
                return false;
            }
            return true;
        }
    </script>



</head>

<body
        style="background-image: url('images/bg.jpg'); background-repeat: repeat-x;">
<table width="1002" height="100%" border="0" cellspacing="0"
       cellpadding="0" align="center">
    <tr>
        <td height="178"
            style="background-image: url('images/bg_images1.jpg')">
            &nbsp;
        </td>
    </tr>
    <tr>
        <td height="143"
            style="background-image: url('images/bg_images2.jpg')">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="451">
                        &nbsp;
                    </td>
                    <td width="378">
                        <table width="100%" border="0" cellspacing="10" cellpadding="0">
                            <tr>
                                <td colspan="4">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    &nbsp;
                                </td>
                            </tr>
                            <!--  <tr>
                                <td width="200" align="right" style="color: #FFFFFF">
                                    语言：
                                </td>

      <td><select name="select2" id="select2" style="width:100px; font-family:'宋体',Arial; font-size:12px">
          <option>中文</option>
          <option>English</option>
      </select></td>
    -->
                            </tr>
                        </table>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td height="248"
            style="background-image: url('images/bg_images3.jpg')">
            <form action="login"  method="post" onsubmit="return check();">
                <table width="100%" height="100%" border="0" cellspacing="0"
                       cellpadding="0">
                    <tr>
                        <td width="451">
                            &nbsp;
                        </td>
                        <td width="378">


                            <table width="378" border="0" cellpadding="10" cellspacing="0"
                                   style="margin-top: 8px;">

                                <tr>
                                    <td width="60">
                                        &nbsp;
                                    </td>
                                    <td align="right" nowrap>
                                        <font color="#000000">用户名：</font>
                                    </td>
                                    <td align="left">
                                        <input name="username" id="userName" type="text" class="box"
                                               style="width: 150px" size="23">
                                        <span id="checkUserName"></span>
                                    </td>

                                </tr>

                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td align="right" nowrap>
                                        <font color="#000000">密 码：</font>
                                    </td>
                                    <td align="left">
                                        <input name="password" id="password" type="password"
                                               class="box" style="width: 150px" size="23">
                                        <span id="checkPassword"></span>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td align="right" nowrap>
                                        &nbsp;
                                    </td>
                                    <td align="left">
                                        &nbsp;
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td colspan="2">
                                        <div id="message">${message}</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td colspan="4" align="center" nowrap>
                                        <input  type="submit" class="buttonlogin"
                                                id="btnLog" value=" 登 录 " >
                                        &nbsp;&nbsp; <input name="submit22" type="reset"
                                                            class="buttonlogin" value=" 重 置 ">
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </form>
        </td>
    </tr>
    <tr>
        <td bgcolor="#0e4284">
            <table width="100%" border="0" cellspacing="30" cellpadding="0">
                <tr>
                    <td align="center" style="color: #a9c1dc">
                        <span style="font-family: Arial">?</span>&nbsp;&nbsp;2013
                        版权所有 <a href="mailto://337223471@qq.com">胡勇刚</a>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</body>
</html>
