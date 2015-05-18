package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DBCon;
import com.payfee_bean.feesInfo;

public class feesServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		
		
		System.out.println("test");
		String payId =request.getParameter("payId");
		String ownerId = request.getParameter("ownerId");
		String ownerName = request.getParameter("ownerName");
		ownerName=new String(ownerName.getBytes("GB2312"));
		String payType = request.getParameter("payType");
		payType=new String(payType.getBytes("GB2312"));
		double lastMonthInfo = Double.valueOf(request.getParameter("lastMonthInfo")).doubleValue();
		double thisMonthInfo = Double.valueOf(request.getParameter("thisMonthInfo")).doubleValue();
		double unitPrice = Double.valueOf(request.getParameter("unitPrice")).doubleValue();
		double monthPay =Double.valueOf(request.getParameter("monthPay")).doubleValue();
	
		feesInfo fees = new feesInfo();
		fees.setPayId(payId);
		fees.setOwnerId(ownerId);
		fees.setOwnerName(ownerName);
		fees.setPayType(payType);
		fees.setLastMonthInfo(lastMonthInfo);
		fees.setThisMonthInfo(thisMonthInfo);
		fees.setUnitPrice(unitPrice);
		fees.setMonthPay(monthPay);
		
		DBCon dbcon = new DBCon();
		dbcon.setFeesInfo(fees);
		if(dbcon.inAddFee()){
			//HttpSession session=request.getSession();
			//保存当前信息
			ArrayList<feesInfo>  list = new ArrayList<feesInfo>();
			list = dbcon.getDBinfo();
			System.out.println(list.size());
			request.getSession().setAttribute("list", list);
			//返回到成功页面
			response.sendRedirect("./payFee/ShowInfos.jsp");
		}else{
			response.sendRedirect("./payFee/addFee.jsp");
		}
		
	}
}
