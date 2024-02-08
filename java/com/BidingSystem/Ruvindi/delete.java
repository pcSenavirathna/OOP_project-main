package com.BidingSystem.Ruvindi;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/delete")
public class delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con;
	Statement stat;
	PreparedStatement pst;
	ResultSet rs;
	int row;
    
   
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		out.println("<h1><center>Record Delete Successfull</center><h1>");
		 String id = req.getParameter("d");
		 Integer uid = Integer.parseInt(id);
		 out.println(id);
		 out.println(uid);
		 
		 try {
			 Class.forName("com.mysql.jdbc.Driver");
			 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bidingsystem?useSSL=false","root","123456");
			Statement stat = conn.createStatement();
			stat.executeUpdate("delete from users where id='"+id+"'");
			res.sendRedirect("view_record.jsp");
		 }catch(Exception e) {
			 e.printStackTrace();
			 out.println(e.getMessage());
		 }
		
	}

}
