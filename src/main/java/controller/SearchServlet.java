package controller;

import beans.Merchandise;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.MerchandiseService;
import service.MerchandiseServiceImpl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/searchServlet")
public class SearchServlet extends BaseServlet {

    private MerchandiseService merchandiseService = new MerchandiseServiceImpl();

    //根据关键字搜索商品
    public String search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        String selkey = request.getParameter("selkey");

        if (selkey == null || selkey.equals("") || selkey.equals("all")) {
            // 搜索所有商品
            List<Merchandise> all = merchandiseService.findAll();
            request.setAttribute("selMerchandises", all);
            return "forward:/search.jsp";

        } else {
            List<Merchandise> merchandises = merchandiseService.findByStr(selkey);
            request.setAttribute("selMerchandises", merchandises);
            return "forward:/search.jsp";

        }

    }

    //搜索所有商品
    public String all(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        List<Merchandise> all = merchandiseService.findAll();
        request.setAttribute("selMerchandises", all);

        return "forward:/search.jsp";
    }


    //根据价格搜索
    public String money(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        //获取参数
        String key = request.getParameter("selkey");
        int start = 0;
        int end = 0;
        if ("a".equals(key)){
            start = 0;
            end = 2000;
        }else if ("b".equals(key)){
            start = 2000;
            end = 3000;
        }else if ("c".equals(key)){
            start = 3000;
            end = 999999;
        }
        //查询所有的水果
        List<Merchandise> all = merchandiseService.findAll();
        List<Merchandise> merchandiseList = new ArrayList<Merchandise>();
        for (Merchandise Merchandise : all){
            if  (Merchandise.getMprice() >= start && Merchandise.getMprice() < end){
                merchandiseList.add(Merchandise);
            }
        }
        request.setAttribute("selMerchandises",merchandiseList);
        return "forward:/search.jsp";
    }


}



