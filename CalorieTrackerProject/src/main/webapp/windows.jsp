<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="errorPage.jsp"%>%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome</title>
</head>
 

<style>
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
 	  background-image : linear-gradient(rgba(0,0,3,0.70),rgba(0,0,3,0.70)),url("images/pic1.jpg");
      background-repeat : no-repeat;
      background-size : 1366px 768px;
      font-family: Arial, Helvetica, sans-serif;
}
 
h1{
   text-align : center;
   font-size : 30px;
   color : blue;
   font-weight : bold;
}
h2{
   text-align : center;
   font-size : 30px;
   color : white;
   font-weight : bold;
}
h3{
     font-size : 20px;
     color :  white;
     text-align : center;
     position : absolute;
     top : 40%;
     left : 60%;
     transform : translateX(-50%) translate(-50%);
     word-spacing: 10px;
}
.button1{
  padding: 10px 20px;
  font-size: 24px;
  text-align: center;
  cursor: pointer;
  outline: none;
  color: #fff;
  background-color:#1a75ff ;
  border: none;
  position : absolute;
  top : 64%;
  left : 40%;
  border-radius: 15px;
  box-shadow: 0 6px #999;
}

.button1:hover {background-color :  #005ce6}

.button1:active {
  background-color:  #005ce6;
  box-shadow: 0 3px #666;
  transform: translateY(4px);
}
.button2 {
  padding: 10px 20px;
  font-size: 24px;
  text-align: center;
  cursor: pointer;
  outline: none;
  color: #fff;
  background-color:#1a75ff ;
  border: none;
  position : absolute;
  top : 64%;
  left : 53%;
  border-radius: 15px;
  box-shadow: 0 6px #999;
}

.button2:hover {background-color :  #005ce6}

.button2:active {
  background-color:  #005ce6;
  box-shadow: 0 3px #666;
  transform: translateY(4px);
}

hr
{
     border-top : 3px solid blue;
}
p{
     font-size : 20px;
     color : #ffffff;
     text-align : left;
     position : absolute;
     top : 85%;
     left : 10%;
}
</style>

<body>

<h1>CALORIE TRACKER</h1>
<hr>

<div class="topnav">
  <a class="active" href= welcome.jsp>Home</a>
  
  <div class="topnav-right">
    <a href="about.jsp">About</a>
</div>
</div>

<h2>Welcome Calorie Tracking website</h2>
<h3>ADD YOUR FOOD<br>
    TRACK YOUR PROGRESS<br>
    ACHIEVE YOUR TARGET<br>
</h3>
<a href = reg.jsp><button class = "button1"><span></span>Sign Up</button></a>
<a href = index.jsp><button class = "button2"><span></span>Log In</button></a>

<p>
	<marquee direction = "left">
	The website shows you how many calories you should eat in order to maintain your correct weight for your body. Be honest and give correct details when doing registration.<br>
	</marquee>
</p>
</body>
</html>