package com.dn.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dn.statics.Param;

public class login extends HttpServlet {
	/**
	 * 调试登录
	 */
	private static final long serialVersionUID = 101;

	public void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		//System.out.println("log::login:" + request.getRequestURL().toString());
		PrintWriter out = resp.getWriter();
		String loginName = request.getParameter("loginName");
		String pwd = request.getParameter("Pwd");
		String json = "";
		String uid = "";
		// System.out.println(loginName+" "+pwd);

		HttpSession session = request.getSession();
		Cookie nameCookie = new Cookie("sid", session.getId());
		nameCookie.setMaxAge(1800);
		resp.addCookie(nameCookie);
		new Param();
		if (session.getAttribute(session.getId()) == null) {
			Map<String, String> res = new HashMap<String, String>();
			res = Param.user.login(loginName, pwd);
			if (res.get("status").equals("200")) {
				uid = res.get("userid");
				nameCookie = new Cookie("user", res.get("username"));
				nameCookie.setMaxAge(1800);
				resp.addCookie(nameCookie);
				session.setAttribute(session.getId(), uid);
				//System.out.println(session.getAttribute(session.getId()));
				json = "{\"status\":" + res.get("status") + ",\"msg\":\"" + res.get("msg") + "\"";
				json += ",\"sessionid\":\"" + session.getId() + "\"}";
				//System.out.println(json);
				resp.sendRedirect("static/KeyWords.html");
			} else
				//System.out.println(json);
				json = "{\"status\":" + res.get("status") + ",\"msg\":\"" + res.get("msg") + "\"}";
		} else {
			//System.out.println(json);
			json = "{\"status\":208,\"msg\":\"不能重复登录!\"}";
			resp.sendRedirect("static/KeyWords.html");
		}
		// System.out.println("?????"+session.getAttribute("userId"));
		out.print(json);
		// resp.sendRedirect("static/KeyWords.html");
		return;
	}
}