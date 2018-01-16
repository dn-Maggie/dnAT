package com.dn.member;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class getStatus extends HttpServlet {

	/**
	 * 获取授权
	 */
	private static final long serialVersionUID = 101;

	public void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		System.out.println("log::getStatus:" + request.getRequestURL().toString());
		PrintWriter out = resp.getWriter();
		String json = "";		
		HttpSession session = request.getSession();
		
		if (session.getAttribute(session.getId()) != null){
				json = "{\"status\":200,\"msg\":\"已授权!\"}";
		}else
			json = "{\"status\":500,\"msg\":\"未授权，或者授权失败。\"}";

		out.print(json);
		// resp.sendRedirect("static/UI.jsp");
		return;
	}
}