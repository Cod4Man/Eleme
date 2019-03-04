package com.cod4man.eleme.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.cod4man.eleme.pojo.Foods;
import com.cod4man.eleme.service.FoodsService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Servlet implementation class FoodsByTypeFindServlet
 */
@WebServlet(urlPatterns = "/foodsfind.do")
public class FoodsByTypeFindServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static ApplicationContext applicationContext =
			new ClassPathXmlApplicationContext("ApplicationContext.xml");
	private static FoodsService fd =
			(FoodsService) applicationContext.getBean("FoodsService");
   
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String info = request.getParameter("info");
		String type = request.getParameter("type");
		String restaurantNo = request.getParameter("restaurantNo");
		List<Foods> foodsList = null;
		switch (info) {
			case "byType":
				if("全部".equals(type)) {
					//查询全部食物
					foodsList = fd.findAllFoodsById(restaurantNo);
					break;
				}else {
					//通过类型查询
					foodsList = fd.findFoodsByType(type,restaurantNo);
					break;
				}
			default:
				break;
		}
		PrintWriter out = response.getWriter();
		String foods = JSON.toJSONString(foodsList);
		out.print(foods);
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
