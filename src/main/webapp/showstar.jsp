<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="beans.User" %>
<%@ page import="java.util.Map" %>
<%@ page import="beans.Merchandise" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="utf-8">
  <title>我的关注</title>
  <link rel="stylesheet" href="css/showcart.css" />
  <link rel="stylesheet" type="text/css" href="css/main.css"/>
  <script src="js/imgs.js" type="text/javascript" charset="utf-8"></script>

  <script>
    window.onload=function footer_img_non(){
      document.getElementById("footer_img").style.display="none";
    }
  </script>
  <%
    List<Merchandise> merchandises=(List<Merchandise>)request.getAttribute("merchandises");
    User user=(User)session.getAttribute("user");
  %>
</head>
<body onload="money()">
<div class="con">
  <div class="head">
    <a href="index.jsp">
      <img src="logo/reglogo.png" title="返回首页" />
    </a>
  </div>
  <div class="shop_box">
    <div class="head_text_box">
					<span id="head_text">
						我的关注
					</span>
    </div>

    <div class="shop_title">
      <div id="st1">商品</div>
<%--      <div id="st2">规格</div>--%>
      <div id="st3">单价</div>
      <div id="st4">数量</div>
      <div id="st5">小计</div>
      <div id="st6">操作</div>
    </div>

    <%
      for(Merchandise merchandise:merchandises)
      {
        out.print("    <div class=\"shop\">\n" +
                "      <div class=\"s1\">\n" +
                "        <div class=\"s1_img\"><a href=\"/merchandiseServlet?key=info&id="+user.getId()+"&mid="+merchandise.getMid()+"\"><img src=\"img/merchandise/"+merchandise.getMid()+"/(1).jpg\" /></a></div>\n" +
                "        <div class=\"s1_text\"><a href=\"/merchandiseServlet?key=info&id="+user.getId()+"&mid="+merchandise.getMid()+"\">"+ merchandise.getMname()+"</a></div>\n" +
                "      </div>\n" +
                "\n" +
//                "      <div class=\"s2\">\n" +
//                "        "+fruit.getSpec()+"\n" +
//                "      </div>\n" +
//                "\n" +
                "      <div class=\"s3\">\n" +
                "        ￥<span id=\"up"+merchandise.getMid()+"\">"+ merchandise.getMprice()+"</span>\n" +
                "      </div>\n" +
                "\n" +
                "      <div class=\"s4\">\n" +
                "     <div class=\"Unum\"><span id=\"numl\" class=\"numl\" onclick=\"number(1,"+merchandise.getMid()+");sum("+merchandise.getMid()+");money()\">-</span><span id=\"num"+merchandise.getMid()+"\">1</span><span id=\"numr\" class=\"numr\" onclick=\"number(0,"+merchandise.getMid()+");sum("+merchandise.getMid()+");money()\">+</span></div>\n" +
                "      </div>\n" +
                "\n" +
                "      <div class=\"s5\">\n" +
                "        ￥<span id=\"sum"+merchandise.getMid()+"\" class=\"fsum\">"+merchandise.getMprice()+"</span>\n" +
                "      </div>\n" +
                "\n" +
                "      <div class=\"s6\">\n" +
                "        <a href=\""+request.getContextPath()+"/cartServlet?key=del&id="+user.getId()+"&mid="+merchandise.getMid()+"&str=star\">删除</a>\n" +
                "      </div>\n" +
                "    </div>");
      }
    %>

    <div class="shop_footer">
      &nbsp;
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
