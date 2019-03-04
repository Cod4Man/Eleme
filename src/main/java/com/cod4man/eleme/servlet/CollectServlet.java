package com.cod4man.eleme.servlet;

import com.cod4man.eleme.pojo.Consumer;
import com.cod4man.eleme.service.RestaurantColletService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CollectServlet
 */
@WebServlet(urlPatterns = "/collect.do")
public class CollectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ApplicationContext applicationContext =
			new ClassPathXmlApplicationContext("ApplicationContext.xml");
   private RestaurantColletService restaurantColletService =
           (RestaurantColletService) applicationContext.getBean("RestaurantColletService");
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String consumerNo = "";
        Consumer consumer = (Consumer) request.getSession().getAttribute("consumer");
        if (consumer != null ) {
            consumerNo = consumer.getConsumerNo();
        }
        String restaurantNo = request.getParameter("restaurantNo");
		String addr = request.getParameter("addr");
		int index = addr.indexOf("0");
		String result = null;
		if(index>0) {
		    if (restaurantColletService.addRestaurantCollet(consumerNo,restaurantNo)) {
                result = "取消收藏1";
            }
		}else {
		    if (restaurantColletService.removeRestaurantCollet(consumerNo,restaurantNo)) {
                result = "收藏0";
            }
		}
		PrintWriter out = response.getWriter();
		out.print(result);
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
