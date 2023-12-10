package controller.Filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import javax.servlet.FilterChain;


@WebFilter(filterName = "LoginFilter", urlPatterns = "/userServlet")
public class LoginFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("init...");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);

        String loginURI = httpRequest.getContextPath() + "/login.jsp";
        String userServletURI = httpRequest.getContextPath() + "/userServlet";

        boolean loggedIn = session != null && session.getAttribute("user") != null;
        boolean loginRequest = httpRequest.getRequestURI().equals(loginURI);
        boolean userServletRequest = httpRequest.getRequestURI().equals(userServletURI);

        if (loggedIn || loginRequest || userServletRequest) {
            // 如果用户已经登录，或者是登录请求，或者是用户相关的请求，则允许通过
            chain.doFilter(request, response);
        } else {
            // 否则重定向到登录页面
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/login.jsp");
        }

    }

    @Override
    public void destroy() {

    }
}
