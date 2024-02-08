package com.BidingSystem.prasad;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.BidingSystem.DBConnect;

public class BidServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			String itemIdParam = request.getParameter("itemId");
			int itemId = Integer.parseInt(itemIdParam);
			double bidAmount = Double.parseDouble(request.getParameter("bidAmount"));

			Connection con = DBConnect.getConnection();
			String updateQuery = "UPDATE iteminf SET startBid = ? WHERE item_id = ?";
			PreparedStatement pstmt = con.prepareStatement(updateQuery);
			pstmt.setDouble(1, bidAmount);
			pstmt.setInt(2, itemId);
			
						
			
			int updateRow = pstmt.executeUpdate();

			if (updateRow > 0) {
				String successScript = "<script>alert('Bid updated successfully.'); window.location.href='index.jsp';</script>";
                response.getWriter().write(successScript);
			} else {
				response.getWriter().write("Failed to update bid.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().write("Error: " + e.getMessage());
		}
	}
}
