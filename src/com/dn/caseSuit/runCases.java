package com.dn.caseSuit;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.dn.statics.property;

public class runCases extends HttpServlet {
	/**
	 * 运行用例
	 */
	private static final long serialVersionUID = 101;

	public void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = resp.getWriter();
		System.out.println("log::runCases:" + request.getRequestURL().toString());
		String json = "";
		HttpSession session = request.getSession();
		if (session.getAttribute(session.getId()) != null) {
			json = "{\"status\":200,\"msg\":\"开始运行用例，请保证当前机器无人操作！\",\"url\":\"" + property.readRcErpURL("downUrl")+ "\"}";
		} else {
			json = "{\"status\":401,\"msg\":\"未登录或登录态失效,不能运行！\"}";
		}
		out.print(json);
		// resp.sendRedirect("index.jsp");
	}
}
