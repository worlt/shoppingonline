<%@ page import="beans.Orders" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>订单</title>
    <link rel="shortcut icon" href="logo/favicon.ico">
    <link rel="stylesheet" type="text/css" href="css/BSindex.css"/>
    <link rel="stylesheet" type="text/css" href="css/main.css"/>
    <script src="js/BSindex.js" type="text/javascript" charset="utf-8"></script>
</head>
<body >
<div class="mean">
    <div class="logo">
        <a href="index.jsp"><img src="logo/admin.jpg" title="返回首页" /></a>
    </div>
</div>

<div class=" " id="x4" style="margin-left: 200px">
    <div class="con">
        <div class="tit">
            <ul>
                <li>订单号</li>
                <li class="i">&nbsp;</li>
                <li>用户ID</li>
                <li class="i">&nbsp;</li>
                <li>商品号</li>
                <li class="i">&nbsp;</li>
                <li>商品名</li>
                <li class="i">&nbsp;</li>
                <li>数量</li>
                <li class="i">&nbsp;</li>
                <li>时间</li>
            </ul>
        </div>
        <%
            List<Orders> orders = (List<Orders>) request.getAttribute("orders");
            for (Orders order : orders) {
        %>
        <div class="info">
            <ul>
                <li><a href=merchandiseServlet?key=info&id=<%=order.getUid()%>&mid=<%=order.getMid()%>><%= order.getOid()%></a></li>
                <li class="i">&nbsp;</li>
                <li><a href=merchandiseServlet?key=info&id=<%=order.getUid()%>&mid=<%=order.getMid()%>><%= order.getUid()%></a></li>
                <li class="i">&nbsp;</li>
                <li><a href=merchandiseServlet?key=info&id=<%=order.getUid()%>&mid=<%=order.getMid()%>><%= order.getMid()%></a></li>
                <li class="i">&nbsp;</li>
                <li><a href=merchandiseServlet?key=info&id=<%=order.getUid()%>&mid=<%=order.getMid()%>><%= order.getMname()%></a></li>
                <li class="i">&nbsp;</li>
                <li><a href=merchandiseServlet?key=info&id=<%=order.getUid()%>&mid=<%=order.getMid()%>><%= order.getQuantity()%></a></li>
                <li class="i">&nbsp;</li>
                <li><a href=merchandiseServlet?key=info&id=<%=order.getUid()%>&mid=<%=order.getMid()%>><%= order.getOdate()%></a></li>
            </ul>
        </div>
        <%
            }
        %>
    </div>
</div>

</body>
</html>
