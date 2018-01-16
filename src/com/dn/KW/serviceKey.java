package com.dn.KW;

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

public class serviceKey {
	public ArrayList<Map<String, String>> l_key = null;
	public HashMap<String,String> map=null;
	
	public ArrayList<Map<String, String>> getKey(int type){				//查询关键字
		l_key = new ArrayList<Map<String, String>>();
		map = new HashMap<String,String>();
		String sql = "";
		Connection conn1 = null;
		Connection conn = null;
		conn = Mysql.getConnection();
		conn1 = Mysql.getConnection();
		try {
			Statement sm = conn.createStatement();
			ResultSet rs=null;
			if(type==-1)			
				sql = "select DISTINCT type from KW order by type";
			else
				sql = "select DISTINCT type from KW where type='"+type+"'";
			rs = sm.executeQuery(sql);
			while (rs.next()) {
				Statement sm1 = conn1.createStatement();
				//System.out.println("+1");
				sql="select keyword from KW where type='" + rs.getString(1) +"' order by id";
				ResultSet rs1 = sm1.executeQuery(sql);
				while (rs1.next()) {
					map.put("key",rs1.getString(1));
					l_key.add(map);
					map = new HashMap<String,String>();
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
			//conn1.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return l_key;
	}
	
	public ArrayList<Map<String, String>> getKey(int type,int page,String str){				//分页查询关键字
		l_key = new ArrayList<Map<String, String>>();
		map = new HashMap<String,String>();
		Connection conn = null;
		conn = Mysql.getConnection();
		try {
			CallableStatement cm=conn.prepareCall("{call pageSearch(?,?,?)}");
			cm.setInt(1,type);
			cm.setInt(2,page);
			cm.setString(3,str);
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
}
