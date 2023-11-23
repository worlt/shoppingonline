<%@ page import="beans.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8" />
  <title>删除用户</title>
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

<div class="gong" id="x1">
  <div class="con">
    <div class="tit">
      <ul>
        <li>用户名</li>
        <li class="i">&nbsp;</li>
        <li>手机</li>
        <li class="i">&nbsp;</li>
        <li>密码</li>
        <li class="i">&nbsp;</li>
        <li>余额</li>
        <li class="i">&nbsp;</li>
        <li>地址</li>
        <li class="i">&nbsp;</li>
        <li>操作</li>
      </ul>
    </div>

    <%
      List<User> users=new ArrayList<User>();
      if(request.getAttribute("allusers")!=null)
      {
        users=(List<User>)request.getAttribute("allusers");

        for(User user:users)
        {
          out.print("    <div class=\"info\">\n" +
                  "      <ul>\n" +
                  "        <li><a href=\""+request.getContextPath()+"/AdminServlet?key=finduser&id="+user.getId()+"\">"+user.getUname()+"</a></li>\n" +
                  "        <li class=\"i\">&nbsp;</li>\n" +
                  "        <li><a href=\""+request.getContextPath()+"/AdminServlet?key=finduser&id="+user.getId()+"\">"+user.getPhone()+"</a></li>\n" +
                  "        <li class=\"i\">&nbsp;</li>\n" +
                  "        <li><a href=\""+request.getContextPath()+"/AdminServlet?key=finduser&id="+user.getId()+"\">"+user.getPwd()+"</a></li>\n" +
                  "        <li class=\"i\">&nbsp;</li>\n" +
                  "        <li><a href=\""+request.getContextPath()+"/AdminServlet?key=finduser&id="+user.getId()+"\">"+user.getBalance()+"</a></li>\n" +
                  "        <li class=\"i\">&nbsp;</li>\n" +
                  "        <li><a href=\"" + request.getContextPath() + "/AdminServlet?key=finduser&id=" + user.getId() + "\" title=\"" + user.getAddress() + "\" class=\"sl\">" + user.getAddress() + "</a></li>\n" +
                  "        <li class=\"i\">&nbsp;</li>\n"+
                  "        <li><a href=\""+request.getContextPath()+"/AdminServlet?key=deluser&id="+user.getId()+"\">删除</a></li>\n" +
                  "      </ul>\n" +
                  "    </div>");
        }
      }


    %>
  </div>
</div>

</body>
</html>

