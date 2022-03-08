<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<!DOCTYPE html>
<html>
		
<head>
     <link rel="stylesheet" href="jquery/jqueryui/jquery-ui.css">
     <link rel="stylesheet" href="jquery/jqueryui/jquery-ui.structure.css">
     <link rel="stylesheet" href="jquery/jqueryui/jquery-ui.theme.css">

 		
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Registration</title>
        
<style type="text/css">
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
body {
	background-image : linear-gradient(rgba(0,0,3,0.80), rgba(0,0,3,0.80)),url("images/pic5.jpg");
	background-repeat: no-repeat;
	background-size: 1366px 1156px ;
	margin: 0;
 	font-family: Arial, Helvetica, sans-serif;
}
h1{
   text-align : center;
   font-size : 30px;
   color : blue;
   font-weight : bold;
}

#uname, #pass, #dob, #age{
	width: 52%;
	height: 24px;
	padding: 5px; 
	font-size: 15px;
}  

input{
	margin-top: 3px;
	margin-bottom: 3px;
}

td{
	color: white;
	font-weight: bold;
	margin: 5px;
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
.topnav-right {
  float: right;
}
       		/* The container must be positioned relative: */
.custom-select {
  position: relative;
  font-family: Arial;
}

.custom-select select {
  display: none; /*hide original SELECT element: */
}

.select-selected {
  background-color: DodgerBlue;
}

/* Style the arrow inside the select element: */
.select-selected:after {
  position: absolute;
  content: "";
  top: 14px;
  right: 10px;
  width: 0;
  height: 0;
  border: 6px solid transparent;
  border-color: #fff transparent transparent transparent;
}

/* Point the arrow upwards when the select box is open (active): */
.select-selected.select-arrow-active:after {
  border-color: transparent transparent #fff transparent;
  top: 7px;
}

/* style the items (options), including the selected item: */
.select-items div,.select-selected {
  color: #ffffff;
  padding: 8px 16px;
  border: 1px solid transparent;
  border-color: transparent transparent rgba(0, 0, 0, 0.1) transparent;
  cursor: pointer;
}

/* Style items (options): */
.select-items {
  position: absolute;
  background-color: DodgerBlue;
  top: 100%;
  left: 0;
  right: 0;
  z-index: 99;
}

/* Hide the items when the select box is closed: */
.select-hide {
  display: none;
}

.select-items div:hover, .same-as-selected {
  background-color: rgba(0, 0, 0, 0.1);
}
/* Style the submit button */


/* Style the container for inputs */
.container {
  padding: 20px;
}

/* The message box is shown when the user clicks on the password field */
#message {
  display:none;
  background: #f1f1f1;
  color: #000;
  position: relative;
  padding: 20px;
  margin-top: 10px;
}

#message p {
  padding: 10px 20px;
  font-size: 18px;
}

/* Add a green text color and a checkmark when the requirements are right */
.valid {
  color: green;
}

.valid:before {
  position: relative;
  left: -35px;
  content: "✔";
}

/* Add a red text color and an "x" when the requirements are wrong */
.invalid {
  color: red;
}

.invalid:before {
  position: relative;
  left: -35px;
  content: "✖";
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
}
.button2:hover {background-color :  #005ce6}

.button2:active {
  background-color:  #005ce6;
  box-shadow: 0 3px #666;
  transform: translateY(4px);
}
hr{
     border-top : 3px solid blue;
}
h5{
	font-size: 18px;
	color: white;
	font-weight: bold;
	position : relative;
}

</style>
</head>
<body>
    <h1>CALORIE TRACKER</h1>
<hr>
<div class="topnav">
<a href= windows.jsp>Home</a>
<a class="active" href= reg.jsp>Sign Up</a> 
  
  <div class="topnav-right">
    <a href="about.jsp">About</a>
</div>
</div>


<div class="container">
    <center>
<form action="./RegistrationServlet" method="post">
<table  width="50%" cellpadding="5">


        <tr>
            <th colspan="2" style="color: white" >Provide your details here</th>
       </tr>

      <tbody>
          <tr>
              <td>User name</td>
              <td><input type="text" id="uname" name="uname" placeholder="Enter UserName" maxlength = "20" required/></td>
          </tr>
                 <tr>
                     <td>Password</td>
                     <td><input type="password" id="pass" name="pass" placeholder="Enter Password" required/></td>
                 </tr>

                    <tr><td></td> <td><input type="checkbox" onclick="myFunction()">Show Password<td></tr>
                 
                 <tr>
                 	<td></td>
                 	<td>
                 		<div id="message">
						  <h3>Password must contain the following:</h3>
						  <p id="letter" class="invalid">A <b>lowercase</b> letter</p>
						  <p id="capital" class="invalid">A <b>capital (uppercase)</b> letter</p>
						  <p id="number" class="invalid">A <b>number</b></p>
						  <p id="length" class="invalid">Minimum <b>8 characters</b></p>
						</div>
                 	</td>
                 </tr>
	    <tr>
	        <td>Gender</td>
	        <td rowsapn=2>
			<input type ="radio" name ="sex" id="sex" value="Male">Male<br>
			<input type = "radio" name="sex" id="sex" value="Female">Female<br>
	        </td>
	    </tr>
	      
	      <tr>
               <td>Date of Birth</td>
               <td><input placeholder="DOB in (MM/dd/yyyy) in format" type="text" id="dob" name="dob" required/></td>
           </tr>
           
           <tr>
               <td>Age</td>
               <td><input placeholder="Enter your Age" type="text" id="age" name="age" required/></td>
           </tr>
                 
             <tr>
               <td>Height</td>
               <td><input type="text" id="height" name="height" placeholder="Height in cm"  required/></td>
           </tr>
                 
             <tr>
               <td>Weight</td>
               <td><input type="text" id="weight" name="weight" placeholder="Weight in kg"  required/></td>
           </tr>
                 
       <tr>
       	<td>Activeness</td>
         <td rowsapn=4>
			<input type ="radio" name ="activeness" id="activeness" value="Sedentary">Sedentary<br>
			<input type = "radio" name="activeness" id="activeness" value="Less Active">Less Active<br>
			<input type ="radio" name ="activeness" id="activeness" value="Active">Active<br>
			<input type ="radio" name ="activeness" id="activeness" value="Very Active">Very Active<br>
			</td>
		</tr>
		
                 <tr>
                 	<td><button class="button1" type="reset">Reset</button></td>
                 	<td><button class="button2" type="submit" "onclick="verify()">Submit</button></td>
                 </tr>
                 
                 <tr>
                 <td colspan = "2"><h5>Already registered!! <a href="index.jsp">Login Here</a></h5></td>
				</tr>                    
              </tbody>
            </table>
            </form>
            </center>
            </div>

       
</body>   
<script type="text/javascript">
function myFunction() {
	   var x = document.getElementById("pass");
	   if (x.type === "password") {
	     x.type = "text";
	   } else {
	     x.type = "password";
	   }
	 }
</script>  

<script>

function verify()
{
	var user = document.getElementById("name").value;
	var pass = document.getElementById("pass").value;
	var height = document.getElementById("height").value;
	var weight = document.getElementById("weight").value;
	
	if(user.trim()===null && user.trim()==="")
	{
		documnet.getElementById("error").innerHTML="<font color=\"red\">User Name is Mandatory</font>";
		document.getElementById("name").focus();
		alert('User Name is Mandatory');
	}
	else if(pass.trim()===null && pass.trim()==="")
	{
		documnet.getElementById("error").innerHTML="<font color=\"red\">Password is Mandatory</font>";
		document.getElementById("pass").focus();
		alert('User Name is Mandatory');
	}
	else if(pass.length < 8)
	{
		documnet.getElementById("error").innerHTML="<font color=\"red\">Password must be greater than 8 characters</font>";
		document.getElementById("pass").focus();
		alert('Password must be greater than 8 characters');
	}
	else if(height.trim()===null && height.trim()==="" && typeof height !=='number')
	{
		documnet.getElementById("error").innerHTML="<font color=\"red\">Height is Mandatory</font>";
		document.getElementById("height").focus();
		alert('Height is Mandatory');
		
	}
	else if(weight.trim()===null && weight.trim()==="" && typeof weight !=='number')
	{
		documnet.getElementById("error").innerHTML="<font color=\"red\">Weight is Mandatory</font>";
		document.getElementById("weight").focus();
		alert('Weight is Mandatory');
		
	}
	if(typeof height ==='number')
	{
    	if(weight <= 50 && weight >= 250)
		documnet.getElementById("error").innerHTML="<font color=\"red\">Height value out of limit</font>";
		document.getElementById("height").focus();
		alert('Height value out of limit');
		
	}
    if(typeof weight ==='number')
	{
    	if(weight <= 30 && weight >= 600)
		documnet.getElementById("error").innerHTML="<font color=\"red\">Weight value out of limit</font>";
		document.getElementById("weight").focus();
		alert('Weight value out of limit');
		
	}
	else
	{
		response.sendRedirect("./RegistrationServlet");
	}
}
</script>
      		
<script>
var myInput = document.getElementById("pass");
var letter = document.getElementById("letter");
var capital = document.getElementById("capital");
var number = document.getElementById("number");
var length = document.getElementById("length");

// When the user clicks on the password field, show the message box
myInput.onfocus = function() {
  document.getElementById("message").style.display = "block";
}

// When the user clicks outside of the password field, hide the message box
myInput.onblur = function() {
  document.getElementById("message").style.display = "none";
}

// When the user starts to type something inside the password field
myInput.onkeyup = function() {
  // Validate lowercase letters
  var lowerCaseLetters = /[a-z]/g;
  if(myInput.value.match(lowerCaseLetters)) {  
    letter.classList.remove("invalid");
    letter.classList.add("valid");
  } else {
    letter.classList.remove("valid");
    letter.classList.add("invalid");
  }
  
  // Validate capital letters
  var upperCaseLetters = /[A-Z]/g;
  if(myInput.value.match(upperCaseLetters)) {  
    capital.classList.remove("invalid");
    capital.classList.add("valid");
  } else {
    capital.classList.remove("valid");
    capital.classList.add("invalid");
  }

  // Validate numbers
  var numbers = /[0-9]/g;
  if(myInput.value.match(numbers)) {  
    number.classList.remove("invalid");
    number.classList.add("valid");
  } else {
    number.classList.remove("valid");
    number.classList.add("invalid");
  }
  
  // Validate length
  if(myInput.value.length >= 8) {
    length.classList.remove("invalid");
    length.classList.add("valid");
  } else {
    length.classList.remove("valid");
    length.classList.add("invalid");
  }
}
</script>
  
<script src="jquery/jquery.js" type="text/javascript"></script>
<script src="jquery/jqueryui/jquery-ui.js" type="text/javascript"></script>
     
<script>
        $("#dob").datepicker({
            numberOfMonths:1, 
            showAnim: 'slideDown',
            changeYear:true,
            changeMonth:true,
            showOtherMonths: true,
            yearRange: '1950:2010',
            inline: true,

            onSelect: function() {
              var birthDay = document.getElementById("dob").value;
               var DOB = new Date(birthDay);
               var today = new Date();
               var age = today.getTime() - DOB.getTime();
               age = Math.floor(age / (1000 * 60 * 60 * 24 * 365.25));

               document.getElementById('age').value = age;
           }
        });    
        
        
        $(function() {
            $( "#height" ).spinner({
               min: 50, 
               max: 250
            });
        }); 
        
        $(function() {    
            $('#weight').spinner({ 
               min:  30, 
               max:  600
            });
        });
    </script>
   
</html>