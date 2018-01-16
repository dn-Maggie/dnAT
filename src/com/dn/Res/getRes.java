package com.dn.Res;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class getRes extends HttpServlet {
	/**
	 * 查询显示关键字
	 */
	private static final long serialVersionUID = 101;

	public void doGet(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {

		resp.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		System.out.println("log::getRess:" + request.getRequestURL().toString());
		PrintWriter out = resp.getWriter();
		int id=0;
		Map<String, String> map = null;
		try {
			id = Integer.parseInt(request.getParameter("id"));
		} catch (Exception e) {
			id=0;
		}
		HttpSession session = request.getSession();
		//System.out.println(type + "--" + page + "---" +str);
		String json = "";
		if (session.getAttribute(session.getId()) != null) {
			serviceRes res = new serviceRes();
			map = res.getRes(id);
			json += "{";
			if(map.size()>0){
				for (String keyset : map.keySet()) {  
				    json += "\""+keyset+"\":" + "\"" + map.get(keyset) + "\",";   
				}
				json+="\"status\":200";
			}else
				json+="\"status\":204";			
		}else
			json+="\"status\":205";	
		json += "}";
		out.print(json);
	}
}
