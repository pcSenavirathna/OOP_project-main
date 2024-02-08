package com.BidingSystem.Pathum;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.BidingSystem.DBConnect;

public class customerDBUtil {
	
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	
	
	public static boolean insertOrderDetails(String name ,int phone, String address, String city, String state, int zipcode, String cardnum, String cardname, String month, String year, int cvv) {
		
		boolean isSuccess = false;
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "insert into cus_address values (0, '" + name + "', '" + phone + "', '" + address + "', '" + city + "', '" + state + "', '" + zipcode + "')";
			String sql2 = "insert into carddetails values (0, '" + cardnum + "', '" + cardname + "', '" + month + "', '"+ year +"' ,'" + cvv + "')";
			int rs = stmt.executeUpdate(sql); 
			int rs1 = stmt.executeUpdate(sql2); 

			
			
			if(rs > 0 && rs1 > 0) {
				isSuccess = true;
			}
			else {
				isSuccess = false;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return isSuccess;
	}
	
	public static boolean updateCustomer(String firstName, String lastName, String email, String phone, int cusId)
	{
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "update users set funame = '"+firstName+"',luname = '"+lastName+"', uemail = '"+email+"', umobile = '"+phone+"' where id = "+cusId+"";
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) {
				isSuccess = true;
			}
			else {
				isSuccess = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return isSuccess;
	}
	
	
	
	
	
public static List<Customer> returnAll(int cusid){
		
		ArrayList<Customer> cus = new ArrayList<Customer>();
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql ="select * from users where id = " +cusid+""; 
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
	  		    int id = rs.getInt(1);
				String firstname = rs.getString(2);
			    String lastname = rs.getString(3);
				String passU =rs.getString(4);
				String uemail = rs.getString(5);
				String umobile = rs.getString(6);
				

				Customer c = new Customer(id,firstname,lastname,passU,uemail,umobile);
				cus.add(c);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cus;
	}

public static boolean deleteItem(String email2) {
	
	try {
		//create connection
		con = DBConnect.getConnection();
		//SQL query for the delete item
		stmt = con.createStatement();
		String sql = "DELETE from users where uemail='"+email2+"'";
		int rs = stmt.executeUpdate(sql);
		
		if(rs > 0 ) {
			isSuccess = true;
		}
		else {
			isSuccess = false;
		}
	}
	catch(Exception e) {
		e.printStackTrace();
	}
	//return boolean value if it success
	return isSuccess;
}
	
	
}
