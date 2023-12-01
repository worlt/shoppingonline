package controller;

import beans.Cart;
import beans.Merchandise;
import service.CartService;
import service.CartServiceImpl;
import service.MerchandiseService;
import service.MerchandiseServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/merchandiseServlet")
public class MerchandiseServlet extends BaseServlet{
    private MerchandiseService merchandiseService = new MerchandiseServiceImpl();
    private CartService cartService = new CartServiceImpl();

    //详情列表
    public String info(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        //获取参数
        String midStr = request.getParameter("mid");
        int mid = Integer.parseInt(midStr);
        //调用业务逻辑
        Merchandise merchandise = merchandiseService.findById(mid);
        request.setAttribute("merchandise",merchandise);
        //判断是否已添加购物车
        String uidStr = request.getParameter("id");
        int uid = Integer.parseInt(uidStr);
        if (uid != 0){
            Cart cart = cartService.find(uid,mid);
            if (cart != null){
                if (cart.isCart()){//已添加到购物车
                    request.setAttribute("tit1","已加入购物车");
                }
                if (cart.isStar()){//已关注
                    request.setAttribute("tit2","已关注");
                }
            }
        }

        hot(request,response);

        //跳转到水果详情页面
        return "forward:/merchandise_info.jsp";
    }


    //热卖
    public void hot(HttpServletRequest request, HttpServletResponse response) {
        List<Merchandise> merchandises = merchandiseService.findHot();
        request.setAttribute("merchandises",merchandises);
    }

}
