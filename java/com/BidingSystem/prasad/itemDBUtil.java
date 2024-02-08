package com.BidingSystem.prasad;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.BidingSystem.DBConnect;

public class itemDBUtil {
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	public static List<Pitem> getItemDetails(){
		ArrayList<Pitem> itm  = new ArrayList<>();
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "Select * from iteminf order by item_id DESC";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String descript = rs.getString(3);
				String type = rs.getString(4);
				double stbid = rs.getDouble(5);
				String enddate = rs.getString(6);
				String condition = rs.getString(7);
				double reprice = rs.getDouble(8);
				String img = rs.getString(9);
				int cusid = rs.getInt(10);
				
				Pitem i = new Pitem(id,name,descript,type,stbid,enddate,condition,reprice,img,cusid);
				itm.add(i);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return itm;
	}
	
	public static List<Pitem> getItemDetail(int id){
		
		
		ArrayList<Pitem> itm = new ArrayList<Pitem>();
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "Select * from iteminf where item_id="+id+"";
			rs  = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int itmId = rs.getInt(1);
				String name = rs.getString(2);
				String descript = rs.getString(3);
				String type = rs.getString(4);
				double stbid = rs.getDouble(5);
				String enddate = rs.getString(6);
				String condition = rs.getString(7);
				double reprice = rs.getDouble(8);
				String img = rs.getString(9);
				int cusid = rs.getInt(10);
				
				Pitem  i = new Pitem(itmId,name,descript,type,stbid,enddate,condition,reprice,img,cusid);
				itm.add(i);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return itm;
	}
	
	
}
