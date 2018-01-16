package com.dn.Res;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.dn.statics.Mysql;

public class serviceRes {
	public ArrayList<Map<String, String>> l_key = null;
	public HashMap<String,String> map=null;
	
	public Map<String, String> getRes(int id){				//查询关键字
		map = new HashMap<String,String>();
		String sql = "";
		Connection conn = null;
		conn = Mysql.getConnection();
		try {
			Statement sm = conn.createStatement();
			ResultSet rs=null;
			sql = "select * from res where id='"+id+"'";
			rs = sm.executeQuery(sql);
			while (rs.next()) {
				//System.out.println("+1");
				ResultSetMetaData rsmd = rs.getMetaData();
				for (int i = 1; i <= rsmd.getColumnCount(); i++) {
					map.put(rsmd.getColumnName(i),rs.getString(i));
				}
			}
			/*
			System.out.println("size:"+outputList.l_key.size());
			for (int i=0;i<outputList.l_key.size();i++)
				System.out.println(outputList.l_key.get(i).get("id"));
				*/
			sm=null;
			rs=null;
			//conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return map;
	}
	
	public ArrayList<Map<String, String>> getRes(int page,int userid){				//分页查询关键字
		l_key = new ArrayList<Map<String, String>>();
		map = new HashMap<String,String>();
		Connection conn = null;
		conn = Mysql.getConnection();
		try {
			CallableStatement cm=conn.prepareCall("{call pageRes(?,?)}");
			cm.setInt(1,userid);
			cm.setInt(2,page);
			ResultSet rs=cm.executeQuery();
			while (rs.next()) {
				ResultSetMetaData rsmd = rs.getMetaData();
				for (int i = 1; i <= rsmd.getColumnCount(); i++) {
					map.put(rsmd.getColumnName(i),rs.getString(i));
				}
				l_key.add(map);
				map = new HashMap<String,String>();
			}
			/*
			System.out.println("size:"+outputList.l_key.size());
			for (int i=0;i<outputList.l_key.size();i++)
				System.out.println(outputList.l_key.get(i).get("id"));
				*/
			cm=null;
			rs=null;
			//conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return l_key;
	}
	
	public boolean setRes(Map<String, String> map) {

		String sql = "insert into res values(0,'" + map.get("userid") + "','" + map.get("name") + "','"
				+ map.get("counts") + "','" + map.get("pass") + "','" + map.get("fail") + "',CURRENT_TIMESTAMP,'" + map.get("status") + "');";
		Statement sm;
		System.out.println(sql);
		Connection conn = null;
		conn = Mysql.getConnection();
		try {
			sm = conn.createStatement();
			int rs = 0;
			rs = sm.executeUpdate(sql);
			if (rs > 0)
				return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return false;
	}
	
	
}
