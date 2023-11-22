<%@ page import="java.util.List" %>
<%@ page import="beans.User" %>
<%@ page import="beans.Merchandise" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="utf-8" />
  <link rel="shortcut icon" href="logo/favicon.ico">
  <title>商品信息</title>
  <link rel="stylesheet" type="text/css" href="css/imgs.css"/>
  <link rel="stylesheet" type="text/css" href="css/main.css"/>
  <script src="js/imgs.js" type="text/javascript" charset="utf-8"></script>
  <%
    Merchandise merchandise = (Merchandise) request.getAttribute("merchandise");
    List<Merchandise> hotMerchandise = (List<Merchandise>) request.getAttribute("merchandises");
    User user=new User(0);
    if(session.getAttribute("user")!=null)
       user=(User)session.getAttribute("user");

    String tit1="加入购物车";
    if(request.getAttribute("tit1")!=null)
      tit1=(String)request.getAttribute("tit1");

    String tit2="关注商品";
    if(request.getAttribute("tit2")!=null)
      tit2=(String)request.getAttribute("tit2");
  %>
</head>
<body onload="show()">
<jsp:include page="head.jsp"></jsp:include>

<div class="fruit_info">
  <div class="img_box">
    <%
      String cname="show";
      for(int i=1;i<merchandise.getInum()+1;i++)
      {
        out.println("<div id=\"p"+(i-1)+"\" class=\"" + cname + "\"><img src=\"img/merchandise/" + merchandise.getMid() + "/(" + i + ").jpg\" /></div>");
        cname="non";
      }
    %>

    <div class="img_to">
      <ul >
        <%
          for(int i=1;i<merchandise.getInum()+1;i++)
          {
            out.print("<li><img src=\"img/merchandise/"+ merchandise.getMid()+"/("+i+").jpg\" id=\"s"+(i-1)+"\" onMouseMove=\"himg(this.id)\"/></li>");
          }
        %>
      </ul>
    </div>
  </div>

  <div class="fruit_text">
    <div class="fname"><%=merchandise.getMname()%></div>
    <p>&nbsp;</p>
<%--    <div class="spec"><input type="radio" checked="checked" name="fnum_radio" value="fnum_radio" /><%=merchandise.getSpec()%></div>--%>
    <div class="up">￥<%=merchandise.getMprice()%></div>
    <div class="fid">商品编号:<%=merchandise.getMid()%></div>
    <hr />

    <form  method="post" id="fform">
      <div class="fform">
        <div class="fform1">
      <div class="Uaddress">配送至 :
        <select name="address" id="sel">
          <option value="上海">上海</option>
          <option value="吉林">吉林</option>
          <option value="山西">山西</option>
          <option value="北京">北京</option>
        </select>
      </div>
      <div class="Unum"><span id="numl" onclick="number(1,<%=merchandise.getMid()%>)">-</span><span id="num<%=merchandise.getMid()%>">1</span><span id="numr" onclick="number(0,<%=merchandise.getMid()%>)">+</span></div>
      </div>
          <div class="Uadd"><input type="button" name="add" id="cart" value="<%=tit1%>" onclick="addCart(<%=user.getId()%>,<%=merchandise.getMid()%>)" /></div>
          <div class="starbutton"><input type="button" name="add" id="star" value="<%=tit2%>" onclick="addStar(<%=user.getId()%>,<%=merchandise.getMid()%>)"/></div>
      </div>
    </form>

    <hr />
    <div class="finfo">
      <h3>商品简介</h3>
      <p id="finfo_text"><%=merchandise.getIntro()%></p>
    </div>
    <hr />
    <div class="fpro">
      <h3>温馨提示</h3>
      <p id="fpro_text"><%=merchandise.getTips()%></p>
    </div>
    <hr />
  </div>

  <div class="fruit_hot" >
    <div class="hf_title"><span class="ht_l">热卖商品</span><span class="ht_r"><a href="">MORE+</a></span></div>
    <%
      int i=1;
      for(Merchandise merchandises:hotMerchandise)
      {
        out.print("    <div class=\"hot_fruit\">\n" +
                "      <div class=\"hf_img\"><a href=\""+request.getContextPath()+"/merchandiseServlet?key=info&id="+user.getId()+"&mid="+merchandises.getMid()+"\"><img src=\"img/merchandise/"+merchandises.getMid()+"/(1).jpg\" /></a></div>\n" +
                "      <div class=\"hf_text\">\n" +
                "        <div class=\"hf_name\"><a href=\""+request.getContextPath()+"/merchandiseServlet?key=info&id="+user.getId()+"&mid="+merchandises.getMid()+"\">"+merchandises.getMname()+"</a></div>\n" +
                "        <div class=\"hf_mon\">现货：￥<span>"+merchandise.getMprice()+"</span></div>\n" +
                "      </div>\n" +
                "    </div>");
        i++;
        if(i==4)
          break;
      }

    %>
  </div>
</div>

<%--<jsp:include page="footer/footer.jsp"></jsp:include>--%>
</body>
</html>
