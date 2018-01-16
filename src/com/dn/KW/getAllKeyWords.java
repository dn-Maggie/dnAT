package com.dn.KW;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class getAllKeyWords extends HttpServlet {
	/**
	 * 查询显示关键字
	 */
	private static final long serialVersionUID = 101;

	public void doGet(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {

		resp.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		System.out.println("log::getKeyWords:" + request.getRequestURL().toString());
		PrintWriter out = resp.getWriter();
		int type=-1;
		ArrayList<Map<String, String>> l_key = null;
		
		try {
			type = Integer.parseInt(request.getParameter("type"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			type=-1;
		}
		
		//System.out.println(paramName);
		serviceKey key = new serviceKey();
		l_key = key.getKey(type);
		String json = "{\"keyWords\":[{";
		for(int i=0;i<l_key.size();i++){
			json += "\"key" +i + "\":\"" + l_key.get(i).get("key")+"\",";
		}
		if(l_key.size()>=1)
			json = json.substring(0, json.length()-1);
		
		json += "}]}";
		out.print(json);
	}
}
