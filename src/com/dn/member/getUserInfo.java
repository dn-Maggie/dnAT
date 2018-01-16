package com.dn.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dn.statics.Param;

public class getUserInfo extends HttpServlet {

	/**
	 * 获取用户信息
	 */
	private static final long serialVersionUID = 101;

	public void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		//System.out.println("log::getUserInfo:" + request.getRequestURL().toString());
		PrintWriter out = resp.getWriter();
		String json = "";		
		HttpSession session = request.getSession();
		Map<String, String> mapUserInfo = null;
		
		if (session.getAttribute(session.getId()) != null){
			try {
				mapUserInfo = Param.user.getUserInfo(session.getAttribute(session.getId()).toString());
			} catch (Exception e) {
				mapUserInfo = null;
			}
			if(mapUserInfo!=null){
				json = "{";
				for (Entry<String, String> entry : mapUserInfo.entrySet()) {
					json += "\"" + entry.getKey() + "\":\"" + entry.getValue() + "\",";
				}
				json = json.substring(0,json.length()-1);
				json += "}";
			}else{
				json = "{\"status\":202,\"msg\":\"用户信息为空\"}";
			}
		}else
			json = "{\"status\":500,\"msg\":\"用户未登录，查询失败。\"}";
		out.print(json);
		// resp.sendRedirect("static/UI.jsp");
		return;
	}
}