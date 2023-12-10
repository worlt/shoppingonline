package controller;

import beans.Cart;
import beans.Merchandise;
import beans.Orders;
import beans.User;
import dao.CartDao;
import dao.OrdersDao;
import dao.impl.OrdersDaoImpl;
import service.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

@WebServlet("/orderServlet")
public class OrderServlet extends BaseServlet {
    private OrdersDao ordersDao = new OrdersDaoImpl();

    public String add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        CartService cartService = new CartServiceImpl();
        List<Cart> carts = cartService.findByUid(user.getId());
        MerchandiseService merchandiseService = new MerchandiseServiceImpl();

        // 构建订单对象
        Orders orders = new Orders();
        orders.setUid(user.getId());
        orders.setOdate(new Date(System.currentTimeMillis()));

        // 插入订单到数据库
        for (Cart cart : carts) {
            Merchandise merchandise = merchandiseService.findById(cart.getMid());
//            String numStr = request.getParameter("num");
//            int num = Integer.parseInt(numStr);
            orders.setMid(cart.getMid());
            orders.setMname(merchandise.getMname());
            orders.setQuantity(1);
            int success = ordersDao.add(orders.getUid(), orders.getMid(), orders.getMname(), orders.getQuantity());
            if (success == 0) {
                return "forward:/index.jsp";
            }
        }

        // 清空购物车
        cartService.delAll(user.getId());
        return "forward:/cartServlet?key=show&id=" + user.getId() + "&boob=cart";
    }

    //显示订单
    public String show(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取参数
        String uidStr = request.getParameter("id");

        int uid = Integer.parseInt(uidStr);

        if (uid != 0) {
            //调用业务逻辑层
            List<Orders> orders = ordersDao.findByUid(uid);
            request.setAttribute("orders", orders);
            return "forward:/order.jsp";
        } else {
            //转发到登录页面
            request.setAttribute("showError", true);
            return "forward:/login.jsp";
        }
    }
}
