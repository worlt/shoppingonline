<%@ page import="beans.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="beans.Merchandise" %>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <title>删除商品</title>
  <link rel="shortcut icon" href="logo/favicon.ico">
  <link rel="stylesheet" type="text/css" href="css/BSindex.css"/>
  <link rel="stylesheet" type="text/css" href="css/main.css"/>
  <script src="js/BSindex.js" type="text/javascript" charset="utf-8"></script>
  <%
    String show="x0";
    if(request.getAttribute("sky")!=null)
      show=(String)request.getAttribute("sky");
  %>
</head>
<body >
<div class="mean">
  <div class="logo">
    <a href="index.jsp"><img src="logo/admin.jpg" title="返回首页" /></a>
  </div>

  <div class="mean_ul">
    <div class="mean_li" onclick="sss('u')">用户管理</div>
    <div class="user_list" id="user_list">
      <div class="mm"><a href="<%=request.getContextPath()%>/AdminServlet?key=alluser">全部用户</a></div>
      <div class="mm"><a href="a_adduser.jsp">添加用户</a></div>
    </div>
    <div class="mean_li" onclick="sss('f')">商品管理</div>
    <div class="fruit_list" id="fruit_list">
      <div class="mm"><a href="<%=request.getContextPath()%>/AdminServlet?key=allmer">库存商品</a></div>
<%--      <div class="mm"><a href="<%=request.getContextPath()%>/AdminServlet?key=hotfruit">热卖商品</a></div>--%>
      <div class="mm"><a href="a_addmer.jsp">商品入库</a></div>
    </div>
  </div>

</div>


<div class="gong" id="x4">
  <div class="con">
    <div class="tit">
      <ul>
        <li>商品编号</li>
        <li class="i">&nbsp;</li>
        <li>商品</li>
        <li class="i">&nbsp;</li>
<%--        <li>规格</li>--%>
<%--        <li class="i">&nbsp;</li>--%>
        <li>单价</li>
        <li class="i">&nbsp;</li>
        <li>库存</li>
        <li class="i">&nbsp;</li>
        <li>类型</li>
        <li class="i">&nbsp;</li>
        <li>操作</li>
      </ul>
    </div>
    <%
      List<Merchandise> merchandises=new ArrayList<Merchandise>();
      if(request.getAttribute("allmer")!=null) {

        merchandises = (List<Merchandise>) request.getAttribute("allmer");

        for(Merchandise merchandise:merchandises) {
          out.print("    <div class=\"info\">\n" +
                  "      <ul>\n" +
                  "        <li><a href=\""+request.getContextPath()+"/AdminServlet?key=findmer&mid="+ merchandise.getMid()+"\">"+ merchandise.getMid()+"</a></li>\n" +
                  "        <li class=\"i\">&nbsp;</li>\n" +
                  "        <li><a href=\""+request.getContextPath()+"/AdminServlet?key=findmer&mid="+merchandise.getMid()+"\">"+ merchandise.getMname()+"</a></li>\n" +
                  "        <li class=\"i\">&nbsp;</li>\n" +
                  "        <li><a href=\""+request.getContextPath()+"/AdminServlet?key=findmer&mid="+merchandise.getMid()+"\">"+ merchandise.getMprice()+"</a></li>\n" +
                  "        <li class=\"i\">&nbsp;</li>\n" +
                  "        <li><a href=\""+request.getContextPath()+"/AdminServlet?key=findmer&mid="+merchandise.getMid()+"\">"+ merchandise.getStock()+"</a></li>\n" +
                  "        <li class=\"i\">&nbsp;</li>\n" +
                  "        <li><a href=\""+request.getContextPath()+"/AdminServlet?key=findmer&mid="+merchandise.getMid()+"\">"+ merchandise.getType()+"</a></li>\n" +
                  "        <li class=\"i\">&nbsp;</li>\n" +
                  "        <li><a href=\""+request.getContextPath()+"/AdminServlet?key=delmer&mid="+merchandise.getMid()+"\">删除</a></li>\n" +
                  "      </ul>\n" +
                  "    </div>");
        }
      }
    %>


  </div>
</div>


</body>
</html>

