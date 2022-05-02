<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
  background-color: #000000;
  border: none;
  color: white;
  padding: 10px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 2px 0px;
  cursor: pointer;
  border-radius:12px;
}
</style>
<title>Check in</title>
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
<h4><b>CHECK IN</b></h4>
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
<tr>
<th>
Vechile Type
</th>
<td>  
<input type="radio" name="vtype" value="Car" required="required">&nbsp;&nbsp;Car&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="vtype" value="Bike">&nbsp;&nbsp;Bike
</td>
</tr>
<tr>
<th>
Enter Lot
</th>
<td>  
<input type="text" name = "lot" required="required" style="text-transform:uppercase"/>
</td>
</tr>
<tr>
<th>
Check in Time
</th>
<td>  
<input type ="time" name = "intime" min="00:00" max="24:00" required="required" style="text-transform:uppercase" placeholder="24 Hours(00:00)"/>
</td>
</tr>
</table>
<br>
<input type="hidden" name="choice" value="checkin">
<input class="button" type="submit" value="CHECK IN">
</form>
<p style="color:${color}"><b>${sucess}</b></p>
</body>
</html>