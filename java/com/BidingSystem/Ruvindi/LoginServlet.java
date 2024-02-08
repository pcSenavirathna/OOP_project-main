package com.BidingSystem.Ruvindi;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.BidingSystem.Pathum.Customer;



/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		try {
			HttpSession session = request.getSession();
			List<Customer> cusDetails = loginDB.validate(username,password, session);
			for (Customer customer : cusDetails) {
				System.out.println(customer.getFirstName());
				System.out.println(customer.getPhone());
			}
			request.setAttribute("cusDetails", cusDetails);
			
			RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
			dis.forward(request, response);
			
			System.out.println();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
	}

}
