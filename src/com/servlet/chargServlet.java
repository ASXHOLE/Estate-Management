package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.dao.DBCon;
import com.payfee_bean.feesInfo;

public class chargServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		feesInfo fees = new feesInfo();
		String ownerId = request.getParameter("houseId");
		fees.setOwnerId(ownerId);
    	//fees.setPayType(payType);
		DBCon dbcon = new DBCon();
		//dbcon.setFeesInfo(fees);
		
			//HttpSession session=request.getSession();;	
			request.getSession().setAttribute("list",dbcon.getFee(ownerId));
	        response.sendRedirect("./payFee/charg2.jsp");
	        String sql3= "delete from addFee where ownerId= '"+ownerId+"'"; 
	        try {
				dbcon.del(sql3);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		//}else{
		//	response.sendRedirect("/charg.jsp");
		//}
		
	 } 
}
