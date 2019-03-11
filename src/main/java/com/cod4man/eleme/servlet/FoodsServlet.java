package com.cod4man.eleme.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FoodsServlet
 */
@WebServlet(urlPatterns ="/foods.do")
public class FoodsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	/**
	 * @see HttpServlet#doGet(HttpServlet	Request request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int number = Integer.parseInt(request.getParameter("number"));
		String info = request.getParameter("info");
		PrintWriter out = response.getWriter();
		switch (info) {
			case "jia":
				number = number + 1;
				break;
			case "jian":
				if(number==0) {
					number = 0;
				}else {
					number = number - 1;
				}
				break;
		}
		out.print(number);
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
