package com.BidingSystem.Ruvindi;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateRecord")
public class UpdateRecord extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<h1><center>Registration Sucessfully</center><h1>");

		String id = request.getParameter("UID");
		String funame = request.getParameter("Uname");
		String uemail = request.getParameter("UEmail");
		String umobile = request.getParameter("UMobile");

		Connection con;
		PreparedStatement pst;
		ResultSet rs;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bidingsystem?useSSL=false", "root", "123456");
			pst = con.prepareStatement("update users set funame=?, uemail=?, umobile=? where id=?");
			pst.setString(1, funame);
			pst.setString(2, uemail);
			pst.setString(3, umobile);
			pst.setString(4, id);
			pst.executeUpdate();
			response.sendRedirect("view_record.jsp");

		} catch (Exception e) {
			e.printStackTrace();
			out.println(e.getMessage());
		}
	}

}
