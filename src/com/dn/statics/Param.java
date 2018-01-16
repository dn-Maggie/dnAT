package com.dn.statics;

import com.dn.member.memberCenter;

public class Param {
	public static String path;
	public static memberCenter user;
	public static boolean status=false;
	
	//设置静态对象。
	public Param(){
		path = property.readRcErpURL("CasesPath");
		//System.out.println(path);
		user = new memberCenter();
	}
	
}
