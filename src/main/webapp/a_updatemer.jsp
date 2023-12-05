<%@ page import="beans.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="beans.Merchandise" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8" />
  <title>修改商品信息</title>
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
<%
  Merchandise merchandise=new Merchandise(0,"",0,"","",0);
  if(request.getAttribute("merchandise")!=null)
    merchandise=(Merchandise) request.getAttribute("merchandise");
%>
<div class="gong" id="x6">
  <div class="con">
    <div class="form">
      <form action="<%=request.getContextPath()%>/AdminServlet?key=upmer&mid=<%=merchandise.getMid()%>" method="post">
        <div class="add">
          <div class="add">
            <span class="add_tit">商品编号 ：</span>
            <span class="add_text"><input type="text" name="mid2" id="mid2" value="<%=merchandise.getMid()%>" /></span>
          </div>
          <div class="add">
            <span class="add_tit">商品 ：</span>
            <span class="add_text"><input type="text" name="mname2" id="mname2" value="<%=merchandise.getMname()%>" /></span>
          </div>

          <div class="add">
            <span class="add_tit">单价 ：</span>
            <span class="add_text"><input type="text" name="mprice2" id="mprice2" value="<%=merchandise.getMprice()%>" /></span>
          </div>

          <div class="add">
            <span class="add_tit" >商品简介 ：</span>
            <span class="add_text"><input type="text" class="long" name="intro2" id="intro2" value="<%=merchandise.getIntro()%>" /></span>
          </div>

          <div class="add">
            <span class="add_tit">温馨提示 ：</span>
            <span class="add_text"><input type="text" class="long" name="tips2" id="tips2" value="<%=merchandise.getTips()%>" /></span>
          </div>

          <div class="add">
            <span class="add_tit">图片个数 ：</span>
            <span class="add_text"><input type="text" name="inum2" id="inum2" value="<%=merchandise.getInum()%>" /></span>
          </div>

        <div class="add_sublmit">
          <input type="submit" value="保存"/>
        </div>
      </form>
    </div>
  </div>
</div>

</body>
</html>
