<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.test.History" %>
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
<title>Find Vechile</title>
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
<h3><b>CHECK IN</b></h3>
<form action="<%=request.getContextPath()%>/Parkinglot" method="post">
<table class = "center">
<tr>
<th>
Vechile Number
</th>
<td>  
<input type="text" name = "vno" required="required" placeholder="XXXX XXXXXX" style="text-transform:uppercase"/>
</td>
</tr>
</table>
<br>
<input type="hidden" name="choice" value="find">
<input class="button" type="submit" value="FIND">
</form>
<table style="width:100%" class="center">
<tr>
<td>
<h5><b>PARKING HISTORY</b></h5>
</td>
<td>
<h5><b>IN PARKING</b></h5>
</td>
</tr>
<tr>
<td>
<c:if test="${avail eq 'no'}">
<p style="color:red"><b>*No Parking history available</b></p><br>
</c:if>
<c:if test="${avail eq 'yes'}">
<table style="border: 1px solid black; border-collapse: collapse;" class="center">
<tr style="border: 1px solid black; border-collapse: collapse;">
<th style="border: 1px solid black; border-collapse: collapse;">floor</th>
<th style="border: 1px solid black; border-collapse: collapse;">checkin time</th>
<th style="border: 1px solid black; border-collapse: collapse;">checkout time</th>
</tr>
<c:forEach var="his" items="${data}">
<tr style="border: 1px solid black; border-collapse: collapse;">
<td style="border: 1px solid black; border-collapse: collapse;">${his.floor}</td>
<td style="border: 1px solid black; border-collapse: collapse;">${his.intime}</td>
<td style="border: 1px solid black; border-collapse: collapse;">${his.outtime}</td>
</tr>
</c:forEach>
</table>
</c:if>
</td>
<td>
<p style="color:${color}"><b>${sucess}</b></p><br>
</td>
</tr>
</table>
</body>
</html>