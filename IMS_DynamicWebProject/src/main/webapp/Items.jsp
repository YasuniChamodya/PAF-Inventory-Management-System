<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import = "com.Item" %>
<%-- Reading user inputs using request.getParameter("<form element name>") and
 set values to a session using setAttribute("<session name>", "<value>") --%>
<%
	// Insert item
	if(request.getParameter("itemCode") != null){
		
		// For Testing the connect method
		Item itemObj = new Item();
		itemObj.connect();
		
		String stsMsg = itemObj.insertItem(request.getParameter("itemCode"), request.getParameter("itemName"), request.getParameter("itemPrice"), request.getParameter("itemDesc"));
		session.setAttribute("statusMsg",stsMsg);
		
		// session.setAttribute("s_itemCode", request.getParameter("itemCode"));
		// session.setAttribute("s_itemName", request.getParameter("itemName"));
		// session.setAttribute("s_itemPrice", request.getParameter("itemPrice"));
		// session.setAttribute("s_itemDesc", request.getParameter("itemDesc"));
	}
  
	// Delete item
	if (request.getParameter("itemID") != null){
		Item itemObj = new Item();
		String stsMsg = itemObj.deleteItem(request.getParameter("itemID"));
		session.setAttribute("statusMsg", stsMsg);
	}
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Items Management</title>
</head>
<body>

	<h1>Items Management</h1>
	<form method="post" action="Items.jsp">
		Item Code: <input name="itemCode" type="text"><br>
		Item Name: <input name="itemName" type="text"><br>
		Item Price: <input name="itemPrice" type="text"><br>
		Item Description: <input name="itemDesc" type="text"><br>
		<input name="btnSubmit" type="submit" value="Save">
	</form>
	<br>
		<% out.print(session.getAttribute("statusMsg")); %>
	<br>
	
	<%-- 
	<table border="1">
		<tr>
			<th>Item Code</th>
			<th>Item Name</th>
			<th>Item Price</th>
			<th>Item Description</th>
			<th>Update</th>
			<th>Remove</th>
		</tr>	
		<tr>
			<td>1234</td>
			<td>Table</td>
			<td>10,000</td>
			<td>Mahogany</td>
			<td><input name="btnUpdate" type="button" value="Update"></td>
			<td><input name="btnRemove" type="button" value="Remove"></td>
		</tr>
		<tr>
			<!-- Read values from a session using session.getAttribute("<session name") -->
			<td><% out.print(session.getAttribute("s_itemCode")); %></td>
			<td><% out.print(session.getAttribute("s_itemName")); %></td>
			<td><% out.print(session.getAttribute("s_itemPrice")); %></td>
			<td><% out.print(session.getAttribute("s_itemDesc")); %></td>
			<td><input name="btnUpdate" type="button" value="Update"></td>
			<td><input name="btnRemove" type="button" value="Remove"></td>
		</tr>
	</table>
	--%>
	
	<% 
		Item itemObj = new Item();
		out.print(itemObj.readItems());
	%>	
	
</body>
</html>