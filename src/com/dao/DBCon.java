package com.dao;

import java.sql.*;
import java.util.*;

import com.payfee_bean.*;

public class DBCon {
	public static Connection JavaCon() {
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String url = "jdbc:sqlserver://ADMIN-PC:1433;DatabaseName=EM_DB";
			Connection conn = DriverManager.getConnection(url, "sa", "123");
			return conn;
		} catch (ClassNotFoundException ex1) {
			ex1.printStackTrace();
			return null;
		} catch (SQLException ex2) {
			ex2.printStackTrace();
			return null;
		}
	}

	public static boolean UpdataData(String sql) {
		Connection conn = JavaCon();
		try {

			Statement stmt = conn.createStatement();
			int rs = stmt.executeUpdate(sql);
			stmt.close();
			conn.close();
			if (rs > 0)
				return true;
			else
				return false;
		} catch (SQLException ex) {
			ex.printStackTrace();
			return false;
		}
	}

	public static boolean CreateTable(String sql) {
		Connection conn = JavaCon();
		try {

			Statement stmt = conn.createStatement();
			int rs = stmt.executeUpdate(sql);
			stmt.close();
			conn.close();
			return true;
		} catch (SQLException ex) {
			ex.printStackTrace();
			return false;
		}
	}

	public static int BackupDB(String sql) {
		Connection conn = JavaCon();
		try {

			Statement stmt = conn.createStatement();
			int rs = stmt.executeUpdate(sql);
			stmt.close();
			conn.close();
			if (rs > 0)
				return 0;
			else
				return 1;
		} catch (SQLException ex) {
			ex.printStackTrace();
			return -1;
		}
	}

	public static int RestoreDB(String sql) {
		Connection conn = JavaCon();
		try {

			Statement stmt = conn.createStatement();
			int rs = stmt.executeUpdate(sql);
			stmt.close();
			conn.close();
			if (rs > 0)
				return 0;
			else
				return 1;
		} catch (SQLException ex) {
			ex.printStackTrace();
			return -1;
		}
	}
	
	public static Vector queryVisit(String sql) {
		Connection conn = JavaCon();
		Vector data = new Vector();
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Vector line = new Vector();
				for (int i = 1; i <5; i++) {
					line.add(rs.getObject(i));
				}
				data.add(line);
			}
			rs.close();
			stmt.close();
			conn.close();
			return data;

		} catch (SQLException ex) {
			ex.printStackTrace();
			return null;
		}
	}

	public static Vector queryStatistics(String sql) {
		Connection conn = JavaCon();
		Vector data = new Vector();
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Vector line = new Vector();
				for (int i = 1; i <= 5; i++) {
					line.add(rs.getObject(i));
				}
				data.add(line);
			}
			rs.close();
			stmt.close();
			conn.close();
			return data;

		} catch (SQLException ex) {
			ex.printStackTrace();
			return null;
		}
	}

	public static Vector queryBuildingInfo(String sql) {
		Connection conn = JavaCon();
		Vector data = new Vector();
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Vector line = new Vector();
				for (int i = 1; i < 9; i++) {
					line.add(rs.getObject(i));
				}
				data.add(line);
			}
			rs.close();
			stmt.close();
			conn.close();
			return data;

		} catch (SQLException ex) {
			ex.printStackTrace();
			return null;
		}
	}
	
	public static Vector queryLoginInfo(String sql) {		//登录用
		Connection conn = JavaCon();
		Vector data = new Vector();
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Vector line = new Vector();
				for (int i = 1; i < 4; i++) {
					line.add(rs.getObject(i));
				}
				data.add(line);
			}
			rs.close();
			stmt.close();
			conn.close();
			return data;

		} catch (SQLException ex) {
			ex.printStackTrace();
			return null;
		}
	}

	public static Vector queryBlacklist(String sql) {
		Connection conn = JavaCon();
		Vector data = new Vector();
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Vector line = new Vector();
				for (int i = 1; i < 4; i++) {
					line.add(rs.getObject(i));
				}
				data.add(line);
			}
			rs.close();
			stmt.close();
			conn.close();
			return data;

		} catch (SQLException ex) {
			ex.printStackTrace();
			return null;
		}
	}

	public static Vector queryData(String sql, int lines) {
		Connection conn = JavaCon();
		Vector data = new Vector();
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Vector line = new Vector();
				for (int i = 1; i <= lines; i++) {
					line.add(rs.getObject(i));
				}
				data.add(line);
			}
			rs.close();
			stmt.close();
			conn.close();
			return data;
		} catch (SQLException ex) {
			ex.printStackTrace();
			return null;
		}
	}
	////////////////////////////////////////////////////////////////////////////////////////////////
	private feesInfo fees;
	public feesInfo getFeesInfo() {
		return fees;
	}

	public void setFeesInfo(feesInfo fees) {
		this.fees = fees;
	}
	public boolean inAddFee(){
		String sql="insert into addFee values(?,?,?,?,?,?,?,?)";
		try{
			Connection con=JavaCon();
			PreparedStatement pstmt=con.prepareStatement(sql);
			pstmt.setString(1,fees.getPayId());
			pstmt.setString(2,fees.getOwnerId());
			pstmt.setString(3,fees.getOwnerName());
			pstmt.setString(4,fees.getPayType());
			pstmt.setDouble(5,fees.getLastMonthInfo());
			pstmt.setDouble(6,fees.getThisMonthInfo());
			pstmt.setDouble(7,fees.getUnitPrice());
			pstmt.setDouble(8,fees.getMonthPay());
			pstmt.executeUpdate(); //写入数据库
			System.out.println("写入数据库成功！");
			pstmt.close();
			con.close();
			return true;
		}catch(SQLException ex){
			ex.printStackTrace();
			return false;
		}	
	}
	
	public ArrayList<feesInfo> getDBinfo(){
		ArrayList<feesInfo>  list = new ArrayList<feesInfo>();
		String sql= "select * from addFee"; 
		try {
			Connection con=JavaCon();
			Statement stmt = con.createStatement();
			ResultSet rs=stmt.executeQuery(sql);
			System.out.println("test2");
			while(rs.next()){
				feesInfo fi = new feesInfo();
				fi.setPayId(rs.getString(1));
				fi.setOwnerId(rs.getString(2));
				fi.setOwnerName(rs.getString(3));				
				fi.setPayType(rs.getString(4));
				fi.setLastMonthInfo(rs.getDouble(5));
				fi.setThisMonthInfo(rs.getDouble(6));
				fi.setUnitPrice(rs.getDouble(7));
				fi.setMonthPay(rs.getDouble(8));
				list.add(fi);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return list;	
	}
	
	
	public  ArrayList<feesInfo> getFee(String ownerId){
		ArrayList<feesInfo>  list2 = new ArrayList<feesInfo>();
		String sql2= "select * from addFee where ownerId= '"+ownerId+"'"; 
		try {
			Connection con=JavaCon();
			Statement stmt = con.createStatement();
			ResultSet rs=stmt.executeQuery(sql2);
			System.out.println("test");
			feesInfo fi = new feesInfo();	
			while(rs.next()){
				fi.setPayId(rs.getString(1));
				fi.setOwnerId(rs.getString(2));
				fi.setOwnerName(rs.getString(3));				
				fi.setPayType(rs.getString(4));
				fi.setLastMonthInfo(rs.getDouble(5));
				fi.setThisMonthInfo(rs.getDouble(6));
				fi.setUnitPrice(rs.getDouble(7));
				fi.setMonthPay(rs.getDouble(8));
				String sql="insert into Fee values(?,?,?,?,?,?,?,?)";
				try{
				
					PreparedStatement pstmt=con.prepareStatement(sql);
					pstmt.setString(1,fi.getPayId());
					pstmt.setString(2,fi.getOwnerId());
					pstmt.setString(3,fi.getOwnerName());
					pstmt.setString(4,fi.getPayType());
					pstmt.setDouble(5,fi.getLastMonthInfo());
					pstmt.setDouble(6,fi.getThisMonthInfo());
					pstmt.setDouble(7,fi.getUnitPrice());
					pstmt.setDouble(8,fi.getMonthPay());
					pstmt.executeUpdate(); //写入数据库
					System.out.println("写入数据库成功！");
					pstmt.close();
					con.close();
				
				}catch(SQLException ex){
					ex.printStackTrace();
				}	
				list2.add(fi);
				System.out.println("test3");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return list2;
		
	}


	public void del(String sql) throws Exception {
		// TODO Auto-generated method stub
		try {  
			Connection con=JavaCon();
			PreparedStatement stmt=con.prepareStatement(sql);
            int rows = stmt.executeUpdate();  
            if(rows >= 1){  
                System.out.println("成功删除.....");  
            } else {  
                System.out.println("删除失败.....");  
            }  
        } catch (Exception e) {  
            System.out.println("statement取得错误");  
            System.out.println(e.getMessage());  
        }   
	}

}
