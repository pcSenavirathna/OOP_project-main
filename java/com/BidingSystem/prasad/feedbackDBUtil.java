package com.BidingSystem.prasad;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.BidingSystem.DBConnect;

public class feedbackDBUtil {
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;

	public static boolean insetfeedback(int uid,String name, String email, String feedback) {
		boolean isSuccess = false;

		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "insert into feedback values ("+uid+",'" + name + "','" + email + "','" + feedback + "')";
			int rs = stmt.executeUpdate(sql);

			if (rs > 0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return isSuccess;
	}

	public static List<Feedback> getFeedbackList() {
	    List<Feedback> feedbackList = new ArrayList<>();

	    try {
	        con = DBConnect.getConnection();
	        stmt = con.createStatement();
	        String sql = "SELECT * FROM feedback ";
	        rs = stmt.executeQuery(sql);

	        while (rs.next()) {
	        	int id = rs.getInt(1);
	            String name = rs.getString(2);
	            String email = rs.getString(3);
	            String feedbackText = rs.getString(4);
	            
	            Feedback feedback = new Feedback(id,name, email, feedbackText);
	            feedbackList.add(feedback);
	           
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return feedbackList;
	}


	

}
