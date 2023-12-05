package controller;

import beans.Cart;
import beans.Merchandise;
import beans.User;
import service.CartService;
import service.CartServiceImpl;
import service.MerchandiseService;
import service.MerchandiseServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/cartServlet")
public class  CartServlet extends BaseServlet {
    private CartService cartService = new CartServiceImpl();

    //添加购物车或者关注列表
    public String add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取参数
        String uidStr = request.getParameter("id");
        String midStr = request.getParameter("mid");
        String str = request.getParameter("str");
        int uid = Integer.parseInt(uidStr);
        int mid = Integer.parseInt(midStr);
        if (uid != 0) {//用户已登录
            Cart cart = cartService.find(uid, mid);
            if (cart == null) {//不存在购物车
                cart = new Cart();
                cart.setUid(uid);
                cart.setMid(mid);
                if ("cart".equals(str)) {
                    cart.setIsCart(true);
                    cart.setIsStar(false);
                } else if ("star".equals(str)) {
                    cart.setIsCart(false);
                    cart.setIsStar(true);
                }
                cartService.add(uid, cart);
            } else {//已存在购物车，那就关注
                if ("cart".equals(str)) {
                    cart.setIsCart(true);
                    cart.setIsStar(cart.isStar());
                } else if ("star".equals(str)) {
                    cart.setIsCart(cart.isCart());
                    cart.setIsStar(true);
                }
                //更新操作
                cartService.update(uid, cart);
            }
            //跳到详情页面
            return "forward:/merchandiseServlet?key=info&id=" + uid + "&mid=" + mid;
        } else {//没有登录
            //转发到登录页面
            request.setAttribute("showError", true);
            return "forward:/login.jsp";
        }
        //调用业务逻辑
    }


    //显示我的购物车和我的关注列表
    public String show(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取参数
        String uidStr = request.getParameter("id");
        String boob = request.getParameter("boob");
        int uid = Integer.parseInt(uidStr);
        boolean flag = false;
        if ("cart".equals(boob)) {
            flag = true;
        }
        if (uid != 0) {
            //调用业务逻辑层
            List<Merchandise> merchandises = cartService.show(uid, flag);
            request.setAttribute("merchandises", merchandises);
            if (flag) {
                return "forward:/showcart.jsp";
            } else {
                return "forward:/showstar.jsp";
            }
        } else {
            //转发到登录页面
            request.setAttribute("showError", true);
            return "forward:/login.jsp";
        }
    }


    public void num(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取登录用户
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int num = 0;
        if (user != null) {
            List<Cart> cart = cartService.findCartByUid(user.getId());
            num = cart.size();
        }
        request.setAttribute("num", num);
    }


    //删除既没有加入购物车，也没有关注的数据
    public String del(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        //获取参数
        String uidStr = request.getParameter("id");
        String midStr = request.getParameter("mid");
        String str = request.getParameter("str");
        int uid = Integer.parseInt(uidStr);
        int mid = Integer.parseInt(midStr);
        Cart cart = new Cart();
        cart.setUid(uid);
        cart.setMid(mid);
        //调用业务逻辑层
        if (uid!=0){
            //从数据库查询存在记录
            Cart returnCart = cartService.find(uid, mid);
            if ("cart".equals(str)){
                cart.setIsCart(false);
                cart.setIsStar(returnCart.isStar());
            }else if ("star".equals(str)){
                cart.setIsStar(false);
                cart.setIsCart(returnCart.isCart());
            }

            if (cart.isCart() || cart.isStar()){//没有加入购物车或关注，更新数据库
                cartService.update(uid,cart);
            }else {
                cartService.del(uid,mid);
            }
        }

        if ("cart".equals(str)){//购物车列表删除
            return "forward:/cartServlet?key=show&id="+uid+"&boob=cart";

        }else {
            return "forward:/cartServlet?key=show&id="+uid+"&boob=star";
        }
    }


//    // 结算
//    public String checkout(HttpServletRequest request, HttpServletResponse response) {
//        // 获取用户ID
//        String uidStr = request.getParameter("id");
//        int uid = Integer.parseInt(uidStr);
//        MerchandiseService merchandiseService = new MerchandiseServiceImpl();
//        // 获取购物车商品和数量
//        Map<Merchandise, Integer> cart = new HashMap<>();
//        for(String key : request.getParameterMap().keySet()) {
//            if(key.startsWith("quantity")) {
//                int mid = Integer.parseInt(key.substring(8)); // 提取商品ID
//                int quantity = Integer.parseInt(request.getParameter(key)); // 获取数量
//                Merchandise merchandise = merchandiseService.findById(mid); // 查找商品
//                cart.put(merchandise, quantity);
//            }
//        }
//
//        // 处理结算逻辑（示例）
//        // 注意：这里应该有完整的业务逻辑，包括库存检查、价格计算、生成订单等步骤
//        boolean success = someCheckoutService.processCheckout(cart, uid);
//
//        if (success) {
//            // 结算成功，跳转到成功页面或订单详情页
//            return "redirect:/checkout_success.jsp";
//        } else {
//            // 结算失败，返回购物车页面并显示错误信息
//            request.setAttribute("message", "结算失败，请重试！");
//            return "forward:/showcart.jsp";
//        }
//    }






}


