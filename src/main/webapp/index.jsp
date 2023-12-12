<%@ page import="java.util.List" %>
<%@ page import="beans.Merchandise" %>
<%@ page import="beans.User" %>
<%@page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="UTF-8"/>
    <link rel="shortcut icon" href="logo/favicon.ico">
    <title>罗友购物商城-包罗万象,我们什么都有</title>
    <link rel="stylesheet" type="text/css" href="css/main.css"/>
    <link rel="stylesheet" type="text/css" href="css/index.css"/>
    <script src="js/imgs.js" type="text/javascript" charset="utf-8"></script>
    <jsp:include page="/merchandiseServlet?key=hot"></jsp:include>
    <jsp:include page="head.jsp"></jsp:include>
</head>
<body onload="fimg()">
<%
    List<Merchandise> hotMerchandise = (List<Merchandise>) request.getAttribute("merchandises");
    int id = 0;
    if (session.getAttribute("user") != null) {
        User user = (User) session.getAttribute("user");
        id = user.getId();
    }
%>
<div class="imgs">
    <div class="con">
        <div id="p0" class="show"><a target="_blank" href="<%= request.getContextPath() %>/merchandiseServlet?key=info&id=<%= id %>&mid=1"><img src="img/index/h0.jpg" alt="" width="1100" height="400" /></a></div>
        <div id="p1" class="non"><a target="_blank" href="<%= request.getContextPath() %>/merchandiseServlet?key=info&id=<%= id %>&mid=2"><img src="img/index/h1.jpg" alt="" width="1100" height="400" /></a></div>
        <div id="p2" class="non"><a target="_blank" href="<%= request.getContextPath() %>/merchandiseServlet?key=info&id=<%= id %>&mid=3"><img src="img/index/h2.jpg" alt="" width="1100" height="400" /></a></div>
        <div id="p3" class="non"><a target="_blank" href="<%= request.getContextPath() %>/merchandiseServlet?key=info&id=<%= id %>&mid=4"><img src="img/index/h3.jpg" alt="" width="1100" height="400" /></a></div>
        <div id="p4" class="non"><a target="_blank" href="<%= request.getContextPath() %>/merchandiseServlet?key=info&id=<%= id %>&mid=5"><img src="img/index/h4.jpg" alt="" width="1100" height="400" /></a></div>
        <ul class="imgul">
            <li id="l0" onmouseover="simg(this.innerHTML)" onmouseout="fimg()">1</li>
            <li id="l1" onmouseover="simg(this.innerHTML)" onmouseout="fimg()">2</li>
            <li id="l2" onmouseover="simg(this.innerHTML)" onmouseout="fimg()">3</li>
            <li id="l3" onmouseover="simg(this.innerHTML)" onmouseout="fimg()">4</li>
            <li id="l4" onmouseover="simg(this.innerHTML)" onmouseout="fimg()">5</li>
        </ul>
    </div>
</div>

<div class="merboxs">
    <div class="con">
        <div class="mhead">
            <div class="mhr"></div>
            <div class="ser_more">
                <div class="mser">热卖专区</div>
                <div class="mmore"><a href="">查看更多 ></a></div>
            </div>
        </div>

    <%
        for(Merchandise merchandise:hotMerchandise)
        {
            out.print("    <div class=\"mer_box\">\n" +
                    "      <div class=\"mer_img\">\n" +
                    "        <a href=\""+request.getContextPath()+"/merchandiseServlet?key=info&id="+id+"&mid="+merchandise.getMid()+"\"><img src=\"img/merchandise/"+merchandise.getMid()+"/(1).jpg\" /></a>\n" +
                    "      </div>\n" +
                    "      <div class=\"mer_name\">\n" +
                    "        <a href=\""+request.getContextPath()+"/merchandiseServlet?key=info&id="+id+"&mid="+merchandise.getMid()+"\">"+merchandise.getMname()+"</a>\n" +
                    "      </div>\n" +
                    "      <div class=\"fruit_num\">\n" +
                    "        "+ "库存：" + merchandise.getStock() +"\n" +
                    "      </div>\n" +
                    "      <div class=\"mer_mon\">\n" +
                    "        "+merchandise.getMprice()+"\n" +
                    "      </div>\n" +
                    "    </div>");
        }
    %>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
