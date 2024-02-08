package com.BidingSystem.Pubuth;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/deleteItemServlet")
public class deleteItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Get the 'itId' parameter from the request
		int id = Integer.parseInt(request.getParameter("itId"));
		
		boolean isTrue;
		
		// Call a method 'deleteItem' from the 'itemDB' class
		isTrue = itemDB.deleteItem(id);
		
		// Create a request dispatcher to forward the request to 'reBtn.jsp'
		if(isTrue == true) {
			RequestDispatcher dis = request.getRequestDispatcher("reBtn.jsp");
			dis.forward(request, response);
		}
	}

}
