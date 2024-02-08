package com.BidingSystem.Pathum;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/userUpdateServlet")
public class userUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false); // Get the session, don't create a new one if it doesn't exist
		String cusId = (String) session.getAttribute("cusId");
		int id = Integer.parseInt(cusId);
		    

		
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String contact = request.getParameter("contact");
		
		
		
			
		//validate email
		String email = request.getParameter("email");
			if(email.indexOf('@') == -1) {
				request.setAttribute("showAlert", "invalid Email");
				RequestDispatcher dispatcher = request.getRequestDispatcher("userUpdate.jsp");
				dispatcher.forward(request, response);
			}
			
			boolean isTrue;
			
			isTrue = customerDBUtil.updateCustomer(firstName, lastName, email, contact, id);
			
			

			
				if(isTrue == true) {
						List<Customer> cusDetails = customerDBUtil.returnAll(id);
				request.setAttribute("cusDetails", cusDetails);
					
					RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
					dis.forward(request, response);
				}
				
				else {
					RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
					dis.forward(request, response);
				}
}
}
