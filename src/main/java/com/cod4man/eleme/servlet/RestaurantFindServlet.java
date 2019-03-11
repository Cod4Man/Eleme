package com.cod4man.eleme.servlet;

import com.cod4man.eleme.pojo.*;
import com.cod4man.eleme.service.*;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class RestaurantFindServlet
 */
@WebServlet(urlPatterns = "/restaurant.do")
public class RestaurantFindServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static ApplicationContext applicationContext =
            new ClassPathXmlApplicationContext("ApplicationContext.xml");
    private static RestaurantService rd =
            (RestaurantService) applicationContext.getBean("RestaurantService");
    private static RestaurantTypeService rtd =
            (RestaurantTypeService) applicationContext.getBean("RestaurantTypeService");
    private static FoodsService fd =
            (FoodsService) applicationContext.getBean("FoodsService");
    private static FoodsTypeService ftd =
			(FoodsTypeService) applicationContext.getBean("FoodsTypeService");
    private RestaurantColletService restaurantColletService =
            (RestaurantColletService) applicationContext.getBean("RestaurantColletService");
	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Consumer consumer = (Consumer)request.getSession().getAttribute("consumer");
		List<FoodsType> foodsTypeList = null;
		foodsTypeList = ftd.findAllFoodType();
		request.setAttribute("foodsTypeList", foodsTypeList);
		String restaurantName = null;
		//定义储存对象的集合容器
		List<Restaurant> restList = null;
		List<Foods> foodsList = null;
        List<RestaurantType> typeList = null;
        //分页相关代码
        int index = 0;
        //查询全部店铺类型
        typeList = rtd.findAllType();
        request.setAttribute("typeList", typeList);
        String info = request.getParameter("info");
        String notice = null;
		switch (info) {
			case "findAll":
				//调用查询全部方法
				restList = rd.findAllRestauran(consumer.getConsumerNo(), index);
				request.setAttribute("restList", restList);
				request.getRequestDispatcher("/pages/restaurants.jsp").forward(request, response);
				break;
			case "findById":
			    String collectboo = "false";
				String id = request.getParameter("id");
				foodsList = fd.findAllFoodsById(id);
				request.setAttribute("foodsList", foodsList);
				restList = rd.findRestauran_byId(id,consumer.getConsumerNo());
				restaurantName = restList.get(0).getRestaurantName();
				String restaurantNo2 = restList.get(0).getRestaurantNo();
                notice = restList.get(0).getRestaurantNotice();
				request.setAttribute("restaurantName", restaurantName);
				request.setAttribute("notice", notice);
				request.setAttribute("restaurantNo", restaurantNo2);
				if (restaurantColletService.restaurantColletBoo(consumer.getConsumerNo(), restaurantNo2)) {
				    collectboo = "true";
                }
				request.setAttribute("collectBoo", collectboo);
				request.getRequestDispatcher("/pages/restaurant.jsp").forward(request, response);
				break;
			case "findByName":
                String collectboo2 = "false";
				String name = request.getParameter("name");
				foodsList =fd.findAllFoodsByName(name);
				request.setAttribute("foodsList", foodsList);
				restList = rd.findRestauran_ByName(name,consumer.getConsumerNo());
				restaurantName = restList.get(0).getRestaurantName();
				String restaurantNo = restList.get(0).getRestaurantNo();
                notice = restList.get(0).getRestaurantNotice();
                request.setAttribute("notice", notice);
				request.setAttribute("restaurantName", restaurantName);
				request.setAttribute("restaurantNo", restaurantNo);
                if (restaurantColletService.restaurantColletBoo(consumer.getConsumerNo(), restaurantNo)) {
                    collectboo2 = "true";
                }
                request.setAttribute("collectBoo", collectboo2);
				request.getRequestDispatcher("/pages/restaurant.jsp").forward(request, response);
				break;
				default:break;
		}
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
