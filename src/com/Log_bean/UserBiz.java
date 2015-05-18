package com.Log_bean;

import java.util.Vector;

import com.dao.DBCon;

public class UserBiz {
	String DB_username;
	String DB_password;
	String DB_role;
	
	public String getDB_role() {
		return DB_role;
	}

	public boolean login(String username,String password){
		String sql=new String();
		
		sql="select username,password,role from LoginName where username='"+username+"'";
		Vector CBI = DBCon.queryLoginInfo(sql);
		int index = 0;
		try {
			if (CBI.size() > 0) {
	
			Vector cbi = (Vector) CBI.get(index);
					DB_username=cbi.get(0).toString();
					DB_password=cbi.get(1).toString();
					DB_role=cbi.get(2).toString();
					
		}else{
			//返回查不到数据
			return false;
		}
		} catch (ArrayIndexOutOfBoundsException ex) {
			return false;
		}
		
		if(DB_username.equals(username)&&DB_password.equals(password)){
			
			return true;
		}
		else return false;
	}

	
}
