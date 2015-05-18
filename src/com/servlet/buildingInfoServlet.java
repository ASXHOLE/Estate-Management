package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.buildingInfo_bean.building_Info;

public class buildingInfoServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public buildingInfoServlet() {
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
		String id = request.getParameter("id");
		if (id != null) {
			// out.println(id);
			building_Info del = new building_Info();
			if (del.delBudInfo(id)) {
				request.getRequestDispatcher("buildingInfoMan/delSuccessed.jsp")
						.forward(request, response);

			} else {
				request.getRequestDispatcher("buildingInfoMan/delFailed.jsp")
						.forward(request, response);
			}
		}

		String method = request.getParameter("method");
		if (method != null && method.equals("back")) {
			response.sendRedirect("buildingInfoMan/budInfoMan.jsp");

		}else if(method != null && method.equals("newbuilding")){
			response.sendRedirect("buildingInfoMan/Newbuilding.jsp");
		
		
		}else if(method != null && method.equals("query")){
			response.sendRedirect("buildingInfoMan/queryCondition.jsp");
		
		
		}else if(method != null && method.equals("querycondition")){
			String condition=request.getParameter("bname");
			request.setAttribute("condition", condition);
			request.getRequestDispatcher("buildingInfoMan/queryBuildingInfo.jsp").forward(request, response);
			
		
		}else if(method != null && method.equals("updatebuilding")){
			//request.setAttribute("condition", condition);
			//request.getRequestDispatcher("buildingInfoMan/queryBuildingInfo.jsp").forward(request, response);
			String bid=request.getParameter("bid");
			String bname=request.getParameter("bname");
			String baddr=request.getParameter("baddr");
			String bpostcode=request.getParameter("bpostcode");
			String bstorey=request.getParameter("bstorey");
			String brooms = request.getParameter("brooms");
			String belevator = request.getParameter("belevator");
			building_Info updateb = new building_Info();
			/*System.out.println("UPDATE Building_Info SET [Bname]='" + bname + "',[Baddr]='"
					+ baddr + "',[Bpostcode]='" + bpostcode + "',[Bstorey]=" + bstorey
					+ ",[Brooms]=" + brooms + ",[Belevator]=" + belevator
					+ "   WHERE [Bid] ='" + bid + "'");*/
			if (updateb.updateBudInfo(bid, bname, baddr, bpostcode, bstorey, brooms,
					belevator)) {
				response.sendRedirect("buildingInfoMan/budInfoMan.jsp");

			} else {
				request.getRequestDispatcher("buildingInfoMan/newFailed.jsp")
						.forward(request, response);
			}

			
			
			
			
		
		}else if (method != null && method.equals("new")) {
			String bid = request.getParameter("bid");
			String bname = request.getParameter("bname");
			String baddr = request.getParameter("baddr");
			String bpostcode = request.getParameter("bpostcode");
			String bstorey = request.getParameter("bstorey");
			String brooms = request.getParameter("brooms");
			String belevator = request.getParameter("belevator");
			building_Info newb = new building_Info();
			if (newb.newBudInfo(bid, bname, baddr, bpostcode, bstorey, brooms,
					belevator)) {

				request.getRequestDispatcher("buildingInfoMan/newSuccessed.jsp")
						.forward(request, response);

			} else {
				request.getRequestDispatcher("buildingInfoMan/newFailed.jsp")
						.forward(request, response);
			}

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

		/*
		 * response.setContentType("text/html"); PrintWriter out =
		 * response.getWriter(); out.println(
		 * "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		 * out.println("<HTML>");
		 * out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		 * out.println("  <BODY>"); out.print("    This is ");
		 * out.print(this.getClass()); out.println(", using the POST method");
		 * out.println("  </BODY>"); out.println("</HTML>"); out.flush();
		 * out.close();
		 */
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
