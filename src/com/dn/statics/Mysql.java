package com.dn.statics;

import java.sql.*;
public class Mysql {

	public static Connection ct = null;

	public Mysql() {	//Mysql地址配置
		try {
			Class.forName("com.mysql.jdbc.Driver");
			ct = DriverManager.getConnection(property.readRcErpURL("jdbcUrl"), property.readRcErpURL("user"), property.readRcErpURL("password"));
			DriverManager.setLoginTimeout(10);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static Connection getConnection(){
		return ct;
	}
}
