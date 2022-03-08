<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
<style>

::placeholder { /* Chrome, Firefox, Opera, Safari 10.1+ */
  color: blue;
  opacity: 1; /* Firefox */
}

:-ms-input-placeholder { /* Internet Explorer 10-11 */
  color: blue;
}

::-ms-input-placeholder { /* Microsoft Edge */
  color: blue;
}

#uname, #pass{
	width: 55%;
	height: 25px;
	padding: 10px; 
	font-size: 15px;
	margin: 10px;
} 
/* Style all input fields */
body {
	background-image : linear-gradient(rgba(0,0,3,0.80), rgba(0,0,3,0.80)),url("images/pic2.jpg");
	background-repeat: no-repeat;
	background-size: 1366px 768px ;
	margin: 0;	
 	font-family: Arial, Helvetica, sans-serif;
}
td{
	color: white;
	font-weight: bold;
	font-size:20px;
}
.topnav {
  overflow: hidden;
  background-color: #111;
}
h1{
   text-align : center;
   font-size : 30px;
   color : blue;
   font-weight : bold;
}
.topnav a {
  float: left;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}
.topnav-right {
  float: right;
}

.button1{
  padding: 10px 20px;
  font-size: 20px;
  text-align: center;
  cursor: pointer;
  outline: none;
  color: #fff;
  background-color:red ;
  border: none;
  position : relative;
  border-radius: 15px;
  box-shadow: 0 6px #999;
	margin: 15px;
}

.button1:hover {background-color :  #ff5050}

.button1:active {
  background-color:  #005ce6;
  box-shadow: 0 3px #666;
  transform: translateY(4px);
}

.button2 {
  padding: 10px 20px;
  font-size: 20px;
  text-align: center;
  cursor: pointer;
  outline: none;
  color: #fff;
  background-color:blue ;
  border: none;
  position : relative;
  border-radius: 15px;
  box-shadow: 0 6px #999;
	margin: 15px;
}
.button2:hover {background-color :  #005ce6}

.button2:active {
  background-color:  #005ce6;
  box-shadow: 0 3px #666;
  transform: translateY(4px);
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}
hr{
     border-top : 3px solid blue;
}
.topnav a.active {
  background-color: #1a75ff;
  color: white;
}
</style>
 <script>


</script>
    <body>
    <h1>CALORIE TRACKER</h1>
	<hr>
    <div class="topnav">
    <a href= windows.jsp>Home</a>
	<a class="active" href= index.jsp>Log In</a>
   	
  	<div class="topnav-right">
    <a href="about.jsp">About</a>
</div>
 	</div>

<div>
    <center>
     
<form action="./LoginServlet" method="post">
            <table width="50%" cellpadding="5">
                <thead>
                    <tr>
                        <th style="color: white; font-size:20px;" colspan="2">Login Here</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>User Name</td>
                        <td><input type="text" id="uname" name="uname" placeholder="Enter User Name" /></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" id="pass" name="pass" placeholder="Enter Password"/></td>
                    </tr>
                    <tr><td></td> <td><input type="checkbox" onclick="myFunction()">Show Password<td></tr>
                 
                    <tr>
                        <td><button class="button1" type="reset">Reset</button></td>
                        <td><button class="button2" type="submit" onclick="verify()">Submit</button></td>
                    </tr>
                    <tr>
                        <td colspan="2"> Not Yet Registered!! <a href="reg.jsp">Register Here</a></td>
                    </tr>
                </tbody>
            </table>   
</center>
</form>
</div>
</body>       

<script>
function myFunction() {
	   var x = document.getElementById("pass");
	   if (x.type === "password") {
	     x.type = "text";
	   } else {
	     x.type = "password";
	   }
	 }
</script>

<script src="jquery/jquery.js" type="text/javascript"></script>
 <script type="text/javascript">
 
 $("#button2").click({
        var user = document.getElementById("name").value;
		var pass = document.getElementById("pass").value;
		
		if(user.trim()===null && user.trim()==="")
		{
			documnet.getElementById("error").innerHTML="<font color=\"red\">User Name is Mandatory</font>";
			document.getElementById("name").focus();
		}
		else if(pass.trim()===null && pass.trim()==="")
		{
			documnet.getElementById("error").innerHTML="<font color=\"red\">Password is Mandatory</font>";
			document.getElementById("pwd").focus();
		}
		else
		{
			response.sendRedirect("./LoginServlet");
		}
 
 });
</script>

</html>