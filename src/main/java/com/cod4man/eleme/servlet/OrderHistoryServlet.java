package com.cod4man.eleme.servlet;

import com.cod4man.eleme.pojo.Consumer;
import com.cod4man.eleme.pojo.OrderHistory;
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
 * Date：2019-03-04
 * Time:9:59
 */
@WebServlet(name = "OrderHistoryServlet",urlPatterns = "/orderhistory.do")
public class OrderHistoryServlet extends HttpServlet {
    private static PrintWriter printWriter;
    private ApplicationContext applicationContext =
            new ClassPathXmlApplicationContext("ApplicationContext.xml");
    private OrderHistoryService orderHistoryService =
            (OrderHistoryService) applicationContext.getBean("OrderHistoryService");
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        printWriter = response.getWriter();
        String what = request.getParameter("what");
        if (what != null && !what.equals("")) {
            switch (what) {
                case "showAll": showAll(request, response); break;
                case "setOrderStatus": setOrderStatus(request, response); break;
                case "orderDetail": orderDetail(request, response); break;
                default: break;
            }
        }
        printWriter.flush();
        printWriter.close();
    }

    private void orderDetail(HttpServletRequest request, HttpServletResponse response) {
        String orderHistoryNo = request.getParameter("orderHistoryNo");
        if (orderHistoryNo != null) {
            OrderHistory orderHistory = orderHistoryService.findOrder(orderHistoryNo);
            request.setAttribute("orderHistory", orderHistory);
            //转发页面
            try {
                request.getRequestDispatcher("/pages/consumers/orderDetail.jsp").forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void setOrderStatus(HttpServletRequest request, HttpServletResponse response) {
        String status = request.getParameter("status");
        String orderId = request.getParameter("orderId");
        if (status != null && orderId != null) {
            if (orderHistoryService.modifyOrderStatus(Integer.parseInt(orderId), Integer.parseInt(status))) {
                printWriter.write("true");
            } else {
                printWriter.write("false");
            }
        }
    }

    private void showAll(HttpServletRequest request, HttpServletResponse response) {
        //拿到consumer
        Consumer consumer = (Consumer) request.getSession().getAttribute("consumer");
        if (consumer != null) {
            String consumerNo = consumer.getConsumerNo();
            List<OrderHistory> orderHistoryList = orderHistoryService.findAll_ByConNo(consumerNo);
            request.setAttribute("orderHistoryList", orderHistoryList);
            //转发页面
            try {
                request.getRequestDispatcher("/pages/consumers/orderHistory.jsp").forward(request, response);
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
