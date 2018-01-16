package com.dn.caseSuit;

import java.sql.SQLException;

import javax.servlet.http.HttpServlet;

import com.dn.statics.Mysql;
import com.dn.statics.Param;
import com.dn.statics.property;

public class servletInit extends HttpServlet {
	/**
	 * 初始化
	 */
	private static final long serialVersionUID = 101;
	public void init() {
		new property();
		new Param();
		new Mysql();
//		new Mysql();
//		try {
//			Mysql.getConnection().close();
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		//Param.path = this.getServletContext().getRealPath("/WEB-INF/");
		//System.out.println("log::info："+Param.path);
	}
}
