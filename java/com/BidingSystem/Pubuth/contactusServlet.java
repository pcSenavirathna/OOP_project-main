package com.BidingSystem.Pubuth;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/contactusServlet")
public class contactusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//Get parameters and assign it to variable
		String fname = request.getParameter("first_name");
		String lName = request.getParameter("last_name");
		String email = request.getParameter("Email");
		int phone = Integer.parseInt(request.getParameter("Phone"));
		String msg = request.getParameter("Message");
		
		boolean isTrue;
        
        // Call a method 'insertMsg' from the 'itemDB' class
		isTrue = itemDB.insertMsg(fname, lName, email, phone, msg);
        
        
		// If the insertion is successful, forward the request to the 'contactus.jsp' page.
		if(isTrue == true) {
        	RequestDispatcher dis = request.getRequestDispatcher("contactus.jsp");
        	dis.forward(request, response);
        }
        else {
        	RequestDispatcher dis2 = request.getRequestDispatcher("error.jsp");
        	dis2.forward(request, response);
        }
		
	}
}
