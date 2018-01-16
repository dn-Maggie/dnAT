package com.dn.Res;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class getRess extends HttpServlet {
	/**
	 * 查询显示关键字
	 */
	private static final long serialVersionUID = 101;

	public void doGet(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {

		resp.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		System.out.println("log::getRess:" + request.getRequestURL().toString());
		PrintWriter out = resp.getWriter();
		int page=0;
		ArrayList<Map<String, String>> l_key = null;
		try {
			page = Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			page=0;
		}
		HttpSession session = request.getSession();
		System.out.println(session.getAttribute(session.getId()));
		String json = "{\"keyWords\":[";
		if (session.getAttribute(session.getId()) != null) {
			int userid=0;
			try{
				userid=Integer.parseInt(session.getAttribute(session.getId().toString()).toString());
			}catch (Exception e){
				e.printStackTrace();
				userid=0;
			}
			serviceRes res = new serviceRes();
			l_key = res.getRes(page, userid);
			System.out.println(l_key);
			for(int i=0;i<l_key.size();i++){
				json += "{";
				for (String keyset : l_key.get(i).keySet()) {
					if(keyset.equals("rtime"))
						json += "\""+keyset+"\":" + "\"" + l_key.get(i).get(keyset).substring(0,l_key.get(i).get(keyset).length()-2) + "\",";
					else
						json += "\""+keyset+"\":" + "\"" + l_key.get(i).get(keyset) + "\",";   
				}
				json = json.substring(0,json.length()-1);
				json += "},";
			}
			if(l_key.size()>=1)
				json = json.substring(0, json.length()-1);
			
		}
		json += "]}";
		out.print(json);
	}
}
