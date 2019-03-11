package com.cod4man.eleme.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created with IntelliJ IDEA.
 *
 * @author 张鸿杰
 * Date：2019-02-08
 * Time:22:18
 */
@WebFilter(filterName = "RemoveSessionFilter",urlPatterns ="" /*{"/pages/restaurants.jsp","/pages/restaurant.jsp"
        ,"/pages/consumers/consumerCenter.jsp","/pages/shopCart/checkout.jsp"}*/)
public class RemoveSessionFilter implements Filter {
    @Override
    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        System.out.println("用户session判断");
        HttpServletResponse response = (HttpServletResponse) resp;
        HttpServletRequest resquest = (HttpServletRequest) req;
        if (resquest.getSession().getAttribute("consumer") == null) {
            System.out.println("用户session失效");
            //失效
            response.sendRedirect(resquest.getContextPath() + "/pages/consumers/login.jsp");
        } else {

        }
    }

    @Override
    public void init(FilterConfig config) throws ServletException {

    }

}
