package com;

import java.sql.*;
//import java.sql.Connection;
//import java.sql.DriverManager;

public class Item {
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}
	
	public Connection connect() {
		Connection con = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/paf_ims","root","NhYc@#98");
			
			// For Testing
			System.out.println("Database Connected Successfully");
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	
	public String insertItem(String code, String name, String price, String desc) {
		String output = "";
		
		try {
			Connection con = connect();
			if (con == null) {
				return "Error while connecting to the database";
			}
			
			// Create a prepared statement
			String query = "insert into items (`itemID`,`itemCode`,`itemName`,`itemPrice`,`itemDesc`) values (?,?,?,?,?)";
			
			PreparedStatement preparedStmt = con.prepareStatement(query);
			
			// Binding Values
			preparedStmt.setInt(1, 0);
			preparedStmt.setString(2, code);
			preparedStmt.setString(3, name);
			preparedStmt.setDouble(4, Double.parseDouble(price));
			preparedStmt.setString(5, desc);
			
			// Execute the statement
			preparedStmt.execute();
			con.close();
			
			output = "Inserted successfully";
			
		} catch (Exception e){
			output = "Error while inserting";
			System.err.println(e.getMessage());
		}
		
		return output;
	}

	public String readItems() {
		String output = "";
		
		try {
			Connection con = connect();
			if (con == null) {
				return "Error while connecting to the database";
			}
			
			// Prepare the HTML table to be displayed
			output = "<table border = \"1\">"
					+ "<tr><th>Item Code</th><th>Item Name</th><th>Item Price</th><th>Item Description</th>"
					+ "<th>Update</th><th>Remove</th></tr>";
			
			String query = "select * from items";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			
			// Iterate through the rows in the result set
			while (rs.next()) {
				String rs_itemID = Integer.toString(rs.getInt("itemID"));
				String rs_itemCode = rs.getString("itemCode");
				String rs_itemName = rs.getString("itemName");
				String rs_itemPrice = Double.toString(rs.getDouble("itemPrice"));
				String rs_itemDesc = rs.getString("itemDesc");
				
				// System.out.println(rs_itemCode);
				// System.out.println(rs_itemName);
				// System.out.println(rs_itemPrice);
				// System.out.println(rs_itemDesc);
				
				// Add into the HTML table
				output += "<tr><td>"+rs_itemCode+"</td>";
				output += "<td>"+rs_itemName+"</td>";
				output += "<td>"+rs_itemPrice+"</td>";
				output += "<td>"+rs_itemDesc+"</td>";
				
				// Add buttons 
				output += "<td><input name=\"btnUpdate\" type=\"button\" value=\"Update\"></td>\r\n"
						+ "<td><form method=\"post\" action=\"Items.jsp\">"
						+ "<input name=\"btnRemove\" type=\"submit\" value=\"Remove\">"
						+ "<input name=\"itemID\" type=\"hidden\" value=\""+rs_itemID+"\">"
						+ "</form></td></tr>";
			}
			
			con.close();
			
			// Complete the HTML table
			output += "</table>";
			
		} catch (Exception e) {
			output = "Error while reading the items";
			System.err.println(e.getMessage());
		}
		
		return output;
	}
	
	public String deleteItem (String itemID) {
		
		String output = "";
		
		try {
			Connection con = connect();
			if (con == null) {
				return "Error while connecting to the database for deleting";
			}
			
			// Creating a prepared statement
			String query = "delete from items where itemID=?";
			
			PreparedStatement preparedStmt = con.prepareStatement(query);
			// Binding values
			preparedStmt.setInt(1, Integer.parseInt(itemID));
			
			// Execute the statement
			preparedStmt.execute();
			con.close();
			
			output = "Deleted successfully";
			
		} catch (Exception e) {
			output = "Error while deleting the item";
			System.err.println(e.getMessage());
		}
		
		return output;
	}
	
}
