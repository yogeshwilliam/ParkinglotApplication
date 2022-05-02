<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style>
.button {
  background-color: #000000; /* Green */
  border: none;
  color: white;
  padding: 15px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 20px 2px;
  cursor: pointer;
  border-radius:12px;
}
</style>
<title>Choice</title>
</head>
<body style="background-color:#fff8dc;">
<div style="text-align:center;">
<h2><b>PARKING LOT</b>
</h2>
<a href="<%=request.getContextPath()%>/Parkinglot?page=Checkin" class = "button">CHECK IN</a>
<br>
<a href="<%=request.getContextPath()%>/Parkinglot?page=Checkout" class = "button">CHECK OUT</a>
<br>
<a href="<%=request.getContextPath()%>/Parkinglot?page=Find" class = "button">FIND VECHILE</a>
<br>
<a href="<%=request.getContextPath()%>/Parkinglot?page=Lots" class = "button">SHOW LOTS</a>
</div>
</body>
</html>