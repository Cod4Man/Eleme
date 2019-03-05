package com.cod4man.eleme.servlet;

import com.cod4man.eleme.pojo.Consumer;
import com.cod4man.eleme.pojo.OrderHistory;
import com.cod4man.eleme.service.ConsumerAddressService;
import com.cod4man.eleme.service.ConsumerService;
import com.cod4man.eleme.service.OrderHistoryService;
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
 * Date：2019-03-05
 * Time:14:08
 */
@WebServlet(name = "OrderStatusServlet", urlPatterns = "/orderStatusServlet.do")
public class OrderStatusServlet extends HttpServlet {
    private ApplicationContext applicationContext =
            new ClassPathXmlApplicationContext("ApplicationContext.xml");
    private OrderHistoryService orderHistoryService =
            (OrderHistoryService) applicationContext.getBean("OrderHistoryService");
    private PrintWriter printWriter ;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        printWriter = response.getWriter();
        String what = request.getParameter("what");
        if (what != null && !what.equals("")) {
            switch (what) {
                case "showAllOrder": showAllOrder(request, response); break;
                case "orderDetail": orderDetail(request, response); break;
                default: break;
            }
        }
        printWriter.flush();
        printWriter.close();
    }

    private void showAllOrder(HttpServletRequest request, HttpServletResponse response) {
        Consumer consumer = (Consumer)request.getSession().getAttribute("consumer");
        List<OrderHistory> orderHistoryList = orderHistoryService.findAll_ByConNo(consumer.getConsumerNo());
        request.setAttribute("orderHistoryList", orderHistoryList);
        try {
            request.getRequestDispatcher("/orderList.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void orderDetail(HttpServletRequest request, HttpServletResponse response) {
        String orderHistoryNo = request.getParameter("orderHistoryNo");
        if (orderHistoryNo != null) {
            OrderHistory orderHistory = orderHistoryService.findOrder(orderHistoryNo);
            request.setAttribute("orderHistory", orderHistory);
            //转发页面
            try {
                request.getRequestDispatcher("/orderDetail02.jsp").forward(request, response);
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
