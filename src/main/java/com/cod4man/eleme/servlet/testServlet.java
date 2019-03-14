package com.cod4man.eleme.servlet;
import com.cod4man.eleme.pojo.Foods;
import com.cod4man.eleme.pojo.*;

import java.time.LocalDateTime;
import java.util.ArrayList;

import java.applet.Applet;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.*;
import com.cod4man.eleme.service.FoodsService;
import com.cod4man.eleme.service.OrderHistoryService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

@WebServlet(urlPatterns = "/testServlet.do")
public class testServlet extends HttpServlet {
	private ApplicationContext applicationContext =
			new ClassPathXmlApplicationContext("ApplicationContext.xml");
	private FoodsService foodsService =
			(FoodsService) applicationContext.getBean("FoodsService");
	private OrderHistoryService orderHistoryService =
            (OrderHistoryService) applicationContext.getBean("OrderHistoryService");
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			String opr = request.getParameter("opr");
			switch (opr) {
			case "shop":
				this.shop(request, response);
				break;
			case "checkout":
				this.checkout(request, response);
				break;
			case "success":
				this.success(request, response);
				break;
			}
	}
	public void shop(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String foodsNo="";
		String json = request.getParameter("json");
		String restaurantNo = request.getParameter("restaurantNo");
		String restaurantName = request.getParameter("restaurantName");
		json = json.replace("ZDKH", "{").replace("YDKH", "}").replace("ZZKH", "[").replace("YZKH", "]");
		JSONArray jsonArray = JSON.parseArray(json);
		HashMap<Foods, String> foodMap = new HashMap<Foods,String>();
		int fenshu = 0;
		double jiage = 0;
		java.text.DecimalFormat df = new java.text.DecimalFormat("#.##");
		for (int i = 0; i < jsonArray.size(); i+=2) {
			foodsNo = jsonArray.getJSONObject(i).getString("value");
			Foods f = foodsService.findById(foodsNo);
			foodMap.put(f, jsonArray.getJSONObject(i+1).getString("value"));
			fenshu += Integer.parseInt(jsonArray.getJSONObject(i+1).getString("value"));
			jiage += f.getFoodsPrice()*Double.parseDouble(jsonArray.getJSONObject(i+1).getString("value"));
			
		}
		jiage =Double.parseDouble(df.format(jiage));
		StringBuilder table = new StringBuilder();
		for (Foods foodKey : foodMap.keySet()) {
			table.append("<tr style=\"height: 35px\"><td>"+foodKey.getFoodsName()+"</td><td>"+foodMap.get(foodKey)+"</td><td>"+foodKey.getFoodsPrice()+"</td></tr>");
		}
		String body = table.toString();
		request.getSession().setAttribute("foodMap", foodMap);
		System.out.println("=====" + foodMap.keySet().size());
		request.setAttribute("body", body);
		request.setAttribute("jiage", jiage);
		request.setAttribute("fenshu", fenshu);
		request.setAttribute("restaurantNo", restaurantNo);
		request.setAttribute("restaurantName", restaurantName);
		request.getRequestDispatcher("/pages/shopCart/checkout.jsp").forward(request, response);
	}
	public void checkout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        Consumer consumer = (Consumer)request.getSession().getAttribute("consumer");
		String danhao = request.getParameter("WIDout_trade_no");
		String mingcheng =request.getParameter("WIDsubject");
		String jiage = request.getParameter("WIDtotal_amount");
		String restaurantNo = request.getParameter("restaurantNo");
		HashMap<Foods, String> foodmap = (HashMap<Foods, String>)request.getSession().getAttribute("foodMap");
		String dizhi = request.getParameter("dizhi");
		String beizhu = request.getParameter("WIDbody");
		
		//把获取到的属性添加到oh
		OrderHistory oh = new OrderHistory();
        List<OrderDetail> orderDetailList = new ArrayList<>();
        //把foodsMap转换成List<OrderDetail>
        OrderDetail orderDetail = null;
        for (Foods foods :foodmap.keySet()) {
        	orderDetail = new OrderDetail();
            orderDetail.setOrderHistoryNo(danhao);
            orderDetail.setFoodsNo(foods.getFoodsNo());
            orderDetail.setFoodsNum(Integer.parseInt(foodmap.get(foods)));
            orderDetailList.add(orderDetail);
        }
		oh.setComment("" + beizhu);
		oh.setPrice(Double.parseDouble(jiage));
		oh.setOrderHistoryNo("" + danhao);
        oh.setConsumerNo("" + consumer.getConsumerNo());
        oh.setOrderDate(LocalDateTime.now());
        oh.setRestaurantNo("" + restaurantNo);
        oh.setOrderStatus(1);
        oh.setOrderDetailList(orderDetailList);
        oh.setAddressId(Integer.parseInt(dizhi));

		//把oh存到session
		request.getSession().setAttribute("OrderHistory", oh);
		request.setAttribute("WIDout_trade_no", danhao);
		request.setAttribute("WIDsubject", mingcheng);
		request.setAttribute("WIDtotal_amount", jiage);
		request.getRequestDispatcher("/pages/shopCart/alipay.trade.page.pay.jsp").forward(request, response);
	}
	public void success(HttpServletRequest request, HttpServletResponse response){
		System.out.println("支付成功啦");
		OrderHistory oh=(OrderHistory)request.getSession().getAttribute("OrderHistory");
		System.out.println("历史订单:"+oh);
		//执行sql语句将oh添加至数据库
        if (orderHistoryService.addOrderHistory(oh)) {
            System.out.println("添加历史订单成功");
            //然后删除session中的oh
            request.getSession().removeAttribute("OrderHistory");
            //然后跳转到下个页面
			try {
				response.sendRedirect("http://192.168.1.56:8080/pages/consumers/consumerCenter.jsp?orderHistory=zzzz");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}
}
