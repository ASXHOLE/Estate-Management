package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class mainServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public mainServlet() {
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
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String method = request.getParameter("method");
		if (method != null && method.equals("building")) {
			String role=request.getSession().getAttribute("role").toString();
			request.getSession().setAttribute("role", role);
			response.sendRedirect("buildingInfoMan/budInfoMan.jsp");
					//.forward(request, response);
		} else if (method != null && method.equals("visitor")) {
			String role=request.getSession().getAttribute("role").toString();
			request.getSession().setAttribute("role", role);
			response.sendRedirect("Visitor/visit.jsp");
					//.forward(request, response);
		}else if (method != null && method.equals("blacklist")) {
			String role=request.getSession().getAttribute("role").toString();
			request.getSession().setAttribute("role", role);
			response.sendRedirect("BlackList/BlackList.jsp");
					//.forward(request, response);
		}else if (method != null && method.equals("fee")) {
			String role=request.getSession().getAttribute("role").toString();
			request.getSession().setAttribute("role", role);
			response.sendRedirect("payFee/fee.jsp");
					//.forward(request, response);
		}else if (method != null && method.equals("logout")) {
			request.getSession().invalidate();
			response.sendRedirect("Login/Log.jsp");
					//.forward(request, response);
		}

	}

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		 this.doGet(request, response);
	}

	/**
	 * Initialization of the servlet. <br>
	 * 
	 * @throws ServletException
	 *             if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
