<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
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
  margin: 50px 2px;
  cursor: pointer;
  border-radius:25px;
}
</style>
<title>ParkingLotHome</title>
</head>
<body style="background-color:#fff8dc; text-align:center;">
<h2><b>PARKING LOT</b>
</h2>
<br>
WELCOME TO PARKING
<br>
<pre>Total no.of floors           Total capcity of all floor:10</pre>
<br>
<table class="center">
<tr>
    <th>Type of vechile</th>
    <th>Cost/Hour</th>
  </tr>
  <tr>
    <td>CAR</td>
    <td>50/hr</td>
  </tr>
  <tr>
    <td>BIKE</td>
    <td>10/hr</td>
  </tr>
</table>
<a href="<%=request.getContextPath()%>/Parkinglot?page=Choicetype" class = "button">PROCEED</a>
</body>
</html>