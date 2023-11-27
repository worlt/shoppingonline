<%@ page import="beans.Merchandise" %>
<%@ page import="beans.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>罗友购物商城-包罗万象,我们什么都有！</title>
    <link rel="stylesheet" type="text/css" href="css/sel.css"/>
    <link rel="stylesheet" type="text/css" href="css/main.css"/>
    <script src="js/sel.js"></script>
    <jsp:include page="/merchandiseServlet?key=hot"></jsp:include>
    <jsp:include page="head.jsp"></jsp:include>
  <%
    List<Merchandise> htoMerchandises=(List<Merchandise>)request.getAttribute("merchandises");
    List<Merchandise> selMerchandises=null;
    User user=new User(0);
    if(session.getAttribute("user")!=null)
      user=(User)session.getAttribute("user");
    if(request.getAttribute("selMerchandises")!=null)
      selMerchandises=(List<Merchandise>)request.getAttribute("selMerchandises");
  %>
</head>
<body style="position: relative;">
  <div class="mer_info">
    <div class="mer_hot" >
      <div class="hf_title"><span class="ht_l">热卖商品</span><span class="ht_r"><a href="">MORE+</a></span></div>

      <%
        int i=1;
        for(Merchandise merchandises:htoMerchandises)
        {
          out.print("    <div class=\"hot_mer\">\n" +
                  "      <div class=\"hf_img\"><a href=\""+request.getContextPath()+"/merchandiseServlet?key=info&id="+user.getId()+"&mid="+merchandises.getMid()+"\"><img src=\"img/merchandise/"+merchandises.getMid()+"/(1).jpg\" /></a></div>\n" +
                  "      <div c=\"hf_text\">\n" +
                  "        <div class=\"hf_name\"><a href=\""+request.getContextPath()+"/merchandiseServlet?key=info&id="+user.getId()+"&mid="+merchandises.getMid()+"\">"+merchandises.getMname()+"</a></div>\n" +
                  "        <div class=\"hf_mon\">￥<span>"+merchandises.getMprice()+"</span></div>\n" +
                  "      </div>\n" +
                  "    </div>");
          i++;
          if(i==6)
            break;
        }

      %>
    </div>

    <div class="sel">
      <div class="selmers">
        <ul class="selmers_ul">
          <li class="selmers_li">
            价格：
            <a href="<%=request.getContextPath()%>/searchServlet?key=all" class="selkey sgreen">不限</a>
            <a href="<%=request.getContextPath()%>/searchServlet?key=money&selkey=a" class="selkey sgreen">2000以下</a>
            <a href="<%=request.getContextPath()%>/searchServlet?key=money&selkey=b" class="selkey sgreen">2000~3000</a>
            <a href="<%=request.getContextPath()%>/searchServlet?key=money&selkey=c" class="selkey sgreen">3000以上</a>
          </li>
        </ul>

      </div>


      <div class="merboxs">
        <%
          if (selMerchandises!=null)
          {
            for(Merchandise Merchandise:selMerchandises)
            {
              out.print("        <div class=\"mer_box\">\n" +
                      "          <div class=\"mer_img\">\n" +
                      "            <a href=\""+request.getContextPath()+"/merchandiseServlet?key=info&id="+ user.getId()+"&mid="+Merchandise.getMid()+"\"><img src=\"img/merchandise/"+Merchandise.getMid()+"/(1).jpg\" /></a>\n" +
                      "          </div>\n" +
                      "          <div class=\"mer_name\">\n" +
                      "            <a href=\""+request.getContextPath()+"/merchandiseServlet?key=info&id="+ user.getId()+"&mid="+Merchandise.getMid()+"\">"+Merchandise.getMname()+"</a>\n" +
                      "          </div>\n" +
//                      "          <div class=\"mer_spec\">\n" +
//                      "            "+Merchandise.getInum()+"\n" +
//                      "          </div>\n" +
                      "          <div class=\"mer_up\">\n" +
                      "            ￥"+Merchandise.getMprice()+"\n" +
                      "          </div>\n" +
//                      "          <div class=\"flogo\">\n" +
//                      "            <img src=\"logo/flogo.png\"/>\n" +
//                      "          </div>\n" +
                      "        </div>");
            }
          }
        %>

      </div>

      </div>
  </div>

</body>
</html>
