package com.cod4man.eleme.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSON;
import com.cod4man.eleme.pojo.Consumer;
import com.cod4man.eleme.pojo.Restaurant;
import com.cod4man.eleme.service.RestaurantService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


/**
 * Servlet implementation class RestFindByTypeServlet
 */
@WebServlet(urlPatterns = "/type.do")
public class RestFindByTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static ApplicationContext applicationContext =
			new ClassPathXmlApplicationContext("ApplicationContext.xml");
	private static RestaurantService rd =
			(RestaurantService) applicationContext.getBean("RestaurantService");
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Consumer consumer = (Consumer)request.getSession().getAttribute("consumer");

		String type = request.getParameter("type");
		List<Restaurant> restList = null;
		if("全部".equals(type)) {
			restList = rd.findAllRestauran(consumer.getConsumerNo());
		}else {
			restList = rd.findRestauran_byType(type,consumer.getConsumerNo());}
		String listJSON = JSON.toJSONString(restList);
		PrintWriter out = response.getWriter();
		out.print(listJSON);
		out.flush();
		out.close();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
