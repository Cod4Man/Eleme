package com.cod4man.eleme.servlet;

import com.cod4man.eleme.pojo.Consumer;
import com.cod4man.eleme.pojo.RestaurantCollet;
import com.cod4man.eleme.service.RestaurantColletService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 *
 * @author 张鸿杰
 * Date：2019-03-04
 * Time:17:30
 */
@WebServlet(name = "ShowCollectServlet" , urlPatterns = "/showCollectServlet.do")
public class ShowCollectServlet extends HttpServlet {
    private PrintWriter printWriter;
    private ApplicationContext applicationContext =
            new ClassPathXmlApplicationContext("ApplicationContext.xml");
    private RestaurantColletService restaurantColletService =
            (RestaurantColletService) applicationContext.getBean("RestaurantColletService");
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        printWriter = response.getWriter();
        String what = request.getParameter("what");
        if (what != null && !what.equals("")) {
            switch (what) {
                case "showAllCollect": showAllCollect(request, response); break;
                default: break;
            }
        }
        printWriter.flush();
        printWriter.close();
    }

    private void showAllCollect(HttpServletRequest request, HttpServletResponse response) {
        Consumer consumer = (Consumer) request.getSession().getAttribute("consumer");
        if (consumer != null) {
            String consumerNo= consumer.getConsumerNo();
            List<RestaurantCollet> restaurantCollets = restaurantColletService.findRestaurant_ByConNo(consumerNo);
            request.setAttribute("restaurantCollets", restaurantCollets);
            try {
                request.getRequestDispatcher("/pages/consumers/restaurantCollect.jsp").forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
