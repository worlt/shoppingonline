<%@ page import="beans.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8" />
  <title>修改用户信息</title>
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

<div class="gong" id="x3">
  <div class="con">
    <%
      User user3=new User(1,"","","",0,"");
      if(request.getAttribute("user")!=null)
        user3=(User)request.getAttribute("user");
    %>
    <div class="form">
      <form action="<%=request.getContextPath()%>/AdminServlet?key=upuser&id=<%=user3.getId()%>" method="post">
        <div class="add">
          <span class="add_tit">用户名 ：</span>
          <span class="add_text"><input type="text" name="name1" id="name1" value="<%=user3.getUname()%>" /></span>
        </div>

        <div class="add">
          <span class="add_tit">手机 ：</span>
          <span class="add_text"><input type="text" name="phone1" id="phone1" value="<%=user3.getPhone()%>" /></span>
        </div>

        <div class="add">
          <span class="add_tit">密码 ：</span>
          <span class="add_text"><input type="text" name="pwd1" id="pwd1" value="<%=user3.getPwd()%>" /></span>
        </div>

        <div class="add">
          <span class="add_tit">余额 ：</span>
          <span class="add_text"><input type="text" name="balance1" id="balance1" value="<%=user3.getBalance()%>" /></span>
        </div>

        <div class="add">
          <span class="add_tit">地址 ：</span>
          <span class="add_text"><input type="text" name="address1" id="address1" value="<%=user3.getAddress()%>" /></span>
        </div>
        <div class="add_sublmit">
          <input type="submit" value="保存"/>
        </div>
      </form>
    </div>
  </div>
</div>


<%--<div class="gong" id="x4">--%>
<%--</div>--%>
</body>
</html>

