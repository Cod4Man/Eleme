package com.cod4man.eleme.servlet.ConsumerSession;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class SessionCounter implements HttpSessionListener {

	private static int activeSessions = 0; 
	
	@Override
	public void sessionCreated(HttpSessionEvent se) {
	        activeSessions++;
		System.out.println("当前访问人数"+activeSessions);
	}
	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		if(activeSessions > 0) {
			activeSessions--;
		}
		System.out.println("当前访问人数"+activeSessions);
	}
	public static int getActiveSessions() {   
        return activeSessions;   
    } 
}
