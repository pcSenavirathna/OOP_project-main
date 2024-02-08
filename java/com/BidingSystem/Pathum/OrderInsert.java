package com.BidingSystem.Pathum;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/OrderInsert")
public class OrderInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//catch shipping address
		String name = request.getParameter("name");
		String phoneS = request.getParameter("phone");
		int phone = Integer.parseInt(phoneS);
		
		//validate phone number
		if(phoneS.length() < 10) {
			
			request.setAttribute("showAlert", "invalid phone numberX");
			RequestDispatcher dispatcher = request.getRequestDispatcher("order.jsp");
			dispatcher.forward(request, response);
		}
		else {
			
			request.setAttribute("payment", "Payment Successfull X");
			RequestDispatcher dispatcher = request.getRequestDispatcher("order.jsp");
			dispatcher.forward(request, response);
			
			
			//	request.setAttribute("error", "invalid phone number");
				//RequestDispatcher rd = request.getRequestDispatcher("order.jsp");
			    //rd.include(request, response);
			}
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String state =request.getParameter("state");
		int zipcode = Integer.parseInt(request.getParameter("zipcode"));
		
		
		//catch payment method
		String cardnum = request.getParameter("cardnum");
		String cardname = request.getParameter("cardname");
		String month = request.getParameter("month");
		String year = request.getParameter("year");
		int cvv = Integer.parseInt(request.getParameter("cvv"));
		
		boolean isTrue;
		isTrue = customerDBUtil.insertOrderDetails(name, phone, address, city, state, zipcode, cardnum, cardname, month, year, cvv);
		
		if(isTrue == true) {
			RequestDispatcher dis = request.getRequestDispatcher("order.jsp");
			dis.forward(request, response);
		}
		else {
			RequestDispatcher dis2 = request.getRequestDispatcher("unsuccess.jsp");
			dis2.forward(request, response);
		}
	}

}
