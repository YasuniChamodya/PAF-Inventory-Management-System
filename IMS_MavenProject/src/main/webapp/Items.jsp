<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="com.Item"%>
<%-- Reading user inputs using request.getParameter("<form element name>") and
 set values to a session using setAttribute("<session name>", "<value>") --%>
<%
// Insert item
if (request.getParameter("itemCode") != null) {

	// For Testing the connect method
	Item itemObj = new Item();
	itemObj.connect();

	String stsMsg = itemObj.insertItem(request.getParameter("itemCode"), request.getParameter("itemName"),
	request.getParameter("itemPrice"), request.getParameter("itemDesc"));
	session.setAttribute("statusMsg", stsMsg);

	// session.setAttribute("s_itemCode", request.getParameter("itemCode"));
	// session.setAttribute("s_itemName", request.getParameter("itemName"));
	// session.setAttribute("s_itemPrice", request.getParameter("itemPrice"));
	// session.setAttribute("s_itemDesc", request.getParameter("itemDesc"));
}

// Delete item
if (request.getParameter("itemID") != null) {
	Item itemObj = new Item();
	String stsMsg = itemObj.deleteItem(request.getParameter("itemID"));
	session.setAttribute("statusMsg", stsMsg);
}
%>

<!DOCTYPE html>
<html>
<head>
	<!-- Char set meta tag -->
	<meta charset="utf-8">
	
	<!-- Head code meta tag -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link rel="stylesheet" href="Views/bootstrap.min.css">
	<script src="js/jquery-3.6.0.min.js" type="text/javascript"></script>
	
	<!-- Import validation.js  -->
	<script src="js/validation.js" type="text/javascript"></script>

<title>Items Management</title>
</head>
<body>

	<h1 class="text-center">Items Management</h1><hr>

	<div class="container">
		<div class="row">
			<div class="col-sm-4">

				<form method="post" action="Items.jsp" class="form-horizontal">
					<div class="form-group row">
						<label for="itemCode" class="col-sm-2 col-form-label">Item Code:</label>
						<div class="col-sm-10">
							<input name="itemCode" type="text" class="form-control" placeholder="Enter Item Code here"><br>
						</div>
					</div>
					<div class="form-group row">
						<label for="itemName" class="col-sm-2 col-form-label">Item Name:</label>
						<div class="col-sm-10">
							<input name="itemName" type="text" class="form-control" placeholder="Enter Item name here"><br>
						</div>
					</div>	
					<div class="form-group row">
						<label for="itemPrice" class="col-sm-2 col-form-label">Item Price:</label>
						<div class="col-sm-10">
							<input name="itemPrice" type="text" class="form-control"><br>
						</div>
					</div>
					<div class="form-group row">
						<label for="itemDesc" class="col-sm-2 col-form-label">Item Description: </label>
						<div class="col-sm-10">
							<input name="itemDesc" type="text" class="form-control"><br>
						</div>
					</div>		
					<input name="btnSubmit" type="submit" value="Save" class = "btn btn-primary">
				</form>
				<br>
				<div class="alert alert-success">
					<% out.print(session.getAttribute("statusMsg")); %>
				</div>
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
						<td>
							<% out.print(session.getAttribute("s_itemCode")); %>
						</td>
						<td>
							<% out.print(session.getAttribute("s_itemName")); %>
						</td>
						<td>
							<% out.print(session.getAttribute("s_itemPrice")); %>
						</td>
						<td>
							<% out.print(session.getAttribute("s_itemDesc")); %>
						</td>
						<td><input name="btnUpdate" type="button" value="Update"></td>
						<td><input name="btnRemove" type="button" value="Remove"></td>
					</tr>
				</table>
				--%>

			</div>
			<div class="col-sm-1">
			</div>
			<div class="col-sm-7">
				<%
				Item itemObj = new Item();
				out.print(itemObj.readItems());
				%>
			</div>
		</div>
	</div>

</body>
</html>