package com.dn.Res;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class setRes extends HttpServlet {
	/**
	 * 更新结果记录
	 */
	private static final long serialVersionUID = 101;

	public void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		System.out.println("log::setRes:" + request.getRequestURL().toString());
		PrintWriter out = resp.getWriter();
		String json = "";
		HttpSession session = request.getSession();
		if (session.getAttribute(session.getId()) != null) {
			Map<String, String> map = new HashMap<String, String>();
			for (Object it : request.getParameterMap().keySet()) {
				String value = request.getParameter(it.toString()).toString();
				map.put(it.toString(), value);
			}
			map.put("userid", session.getAttribute(session.getId()).toString());
			serviceRes res = new serviceRes();
			boolean ret = res.setRes(map);
			if (ret)
				json = "{\"status\":200,\"msg\":\"更新结果成功！\"}";
			else
				json = "{\"status\":201,\"msg\":\"更新结果失败！\"}";
		} else {
			json = "{\"status\":205,\"msg\":\"未登录，或登录状态有误！\"}";
		}

		out.print(json);
		// resp.sendRedirect("static/UI.jsp");
		return;
	}
}