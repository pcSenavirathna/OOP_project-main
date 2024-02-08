package com.BidingSystem.Pubuth;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.BidingSystem.DBConnect;

public class itemDB {
	//Declare global variable
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	//Method for the insert item data to the database
	public static boolean insertItem(String name, String Des, String Type, double bid, String endDate, String cond, double price, String path, String cId ) {
		boolean success = false;
		
		try {
			//create connection
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			//insert sql query for the item insert
			String sql = "insert into iteminf values (0,'"+name+"','"+Des+"','"+Type+"','"+bid+"','"+endDate+"','"+cond+"','"+price+"','"+path+"', '"+cId+"')";
			int rs = stmt.executeUpdate(sql);
			
			//check item inserted correvctly
			if(rs > 0 ) {
				success = true;
			}
			else {
				success = false;
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		
		//return boolean value as the result
		return success;
	}
	
	//Method for get item details in database
	public static List<item> getItemDetails(String Id){
		
		//create new array list for store the item details
		List<item> items = new ArrayList<>();
		
		try {
			//create connection
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			//SQL query for get the item data
			String query = "SELECT * FROM iteminf WHERE cusId = '"+Id+"'";
            rs = stmt.executeQuery(query);

            // Retrieve items from the result set and add them to the list
            while (rs.next()) {
                    int id = rs.getInt(1);
                    String name = rs.getString(2);
                    String desc = rs.getString(3);
                    String type = rs.getString(4);
                    double sprice = rs.getDouble(5);
                    String date = rs.getString(6);
                    String cond = rs.getString(7);
                    double rePr = rs.getDouble(8);
                    String pat = rs.getString(9);
                    String c = rs.getString(10);
                    
                    item itm = new item(id, name, desc, type, sprice, date, cond, rePr, pat, c);
                items.add(itm);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
		//return item details
		return items;
	}
	
	//Method for update item data in the database
	public static boolean updateItem(String name, String Des, String Type, double bid, String endDate, String cond, double price, String path, int Id) {
		boolean isSuccess = false;
		
		try {
			//Create connection
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			//SQL query for the update item in the database
			String sql = "UPDATE iteminf SET itemName='"+name+"',itemDescript='"+Des+"',itemType='"+Type+"',startBid="+bid+",endDate='"+endDate+"', itemCondition='"+cond+"',rePrice="+price+",image='"+path+"' WHERE item_id="+Id+"";
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
		//pass boolean value about result
		return isSuccess;
	}
	
	//Method for the delete item in the database
	public static boolean deleteItem(int Id) {
		boolean success = false;
		
		try {
			//create connection
			con = DBConnect.getConnection();
			//SQL query for the delete item
			stmt = con.createStatement();
			String sql = "DELETE from iteminf where item_id="+Id+"";
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0 ) {
				success = true;
			}
			else {
				success = false;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		//return boolean value if it success
		return success;
	}
	//Method for the add customer message to the database
	public static boolean insertMsg(String fname, String lname, String mail, int phone, String mesg ) {
		boolean success = false;
		
		try {
			//Create connection
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			//SQL query for the insert message data in the database
			String sql = "insert into message values (0,'"+fname+"','"+lname+"','"+mail+"',"+phone+",'"+mesg+"')";
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0 ) {
				success = true;
			}
			else {
				success = false;
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		//return boolean value if insert message data successfully
		return success;
	}
}