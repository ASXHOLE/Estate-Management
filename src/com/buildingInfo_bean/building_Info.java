package com.buildingInfo_bean;

import java.util.Vector;

import com.dao.DBCon;

public class building_Info {
	public Vector budInfo() {
		String sql = "Select * from  Building_Info";
		Vector QBI = DBCon.queryBuildingInfo(sql);
		return QBI;
	}

	public boolean delBudInfo(String bid) {
		String sql = "delete from Building_Info where Bid='" + bid + "'";
		return DBCon.UpdataData(sql);
	}

	public boolean newBudInfo(String bid, String bname, String baddr,
			String bpostcode, String bstorey, String brooms, String belevator) {
		String sql = "insert into Building_Info  (Bid,Bname,Baddr,Bpostcode,Bstorey,Brooms,Belevator)values('"
				+ bid
				+ "','"
				+ bname
				+ "','"
				+ baddr
				+ "','"
				+ bpostcode
				+ "'," + bstorey + "," + brooms + "," + belevator + ")";
		return DBCon.UpdataData(sql);
	}

	public Vector budInfo(String bname) {
		String sql = "Select * from  Building_Info where Bname like '%" + bname
				+ "%'";
		Vector QBI = DBCon.queryBuildingInfo(sql);
		return QBI;
	}

	public boolean updateBudInfo(String bid, String bname, String baddr,
			String bpostcode, String bstorey, String brooms, String belevator) {
		String sql ="UPDATE Building_Info SET [Bname]='" + bname + "',[Baddr]='"
				+ baddr + "',[Bpostcode]='" + bpostcode + "',[Bstorey]=" + bstorey
				+ ",[Brooms]=" + brooms + ",[Belevator]=" + belevator
				+ "   WHERE [Bid] ='" + bid + "'";
		System.out.println(sql);
		return DBCon.UpdataData(sql);
	}
}
