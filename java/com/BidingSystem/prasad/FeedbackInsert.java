package com.BidingSystem.prasad;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/FeedbackInsert")
public class FeedbackInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String name = request.getParameter("name");
	    String email = request.getParameter("email");
	    String feedbackText = request.getParameter("feedback");
	    
	    HttpSession session = request.getSession(false); // Get the session, don't create a new one if it doesn't exist
		String cusId = (String) session.getAttribute("cusId");
		
		int id = Integer.parseInt(cusId);

	    boolean isInserted = feedbackDBUtil.insetfeedback(id,name, email, feedbackText);

	    if (isInserted) {
	        List<Feedback> feedbackList = feedbackDBUtil.getFeedbackList();
	        request.setAttribute("feedbackList", feedbackList);

	        RequestDispatcher dis = request.getRequestDispatcher("feedback.jsp");
	        dis.forward(request, response);
	    } 
	}

	


}
