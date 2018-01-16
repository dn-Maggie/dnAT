package com.dn.member;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

import com.dn.statics.Mysql;

public class memberCenter {

	private static final String REGEX = "^[a-zA-Z0-9]+$";
	public static HashMap<String, String> mapret;
	
	/**
	 * @登录逻辑
	 */	
	public Map<String, String> login(String name, String pwd) {
		mapret = new HashMap<String, String>();
		boolean res = true;

		if (name == null || name.length() < 3 || pwd == null || pwd.length() < 3) {
			mapret.put("status", "205"); // 返回状态码105：用户名密码不能为空或者小于6位
			mapret.put("msg", "用户名密码不能为空或者小于3位");
			return mapret;
		}

//		if (name.length() > 16 || pwd.length() > 16) {
//			mapret.put("status", "204"); // 返回状态码104：用户名密码过长
//			mapret.put("msg", "用户名密码过长");
//			return mapret;
//		}

		res = this.Check(name);
		if (!res) {
			mapret.put("status", "201"); // 返回状态码101：用户名有非法字符
			mapret.put("msg", "用户名有非法字符");
			return mapret;
		}

		res = this.Check(pwd);
		if (!res) {
			mapret.put("status", "201"); // 返回状态码101：用户名密码有非法字符
			mapret.put("msg", "用户名密码有非法字符");
			return mapret;
		}

		res = this.loginName(name);
		if (!res) {
			mapret.put("status", "202"); // 返回状态码102：用户名不存在
			mapret.put("msg", "用户名不存在");
			return mapret;
		}

		String userid = this.Password(name, pwd);
		if (userid==null) {
			mapret.put("status", "203"); // 返回状态码101：密码错误
			mapret.put("msg", "用户名密码错误");
			return mapret;
		} else
			mapret.put("userid", userid);

		mapret.put("status", "200"); // 返回状态码101：登录成功
		mapret.put("msg", "登录成功");
		return mapret;
	}
	
	/**
	 * @校验用户名是否存在
	 */
	private boolean loginName(String name) {
		String sql = "select id from userinfo where username='" + name + "'";
		Statement sm;
		Connection conn = null;
		try {
			conn = Mysql.getConnection();
			sm = conn.createStatement();
			ResultSet rs = null;
			rs = sm.executeQuery(sql);
			// rs.next();
			if (rs.next()){
				sql = null;
				sm.close();
				sm = null;
				rs.close();
				rs = null;
				return true;
				}else{
					sql = null;
					sm.close();
					sm = null;
					rs.close();
					rs = null;
				}
			//conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			sql = null;
			sm = null;
			e.printStackTrace();
			System.out.println("数据库错误1");
			return false;
		}
		return false;
	}

	/**
	 * @校验密码是否正确
	 */
	private String Password(String name, String pwd) {
		String sql = "select * from userinfo where username='" + name + "' and password='" + pwd + "'";
		Connection conn=null;
		String userid=null;
		try {
			conn = Mysql.getConnection();
			Statement sm = conn.createStatement();
			ResultSet rs = null;
			rs = sm.executeQuery(sql);

			if (rs.next()) {
				ResultSetMetaData rsmd = rs.getMetaData();
				for (int i = 1; i <= rsmd.getColumnCount(); i++) {
					if (rsmd.getColumnName(i).equals("id"))
						userid = rs.getString(i);
				}
				sql = null;
				sm.close();
				sm = null;
				rs.close();
				rs = null;
			}else{
				sql = null;
				sm.close();
				sm = null;
				rs.close();
				rs = null;
			}
			//conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			sql = null;
			System.out.println("log::error：数据库错误2");
			e.printStackTrace();
		}
		return userid;
	}
	
	/**
	 * @通过userid获取用户信息
	 */
	public Map<String, String> getUserInfo(String id) {
		HashMap<String, String> userInfo = new HashMap<String, String>();
		int userid=-1;
		try{
			userid = Integer.parseInt(id);
		}catch (Exception e){
			userid = -1;
		}
		
		if(userid <0){
			userInfo.put("status", "205");
			userInfo.put("msg", "参数错误！");
			return userInfo;
		}
		
		String sql = "select * from userinfo where id='"+userid+"'";
		Connection conn=null;
		try {
			conn = Mysql.getConnection();
			Statement sm = conn.createStatement();
			ResultSet rs = null;
			rs = sm.executeQuery(sql);

			if (rs.next()) {
				userInfo.put("status", "200");
				userInfo.put("msg", "用户信息获取成功！");
				ResultSetMetaData rsmd = rs.getMetaData();
				for (int i = 1; i <= rsmd.getColumnCount(); i++) {
					if (!rsmd.getColumnName(i).equals("password"))
						userInfo.put(rsmd.getColumnName(i), rs.getString(i));
				}
				//System.out.println(userInfo.toString());
				sql = null;
				sm.close();
				sm = null;
				rs.close();
				rs = null;
			}else{
				userInfo.put("status", "201");
				userInfo.put("msg", "用户信息不存在！");
				sql = null;
				sm.close();
				sm = null;
				rs.close();
			}
			//conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			userInfo.put("status", "206");
			userInfo.put("msg", "数据库错误！");
			sql = null;
			System.out.println("log::error：数据库错误3");
			e.printStackTrace();
		}
		return userInfo;
	}

	/**
	 * @校验是否包含非法字符
	 */
	private boolean Check(String str) {
		Pattern p = Pattern.compile(REGEX);
		boolean flg = p.matcher(str).matches();
		p = null;
		return flg;
	}

}
