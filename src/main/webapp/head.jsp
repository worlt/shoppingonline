<%@ page import="beans.User" %>
<%@page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title></title>
    <link rel="stylesheet" type="text/css" href="css/head.css"/>
    <link rel="shortcut icon" href="logo/favicon.ico">
        <jsp:include page="/cartServlet?key=num"></jsp:include>
    <%
        beans.User user = new beans.User(0, "", "", "", 0, "");
        int num = 0;
        if (session.getAttribute("user") != null)
            user = (beans.User) session.getAttribute("user");
        if (request.getAttribute("num") != null)
            num = (Integer) request.getAttribute("num");
    %>
</head>

<body>
<div class="top">
    <div class="con">
        <div class="head_left">欢迎来到罗友购物网</div>
        <%
            if (user.getId() == 0)
                out.print("        <div class=\"head_right noLink\" >\n" +
                        "            <a href=\"login.jsp\">[ 登录 ]</a>&nbsp;&nbsp;\n" +
                        "            <a href=\"register.jsp\">[ 注册 ]</a>\n" +
                        "        </div>");
            else {
                out.print("      <div class=\"head_right\" >\n" +
                        "        <div class=\"username\"><a href=\"#\">" + user.getUname() + "</a></div>\n" +
                        "        <div class=\"star\">\n" +
                        "          <div class=\"star_img\">\n" +
                        "          </div>\n" +
                        "          <div class=\"toStar\"><a href=\"" + request.getContextPath() + "/cartServlet?key=show&id=" + user.getId() + "&boob=star\">我的关注</a>\n" +
                        "          </div>\n" +
                        "        </div>\n" +
                        "      </div>");
            }
        %>
    </div>
</div>

<%--网站图标、搜索框、购物车--%>
<div class="head">
    <div class="con">
        <div class="logo">
            <a href="<%=request.getContextPath()%>/BSServlet?key=toAdmin">
                <img src="logo/mainlogo2.png" alt="罗友购物网-网购首选品牌！"/>
            </a>
        </div>

        <div class="ser">
            <form action=<%=request.getContextPath()%>/searchServlet?key=search method="post">
            <input type="text" name="selkey" id="ser_border">
            <input type="submit" name="ser_button" id="ser_button" value="搜索">
            </form>
        </div>


        <div class="shopcart">
            <div class="cart_img"></div>
            <div class="cart">
                <a href=<%=request.getContextPath()%>/cartServlet?key=show&id=<%=user.getId()%>&boob=cart>我的购物车</a>
                <div class="cart_num" id="cart_num"><%=num%>
                </div>
            </div>
            <div class="cart_to">></div>
        </div>
    </div>
</div>

<%--网站菜单--%>
<div class="head_menu">
    <div class="con">
        <ul class="hmenu_ul">
            <li><a href="index.jsp">首页</a></li>
            <li><a href=<%=request.getContextPath()%>/searchServlet?key=all>全部商品</a></li>
            <%--            <li><a href="">分类1</a></li>--%>
            <%--            <li><a href="">分类2</a></li>--%>
        </ul>
    </div>
</div>


</body>
</html>

