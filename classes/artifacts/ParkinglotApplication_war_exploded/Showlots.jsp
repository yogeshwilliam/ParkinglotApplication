<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%boolean[][] arr = (boolean[][])request.getAttribute("array");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style>
th, td {
  padding-top: 10px;
  padding-bottom: 20px;
  padding-left: 30px;
  padding-right: 40px;
}
table.center {
  margin-left: auto; 
  margin-right: auto;
}
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
<title>Show lots</title>
</head>
<body style="background-color:#fff8dc; text-align:center">
<table style="width:100%">
<tr>
<th style="text-align:left; widht:10%">
<a href="<%=request.getContextPath() %>/Parkinglot?page=Choicetype" class="button">Home</a>
</th>
<th style="width:100%">
<h2><b>PARKING LOT</b></h2>
</th>
</tr>
</table>
<h4><b>SHOW LOTS</b></h4><br>
<p><b>Total no of floors:<%= arr.length %></b></p>
<table class="center" style="border: 1px solid black; border-collapse: collapse;">
<tr style="border: 1px solid black; border-collapse: collapse;">
<th style="border: 1px solid black; border-collapse: collapse;">FLOOR</th>
<th style="border: 1px solid black; border-collapse: collapse;">CAPACITY</th>
<th style="border: 1px solid black; border-collapse: collapse;">NO OF VECHICLE</th>
<th style="border: 1px solid black; border-collapse: collapse;">AVALIABILITY</th>
</tr>
<% for(int i=0;i<arr.length;i++)
	
{ 
 int count = 0; %>
 <% for(int j=0;j<arr[i].length;j++)
{ 
	 
	if(arr[i][j]){
		count++;
	} 
	
} %>
<tr style="border: 1px solid black; border-collapse: collapse;">
<td style="border: 1px solid black; border-collapse: collapse;"><%=(char)('A'+i) %></td>
<td style="border: 1px solid black; border-collapse: collapse;"><%=arr[0].length %></td>
<td style="border: 1px solid black; border-collapse: collapse;"><%=count %></td>
<td style="border: 1px solid black; border-collapse: collapse;"><%=arr[0].length-count %></td>
</tr>

<% } %>
</table>
</body>
</html>