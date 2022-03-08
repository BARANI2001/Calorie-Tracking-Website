<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>About</title>
<style type="text/css">

h1{
   text-align : center;
   font-size : 30px;
   color : blue;
   font-weight : bold;
   background-color: black;'
}

.topnav-right {
  float: right;
}
.topnav {
  overflow: hidden;
  background-color: #333;
}

.topnav a {
  float: left;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}

.topnav a.active {
  background-color: #1a75ff;
  color: white;
}

body{
 	  background-image : linear-gradient(rgba(0,0,3,0.80),rgba(0,0,3,0.80)),url("images/pic4.jpg");
      background-repeat : no-repeat;
      background-size : 1366px 768px;
      font-family: Arial, Helvetica, sans-serif;
      color: white;
}
</style>

</head>
<body>
<h1>CALORIE TRACKER</h1>
<hr>

<div class="topnav">
  <a href= windows.jsp>Home</a>
  <a href=AddMeal.jsp>Add Food</a>
  <a href=TrackRecords.jsp>Track Records</a>
  <div class="topnav-right">
    <a class="active" href="about.jsp">About</a>
	</div>
</div>

<h3>NEED OF THIS WEBSITE</h3>
	<ol>
	<li>We aren't taking food as per requirement of our body, which leads to Nutrition Disorder, Obesity, etc.</li> 
	<li>We either intake food in excessive amount or inadequate amount.</li>
	<li>Most of us doesn't have knowledge in amount of calories we intake daily.</li>
	<li>As solution to these problems we give you a Calorie Tracking Website.</li>
	</ol>


<div>
<h3>Daily Calorie target is calculated using <strong>Harris-Benedict equation</strong></h3>
<p>Keep in mind that people are unique and their physiology will vary. This is just an estimate. However, it provides a good beginning for understanding your calorie needs</p>
</div>

<div>
<ul>
<li>Men  BMR = 66.5 + ( 13.75 x weight in kg ) + ( 5.003 x height in cm ) - ( 6.755 x age in years )<br></li>
<li>Women  BMR = 655.1 + ( 9.563 x weight in kg ) + ( 1.850 x height in cm ) - ( 4.676 x age in years )</li>
</ul>
</div>

<div>
<ol>
<li> Sedentary: Minimum of movement, much time spent TV watching, reading, etc. Activity factor = 1.4</li>
<li> Light activity: Office work, ~1 hour of moderate exercise/activity during the day. Activity factor = 1.5</li>
<li> Moderate activity: Light physical/manual labor during the day, plus more active lifestyle. Activity factor = 1.6</li>
<li> Very Active: Active military, full time athlete, hard physical/manual labor job. Activity factor = 1.9</li>
</ol>
</div>

</body>
</html>