package com.dn.caseSuit;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dn.statics.Param;

public class getCasesServlet extends HttpServlet {

	/**
	 * 查询服务器的用例文件
	 */
	private static final long serialVersionUID = 101;

	public void doGet(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {

		resp.setContentType("text/html;charset=UTF-8");
		System.out.println("log::getCases:" + request.getRequestURL().toString());
		PrintWriter out = resp.getWriter();
		String[] Cases = getFileName(Param.path+"/upload/UI");
		String json = "{\"status\":200, \"msg\":\"获取用例列表成功！\", \"UI\":[";
		if (Cases != null) {
			int i = 1;
			for (String name : Cases){
				json += "[{\"case" + i + "\":\"" + name + "\"}],";
				i++;
			}
			json = json.substring(0, json.length() - 1);
			json += "]";
		}else{
			json +="]";
		}
		
		Cases = getFileName(Param.path+"/upload/APP");
		json += ",\"APP\":[";
		if (Cases != null) {
			int i = 1;
			for (String name : Cases){
				json += "[{\"case" + i + "\":\"" + name + "\"}],";
				i++;
			}
			json = json.substring(0, json.length() - 1);
			json += "]";
		}else{
			json +="]";
		}
		
		Cases = getFileName(Param.path+"/upload/Interface");
		json += ", \"Interface\":[";
		if (Cases!=null) {
			int i = 1;
			for (String name : Cases){
				json += "[{\"case" + i + "\":\"" + name + "\"}],";
				i++;
			}
			json = json.substring(0, json.length() - 1);
			json += "]}";
		}else{
			json +="]}";
		}
		out.print(json);

	}
	
	public static String[] getFileName(String path) {
		String[] fileName = null;
		try {
			File file = new File(path);
			fileName = file.list();
		} catch (Exception e) {
			System.out.println("log::warn：用例目录没有文件。");
			e.printStackTrace();
		}
		return fileName;
	}
	
	//检查文件名是否已经存在
	public static boolean checkFileName(String Name){
		String[] fileName = getFileName(Param.path+"upload");
		for(String name:fileName)
	          if(name.equals(Name))
	        	  return true;

		return false;
	}
}
