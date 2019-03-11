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
 * Servlet implementation class PageServlet
 */
@WebServlet("/page.do")
public class PageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static ApplicationContext applicationContext =
			new ClassPathXmlApplicationContext("ApplicationContext.xml");
	private static RestaurantService rd =
			(RestaurantService) applicationContext.getBean("RestaurantService");

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int index = Integer.parseInt(request.getParameter("page"));
		String info = request.getParameter("info");
		String type = request.getParameter("type");
		List<Restaurant> restList = null;
		//session里面的到编号
		HttpSession session = request.getSession();
		Consumer consumer = (Consumer)session.getAttribute("consumer");
		String consumerNo = consumer.getConsumerNo();
		switch (info) {
			case "findAll":
				System.out.println("scroll查询全部");
				restList = rd.findAllRestauran(consumerNo,index);
				break;
			case "type":
				System.out.println("scroll查询" + type);
				restList = rd.findRestauran_byType(type,consumerNo, index);
				break;
				default:break;
		}
//		request.setAttribute("relist", restList);
//		request.getRequestDispatcher("/pages/scrollRest.jsp").forward(request, response);
		PrintWriter out = response.getWriter();

		String listJSON = JSON.toJSONString(restList);
		out.print(listJSON);
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
