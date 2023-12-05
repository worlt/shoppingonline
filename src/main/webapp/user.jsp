  <%--
    Created by IntelliJ IDEA.
    User: worlt
    Date: 2023/11/24
    Time: 15:26
    To change this template use File | Settings | File Templates.
  --%>
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
  </div>

  <div class="gong" id="x3">
    <div class="con">
      <%
        User user3=new User(1,"","","",0,"");
        if(request.getAttribute("user")!=null)
          user3=(User)request.getAttribute("user");
      %>
      <div class="form">
        <form action="<%=request.getContextPath()%>/userServlet?key=upuser&id=<%=user3.getId()%>" method="post">
          <div class="add">
            <span class="add_tit">用户名 ：</span>
            <span class="add_text"><input type="text" name="name2" id="name2" value="<%=user3.getUname()%>" /></span>
          </div>

          <div class="add">
            <span class="add_tit">手机 ：</span>
            <span class="add_text"><input type="text" name="phone2" id="phone2" value="<%=user3.getPhone()%>" /></span>
          </div>

          <div class="add">
            <span class="add_tit">密码 ：</span>
            <span class="add_text"><input type="text" name="pwd2" id="pwd2" value="<%=user3.getPwd()%>" /></span>
          </div>

          <div class="add">
            <span class="add_tit">余额 ：</span>
            <span class="add_text"><input type="text" name="balance2" id="balance2" value="<%=user3.getBalance()%>" readonly/></span>
          </div>

          <div class="add">
            <span class="add_tit">地址 ：</span>
            <span class="add_text"><input type="text" name="address2" id="address2" value="<%=user3.getAddress()%>" /></span>
          </div>
          <div class="add_sublmit">
            <input type="submit" value="保存"/>
          </div>
          <!-- 充值表单 -->
        </form>
        <form action="<%=request.getContextPath()%>/userServlet?key=recharge&id=<%=user3.getId()%>" method="post">
          <div class="add">
            <span class="add_tit">请输入充值金额：</span>
            <span class="add_text"><input type="text" name="rechargeAmount" /></span>
            <div class="add_sublmit add_sublmit-recharge">
              <input type="submit" value="充值" />
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
  </body>
  </html>


