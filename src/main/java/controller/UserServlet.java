package controller;

import beans.User;
import service.UserService;
import service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "UserServlet", urlPatterns = "/userServlet")
public class UserServlet extends BaseServlet {
    private UserService userService = new UserServiceImpl();

    //登录
    public String login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 获取参数
        String str = request.getParameter("str");
        String pwd = request.getParameter("pwd");

        // 调用业务逻辑实现
        User loginUser = userService.login(str, pwd);
        if (loginUser != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", loginUser);
            // 跳回首页
            return "redirect:/index.jsp";
        } else {
            // 账号或密码错误，跳回登录页面
            HttpSession session = request.getSession();
            PrintWriter out = response.getWriter();
            out.println("<script>alert('登录失败 将返回主页面 未找到该用户 请您注册之后再次尝试进行登录'); window.location.href='login.jsp';</script>");
            out.flush();
            return "redirect:/login.jsp";
        }
    }


    //注册
    public String register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取参数
        String name = request.getParameter("uname");
        String phone = request.getParameter("phone");
        String pwd1 = request.getParameter("pwd1");

        //封装实体类
        User user = new User(name, phone, pwd1);

        //调用业务逻辑实现
        User loginUser = userService.add(user);
        if (loginUser != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", loginUser);
            //跳回首页
//            response.sendRedirect(request.getContextPath() + "/index.jsp");
            return "redirect:/index.jsp";

        } else {
            //注册页面不变
//            request.getRequestDispatcher("/login.jsp").forward(request,response);
            return "forward:/login.jsp";
        }
    }


    //修改个人信息和充值
    public String finduser(HttpServletRequest request, HttpServletResponse response) {
        //获取参数
        String uidStr = request.getParameter("id");
        int uid = Integer.parseInt(uidStr);
        //调用业务逻辑层
        User user = userService.findById(uid);
        request.setAttribute("user", user);
        return "forward:/user.jsp";
    }

    //更新用户
    public String upuser(HttpServletRequest request, HttpServletResponse response) {
        //获取参数
        String name2 = request.getParameter("name2");
        String phone2 = request.getParameter("phone2");
        String pwd2 = request.getParameter("pwd2");
        String balanceStr = request.getParameter("balance2");
        double balance2 = Double.parseDouble(balanceStr);
        String address2 = request.getParameter("address2");

        String uidStr = request.getParameter("id");
        int uid = Integer.parseInt(uidStr);
        User user = new User(uid, name2, phone2, pwd2, balance2, address2);
        boolean update = userService.update(user);
        if (update) {
            finduser(request, response);
            return "forward:/user.jsp";
        }
        return null;
    }


    // 充值
    public String recharge(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 获取参数
        String amountStr = request.getParameter("rechargeAmount");
        double amount = Double.parseDouble(amountStr);

        String uidStr = request.getParameter("id");
        int uid = Integer.parseInt(uidStr);

        // 调用业务逻辑层进行充值处理
        boolean recharge = userService.recharge(uid, amount);
        if (recharge) {
            // 充值成功
            finduser(request, response);
            return "forward:/user.jsp";
        } else {
            // 充值失败
            response.getWriter().write("{\"success\": false}");
        }

        return null;
    }
}
