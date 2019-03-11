package com.cod4man.eleme.servlet.ConsumerSession;

import com.cod4man.eleme.pojo.Consumer;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/consumerSession.do")
public class doservlet extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Consumer consumer = (Consumer) request.getSession().getAttribute("consumer");
		ServletContext application = this.getServletContext();
		HttpSession session = request.getSession();
		String sessionId = session.getId();		//获取当前sessionId
		HashMap<String,HttpSession> sessionMap = (HashMap<String,HttpSession>)application.getAttribute("sessionMap");
		HashMap<String,String> sessionIdMap = (HashMap<String,String>)application.getAttribute("sessionIdMap");

		//判断账户密码是否输入正确
		if (consumer != null) {
			//判断服务器中是否已经登录了这个用户
			boolean flag = sessionIdMap.keySet().contains(consumer.getConsumerNo());
			//未登录，则进行登录
			if (flag==false) {
				System.out.println("用户未登录");
				System.out.println(consumer.getConsumerNo()+"-----"+sessionId);
				sessionIdMap.put(consumer.getConsumerNo(),sessionId);
				sessionMap.put(sessionId, session);
				System.out.println(sessionIdMap.size()+"------"+sessionMap.size());
				response.sendRedirect(request.getContextPath() +"/restaurant.do?info=findAll");
				//已登录，则使session失效
			}else if(flag==true){
				System.out.println("用户已登录，正在强制下线");
				String existId = sessionIdMap.get(consumer.getConsumerNo());
				sessionMap.get(existId).invalidate();	//使上一个该用户的session失效
				sessionMap.remove(existId);
				sessionIdMap.put(consumer.getConsumerNo(),sessionId);
				sessionMap.put(sessionId, session);
				response.sendRedirect(request.getContextPath() + "/restaurant.do?info=findAll");
			}
		}
	}
}
