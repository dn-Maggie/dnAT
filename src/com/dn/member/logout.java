package com.dn.member;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class logout extends HttpServlet {

	/**
	 * 注销
	 */
	private static final long serialVersionUID = 101;

	public void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		System.out.println("log::login:" + request.getRequestURL().toString());
		PrintWriter out = resp.getWriter();
		String json = "";		
		HttpSession session = request.getSession();
		
		if (session.getAttribute(session.getId()) != null){
			json = "{\"status\":200,\"msg\":\"注销成功!\"}";
		}else{
			json = "{\"status\":200,\"msg\":\"注销成功!登录态已经失效。\"}";
		}
		//session.setAttribute(session.getId(), null);
		session.invalidate();

		out.print(json);
		//resp.sendRedirect("./index.html");
		return;
	}
}