package com.BidingSystem.Pathum;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/DeleteCustomerServlet")
public class DeleteCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String email = request.getParameter("delete");
		
		System.out.println("email");
		boolean isTrue;
		
		isTrue = customerDBUtil.deleteItem(email);
		
		if(isTrue == true) {
			
		RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
		dis.forward(request, response);
	}
	
	else {
		RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
		dis.forward(request, response);
	}
	
	}

}
