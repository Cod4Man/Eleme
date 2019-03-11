package com.cod4man.eleme.servlet.ConsumerSession;

import java.util.HashMap;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;

public class init extends HttpServlet {


	@Override
	public void destroy() {
		super.destroy();
	}
	@Override
	public void init() throws ServletException {
		HashMap<String,HttpSession>	sessionMap = new HashMap<String,HttpSession>();
		HashMap<String,String> sessionIdMap = new HashMap<String,String>();
		System.out.println("服务器启动!!!!!!!!!!!!!");
		ServletContext application = this.getServletContext();
		application.setAttribute("sessionMap", sessionMap);
		application.setAttribute("sessionIdMap", sessionIdMap);
	}

}
