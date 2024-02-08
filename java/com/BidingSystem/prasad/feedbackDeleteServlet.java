package com.BidingSystem.prasad;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.BidingSystem.DBConnect;

@WebServlet("/feedbackDeleteServlet")
public class feedbackDeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Get the feedback ID 
            int feedbackId = Integer.parseInt(request.getParameter("id"));

            // Connect  database.
            Connection connection = DBConnect.getConnection();
            
            // Create a SQL DELETE quary
            String sql = "DELETE FROM feedback WHERE id = ?";
            
            // execute the DELETE statement.
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, feedbackId);

            // Execute the DELETE statement.
            int rowsDeleted = preparedStatement.executeUpdate();

            if (rowsDeleted > 0) {
                // Feedback deleted successfully.
                response.sendRedirect("feedback_view.jsp");
            } else {
                // Handle the case where no rows were deleted.
                response.getWriter().println("Feedback not found or couldn't be deleted.");
            }

            preparedStatement.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
