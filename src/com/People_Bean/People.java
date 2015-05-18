package com.People_Bean;

import java.util.Vector;

import com.dao.DBCon;

public class People {
	private String name;
	private String id;
	private String date;
	public People(){}
	public void setName(String name){
		this.name=name;
	}
	public void setID(String id){
		this.id=id;
		
	}
	public void setDate(String date){
		this.date=date;
	}
	public String getName(){
		return name;
	}
	public String getID(){
		return id;
	}
	public String getDate(){
		return date;
	}
	public boolean insert(String name,String id,String date ){
		String sql="insert into Visitor (name,id,date) values('"+name+"','"+id+"','"+date+"')";
		if(DBCon.UpdataData(sql)){
			return true;
		}else{
			return false;
		}
		}
    public Vector list(){
    	String sql="select * from Visitor";
    	Vector v1=DBCon.queryVisit(sql);
    	return v1;
    }
    public Vector Blist(){
    	String sql="select * from Blacklist";
    	Vector v1=DBCon.queryBlacklist(sql);
    	return v1;
    }
    public boolean insertBL(String name,String id){
    	String sql="insert into Blacklist (name,id) values('"+name+"','"+id+"')";
    	if(DBCon.UpdataData(sql)){
    		return true;
    	}else{
    		return false;
    	}
    }
	}


