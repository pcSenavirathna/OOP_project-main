package com.BidingSystem.Pubuth;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/SellerItemsServlet")
public class SellerItemsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//store current customer Id
		HttpSession session = request.getSession(false); // Get the session, don't create a new one if it doesn't exist
		String cusId = (String) session.getAttribute("cusId");
		
		try {
			// Retrieve a list of items associated with the seller's customer ID.
			List<item> sitems = itemDB.getItemDetails(cusId);
			
			
			//Check items are received correctly
			System.out.println("Number of items retrieved: " + sitems.size());
			
			// Set the retrieved items as an attribute in the request.
			request.setAttribute("sitems", sitems);
			
			//forward the request to the 'seller-items.jsp' page.
			RequestDispatcher dispatcher = request.getRequestDispatcher("seller-items.jsp");
	        dispatcher.forward(request, response);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
