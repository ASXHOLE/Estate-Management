package com.payfee_bean;

public class feesInfo {
	private String payId;
	private String ownerId;
	private String ownerName;	
	private String payType;
	private double lastMonthInfo;
	private double thisMonthInfo;
	private double unitPrice;
	private double monthPay;
	
	public feesInfo(){
		
	}

	public feesInfo(String payId,String ownerId,String ownerName, String payType, double lastMonthInfo,
			double thisMonthInfo, double unitPrice, double monthPay){
		this.payId = payId;
		this.ownerId = ownerId;
		this.ownerName = ownerName;	
		this.payType = payType;
		this.lastMonthInfo = lastMonthInfo;
		this.thisMonthInfo = thisMonthInfo;
		this.unitPrice = unitPrice;
		this.monthPay = monthPay;
	}
	
	public String getPayId() {
		return payId;
	}

	public void setPayId(String payId) {
		this.payId = payId;
	}

	public String getOwnerName() {
		return ownerName;
	}
	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}
	public String getOwnerId() {
		return ownerId;
	}
	public void setOwnerId(String ownerId) {
		this.ownerId = ownerId;
	}
	public String getPayType() {
		return payType;
	}
	public void setPayType(String payType) {
		this.payType = payType;
	}
	public double getLastMonthInfo() {
		return lastMonthInfo;
	}
	public void setLastMonthInfo(double lastMonthInfo) {
		this.lastMonthInfo = lastMonthInfo;
	}
	public double getThisMonthInfo() {
		return thisMonthInfo;
	}
	public void setThisMonthInfo(double thisMonthInfo) {
		this.thisMonthInfo = thisMonthInfo;
	}
	public double getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
	}
	public double getMonthPay() {
		return monthPay;
	}
	public void setMonthPay(double monthPay) {
		this.monthPay = monthPay;
	}
	
	
}
