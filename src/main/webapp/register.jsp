<%--
  Created by IntelliJ IDEA.
  beans.User: worlt
  Date: 2023/11/14
  Time: 11:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" href="logo/favicon.ico">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <link rel="stylesheet" type="text/css" href="css/reg.css">
    <script src="js/reg.js"></script>
<%--    <script>--%>
<%--        window.onload = function footer_img_non() {--%>
<%--            document.getElementById("footer_img").style.display = "none";--%>
<%--        }--%>
<%--    </script>--%>
    <title>用户注册</title>
</head>
<body>
<div class="con">
    <div class="box">
        <div class="head">
            <a href="index.jsp">
                <img src="logo/reglogo.png" title="返回首页">
            </a>

        </div>
        <div class="text">
            <span class="h01">用户注册</span>
            <div class="xhr"></div>

        <form action=<%=request.getContextPath()%>/userServlet?key=register method="post" id="regForm">
            <div class="text_box">
                <div class="main">
                    <div class="name">用户名：</div>
                    <input type="text" name="uname" id="uname" value="" onblur="isName()"/>
                    <div id="isName" class="iss"></div>
                </div>
                <div class="main">
                    <div class="name">手机号码：</div>
                    <input type="text" name="phone" id="phone" value="" onblur="isPhone()"/>
                    <div id="isPhone" class="iss"></div>
                </div>
                <div class="main">
                    <div class="name">密码：</div>
                    <input type="password" name="pwd1" id="pwd1" value="" onblur="isPwd1()"/>
                    <div id="isPwd1" class="iss"></div>
                </div>
                <div class="main">
                    <div class="name">确定密码：</div>
                    <input type="password" name="pwd2" id="pwd2" value="" onblur="isPwd2()"/>
                    <div id="isPwd2" class="iss"></div>
                </div>
                <div class="xbutton">
                    <input type="button" name="reg" id="reg" value="注册" onclick="isReg()"/>
                </div>
            </div>
        </form>
        </div>

        <div class="jmp">
            <div class="jmpp">
                已经有账号？
            </div>
            <div class="jmpa">
                <a href="login.jsp">立即登录&nbsp;></a>
            </div>
        </div>
    </div>
</div>
<div class="footer">
    <div style="text-align: center;position: fixed;bottom: 0;padding: 10px;width: 100%;">
        <jsp:include page="footer.jsp"></jsp:include>
    </div>
</div>
</body>
</html>
