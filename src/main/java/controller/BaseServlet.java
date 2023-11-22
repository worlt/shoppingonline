package controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

public class BaseServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        //获取参数
        String keyStr = request.getParameter("key");

        //如果keyStr为空或者null，直接跳到首页
        if (keyStr == null || keyStr.equals("")){
            keyStr = "index";
        }

        //获取class参数
        Class clazz = this.getClass();

        //获取方法对象
        try {
            Method method = clazz.getMethod(keyStr,HttpServletRequest.class,HttpServletResponse.class);
            Object result = method.invoke(this,request,response);
            if (result != null){
                String resultStr = (String) result;
                if (resultStr.indexOf("forward:") != -1){//转发
                    String path = resultStr.substring(resultStr.indexOf(":") + 1);
                    request.getRequestDispatcher(path).forward(request,response);
                }else if (resultStr.indexOf("redirect:") != -1){//重定向
                    String path = resultStr.substring(resultStr.indexOf(":") + 1);
                    response.sendRedirect(request.getContextPath() + path);
                }else {//直接响应字符串
                    response.getWriter().println(resultStr);
                }
            }
        } catch (NoSuchMethodException e) {
            throw new RuntimeException(e);
        } catch (InvocationTargetException e) {
            throw new RuntimeException(e);
        } catch (IllegalAccessException e) {
            throw new RuntimeException(e);
        }
    }

    //统一跳转到首页
    public String index(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        return "redirect:/index.jsp";
    }

}
