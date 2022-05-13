<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>

<!-- Char set meta tag -->
<meta charset="utf-8">

<!-- Head code meta tag -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="js/jquery-3.6.0.min.js" type="text/javascript"></script>

</head>
<body>


<div class="container">
 <h2>Inline form</h2>
 <form class="form-inline" action="">
 <div class="form-group">
 <label for="email">Email:</label>
 <input type="email" class="form-control"
id="email" placeholder="Enter email" name="email">
 </div>
 <div class="form-group">
 <label for="pwd">Password:</label>
 <input type="password" class="form-control"
id="pwd" placeholder="Enter password"
name="pwd">
 </div>
 <div class="checkbox">
 <label><input type="checkbox"
name="remember"> Remember me</label>
 </div>
 <button type="submit" class="btn btndefault">Submit</button>
 </form>
</div>
<hr>


<div class="container">
 <h2>Horizontal form</h2>
 <form class="form-horizontal" action="">
 <div class="form-group">
 <label class="control-label col-sm-2"
for="email">Email:</label>
 <div class="col-sm-10">
 <input type="email" class="form-control"
id="email" placeholder="Enter email" name="email">
 </div>
 </div>
 <div class="form-group">
 <label class="control-label col-sm-2"
for="pwd">Password:</label>
 <div class="col-sm-10">
 <input type="password" class="form-control"
id="pwd" placeholder="Enter password"
name="pwd">
 </div>
 </div>
 <div class="form-group">
 <div class="col-sm-offset-2 col-sm-10">
 <div class="checkbox">
 <label><input type="checkbox"
name="remember"> Remember me</label>
 </div>
 </div>
 </div>
 <div class="form-group">
 <div class="col-sm-offset-2 col-sm-10">
 <button type="submit" class="btn btndefault">Submit</button>
 </div>
 </div>
 </form>
</div>
<hr>

</body>
</html>