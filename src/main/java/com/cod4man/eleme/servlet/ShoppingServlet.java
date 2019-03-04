package com.cod4man.eleme.servlet;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.cod4man.eleme.pojo.testMap;

/**
 * Servlet implementation class ShoppingServlet
 */
@WebServlet(urlPatterns = "/shopping.do")
public class ShoppingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		System.out.println("进入shoppingServlet");
		String restaurantNo = request.getParameter("restaurantNo");
		System.out.println(restaurantNo);
		String json = request.getParameter("json");
		json = json.replace("ZDKH", "{").replace("YDKH", "}").replace("ZZKH", "[").replace("YZKH", "]");

		JSONArray jsonArray = JSON.parseArray(json);

		testMap tm = new testMap();
		HashMap<String, String> foodMap = new HashMap<String,String>();

		for (int i = 0; i < jsonArray.size(); i+=2) {
			foodMap.put(jsonArray.getJSONObject(i).getString("value"), jsonArray.getJSONObject(i+1).getString("value"));
		}

		for (String foodKey : foodMap.keySet()) {
			System.out.print("键:"+foodKey+"----");
			System.out.println("值:"+foodMap.get(foodKey));

		}
	}

}
