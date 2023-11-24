<%--
  Created by IntelliJ IDEA.
  beans.User: worlt
  Date: 2023/11/14
  Time: 22:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" href="logo/favicon.ico">
    <title>用户登录 - 罗友-包罗万象，我们什么都有</title>
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <link rel="stylesheet" type="text/css" href="css/reg.css">
</head>
<body>
<div class="con">
    <div class="box">
        <div class="head">
            <a href="index.jsp">
                <img src="logo/reglogo.png" title="返回首页" />
            </a>
        </div>

        <div class="text">
            <div class="text_head">
                <span class="h01">用户登录</span>
                <div class="xhr"></div>
            </div>
            <%--          <form action=<%=request.getContextPath()%>/userServlet?key=login  method="post">--%>
            <form action=<%=request.getContextPath()%>/userServlet?key=login  method="post">
                <%--        <form action=<%=request.getContextPath()%>/loginServlet? method="post">--%>
                <div class="text_box">
                    <div class="main"><div class="name">用户名或手机：</div>
                        <input type="text" name="str" id="str" value="" />
                    </div>
                    <div class="main"><div class="name">密码：</div>
                        <input type="password" name="pwd" id="pwd" value="" />
                    </div>
                    <div class="xbutton">
                        <input type="submit" name="login" id="login" value="登录" />
                    </div>
                    <div class="fpwd">
                        <a href="#">忘记密码 >></a>
                    </div>
                </div>

            </form>
        </div>

        <div class="jmp">
            <div class="jmpp">
                <p>还没有罗友账号?</p>
            </div>
            <div class="jmpa_l">
                <a href="register.jsp">立即注册&nbsp;></a>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
