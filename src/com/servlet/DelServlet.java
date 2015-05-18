package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DBCon;

public class DelServlet extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String ownerId = request.getParameter("houseId"); 
		String sql= "delete from addFee where ownerId= '"+ownerId+"'"; 
		DBCon db = new DBCon();  
        try {
			db.del(sql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
	}

}
