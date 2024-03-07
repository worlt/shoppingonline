package controller;

import beans.Merchandise;
import beans.User;
import service.MerchandiseService;
import service.MerchandiseServiceImpl;
import service.UserService;
import service.UserServiceImpl;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

//后台管理
@WebServlet("/AdminServlet")
public class AdminServlet extends BaseServlet {
    private UserService userService = new UserServiceImpl();
    private MerchandiseService merchandiseService = new MerchandiseServiceImpl();
    //跳转到后台首页
    public String toAdmin(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user != null) {
            return "redirect:/a_homepage.jsp";
        }
        //转发到登录页面
        request.setAttribute("showError", true);
        return "forward:/login.jsp";
    }


    //展示用户列表
    public String alluser(HttpServletRequest request, HttpServletResponse response) {
        //调用业务逻辑层
        List<User> all = userService.findAll();
        request.setAttribute("allusers", all);
        return "forward:/a_deluser.jsp";
    }

    //添加用户
    public String adduser(HttpServletRequest request, HttpServletResponse response) {
        //获取参数
        String name1 = request.getParameter("name1");
        String phone1 = request.getParameter("phone1");
        String pwd1 = request.getParameter("pwd1");
        String balanceStr = request.getParameter("balance1");
        double balance1 = Double.parseDouble(balanceStr);
        String address1 = request.getParameter("address1");
        User user = new User(name1,phone1, pwd1, balance1, address1);
        //调用业务逻辑层
        User addUser = userService.add(user);
        if (addUser != null) {
            return alluser(request, response);
        }
        return null;
    }

    //删除用户
    public String deluser(HttpServletRequest request, HttpServletResponse response){
        //获取参数
        String uidStr = request.getParameter("id");
        int uid = Integer.parseInt(uidStr);
        //调用业务逻辑层
        boolean del = userService.del(uid);
        if (del) {
            //添加成功
            return alluser(request,response);
        }
        //添加失败
        return null;

    }


    //根据uid查询用户
    public String finduser(HttpServletRequest request, HttpServletResponse response){
        //获取参数
        String uidStr = request.getParameter("id");
        int uid = Integer.parseInt(uidStr);
        //调用业务逻辑层
        User user = userService.findById(uid);
        request.setAttribute("user",user);
        return "forward:/a_updateuser.jsp";
    }

    //更新用户
    public String upuser(HttpServletRequest request, HttpServletResponse response){
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
        if (update){
            return alluser(request,response);
        }
        return null;
    }

    //展示商品列表
    public String allmer(HttpServletRequest request, HttpServletResponse response){
        //调用业务逻辑
        List<Merchandise> all = merchandiseService.findAll();
        request.setAttribute("allmer",all);
        return "forward:/a_delmer.jsp";
    }

    //添加商品
    public String addmer(HttpServletRequest request, HttpServletResponse response){
        //获取参数
        String mid1Str = request.getParameter("mid1");
        String mname1 = request.getParameter("mname1");
        String mprice1Str = request.getParameter("mprice1");
        String stock1Str = request.getParameter("stock1");
        String type1 = request.getParameter("type1");
        String intro1 = request.getParameter("intro1");
        String tips1 = request.getParameter("tips1");
        String inum1Str = request.getParameter("inum1");
        int mid1 = Integer.parseInt(mid1Str);
        double mprice1 = Double.parseDouble(mprice1Str);
        int stock1 = Integer.parseInt(stock1Str);
        int inum1 = Integer.parseInt(inum1Str);
        Merchandise merchandise = new Merchandise(mid1,mname1,mprice1,intro1,tips1,inum1,stock1,type1);
        //调用业务逻辑
        boolean addMer = merchandiseService.add(merchandise);
        if (addMer) {
            //添加成功
            return allmer(request,response);
        }
            //添加失败
            return null;
    }

    //删除用户
    public String delmer(HttpServletRequest request, HttpServletResponse response){
        //获取参数
        String midStr = request.getParameter("mid");
        int mid = Integer.parseInt(midStr);
        //调用业务逻辑层
        boolean del = merchandiseService.del(mid);
        if (del) {
            //删除成功
            return allmer(request,response);
        }
        //删除失败
        return null;

    }


    //根据fid来查询商品
    public String findmer(HttpServletRequest request, HttpServletResponse response){
        //获取参数
        String midStr = request.getParameter("mid");
        int mid = Integer.parseInt(midStr);
        //调用业务逻辑
        Merchandise merchandise = merchandiseService.findById(mid);
        request.setAttribute("merchandise",merchandise);
        return "forward:/a_updatemer.jsp";
    }


    //更新商品
    public String upmer(HttpServletRequest request, HttpServletResponse response){
        //获取参数
        String mid2Str = request.getParameter("mid2");
        String mname2 = request.getParameter("mname2");
        String mprice2Str = request.getParameter("mprice2");
        String stock2Str = request.getParameter("stock2");
        String type2 = request.getParameter("type2");
        String intro2 = request.getParameter("intro2");
        String tips2 = request.getParameter("tips2");
        String inum2Str = request.getParameter("inum2");
        int mid2 = Integer.parseInt(mid2Str);
        double mprice2 = Double.parseDouble(mprice2Str);
        int stock2 = Integer.parseInt(stock2Str);
        int inum2 = Integer.parseInt(inum2Str);
        Merchandise merchandise = new Merchandise(mid2,mname2,mprice2,intro2,tips2,inum2,stock2,type2);
        boolean update = merchandiseService.update(merchandise);
        if (update){
            return "redirect:/AdminServlet?key=allmer"; //使用重定向
        }
        return  null;
    }
}
