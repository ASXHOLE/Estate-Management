package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.People_Bean.People;


public class VisitServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public VisitServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		String role=request.getSession().getAttribute("role").toString();
		request.getSession().setAttribute("role", role);
		String name= request.getParameter("name");
		String id= request.getParameter("id");
		String date= request.getParameter("date");
		People pl=new People();
		Boolean is=pl.insert(name, id, date);
		if(is){
			request.getRequestDispatcher("/Visitor/success.jsp").forward(request, response);
		}else{
			response.sendRedirect("/Visitor/defeat.jsp");
		}
		
		String method = request.getParameter("method");
		if (method != null && "back".equals(method)) {
			request.getRequestDispatcher("/Visitor/visit.jsp");
		} else if (method != null && "index".equals(method)) {

		}
		
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
