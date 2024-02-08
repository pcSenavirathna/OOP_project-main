package com.BidingSystem.Ruvindi;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.BidingSystem.DBConnect;
import com.BidingSystem.Pathum.Customer;

public class loginDB {
	
	private static boolean isSuccess ;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	
	
	public static List<Customer> validate(String username, String password, HttpSession session){
		
		ArrayList<Customer> cus = new ArrayList<Customer>();
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql ="select * from users where funame = '" +username+"' and upwd = '"+password+"'"; 
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
	  		    int id = rs.getInt(1);
				String firstname = rs.getString(2);
			    String lastname = rs.getString(3);
				String passU =rs.getString(4);
				String uemail = rs.getString(5);
				String umobile = rs.getString(6);
				
				session.setAttribute("name", rs.getString("funame"));
		        session.setAttribute("cusId", rs.getString("id"));
		        session.setAttribute("email", rs.getString("uemail"));
		        session.setAttribute("lname", rs.getString("luname"));
		        session.setAttribute("mobile", rs.getString("umobile"));				
				
				

				Customer c = new Customer(id,firstname,lastname,passU,uemail,umobile);
				cus.add(c);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cus;
	}
}
	