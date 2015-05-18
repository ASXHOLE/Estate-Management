package com.Log_bean;

public class Log {
	private String account;
	private String password;
	
	public Log(){}
	public void setAccount(String account) {
		this.account = account;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAccount(){
		return this.account;
	}
	public String getPassword(){
		return this.password;
	}
}
