<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="java.io.*, java.util.Date, java.text.*, java.math.*, java.sql.*"  %>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">    
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>    
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> 
     <link rel="stylesheet" href="jquery/jqueryui/jquery-ui.css">
     <link rel="stylesheet" href="jquery/jqueryui/jquery-ui.structure.css">
     <link rel="stylesheet" href="jquery/jqueryui/jquery-ui.theme.css">


<title>Add Meal</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="js/autocomplete.js" type="text/javascript"></script>
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

body {
    background-image : linear-gradient(rgba(0,0,3,0.85),rgba(0,0,3,0.85)),url("images/pic3.jpg");
    background-repeat : no-repeat;
    background-size : 1378px 1000px;
    font-family: Arial, Helvetica, sans-serif;
    color: white;
}

* {box-sizing: border-box;}


#table1 .th1{
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #1a75ff;
  color: white;
  text-align: center;
}
#table1 td, #table1 th{
	border: 1px solid white;
	padding: 8px;
}
table {
  border-collapse: collapse;
  border-spacing: 0;
  width: 99%;
  text-align: center;
  border: 1px solid white;
}

input{
	margin-top: 3px;
	margin-bottom: 3px;
}

#table1, #table2{
	margin: 5px;
	border: 3px;
	padding: 10px;
}
.topnav {
  overflow: hidden;
  background-color: #333;
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


.form-inline {  
  display: flex;
  flex-flow: row wrap;
  align-items: center;
}

.form-inline label {
  margin: 5px 10px 5px 0;
}

.form-inline input {
  vertical-align: middle;
  margin: 5px 10px 5px 0;
  padding: 10px;
  background-color: #fff;
  border: 1px solid #ddd;
  color: black;
}

.form-inline button {
  padding: 10px 20px;
  background-color: #1a75ff;
  border: 1px solid #ddd;
  color: white;
  cursor: pointer;
}

.form-inline button:hover {
  background-color: royalblue;
}

@media (max-width: 800px) {
  .form-inline input {
    margin: 10px 0;
  }
  
  .form-inline {
    flex-direction: column;
    align-items: stretch;
  }
}
/*the container must be positioned relative:*/
.autocomplete {
  position: relative;
  display: inline-block;
}

.autocomplete-items {
  position: absolute;
  border: 1px solid #d4d4d4;
  border-bottom: none;
  border-top: none;
  z-index: 99;
  /*position the autocomplete items to be the same width as the container:*/
  top: 100%;
  left: 0;
  right: 0;
  color: black;
}

.autocomplete-items div {
  padding: 10px;
  cursor: pointer;
  background-color: #fff; 
  border-bottom: 1px solid #d4d4d4; 
  color: black;
}

/*when hovering an item:*/
.autocomplete-items div:hover {
  background-color: royalblue; 
  color: black;
}

/*when navigating through the items using the arrow keys:*/
.autocomplete-active {
  background-color: DodgerBlue !important; 
  color: #ffffff; 
}


</style>
</head>     
<body>
<h1>CALORIE TRACKER</h1>
<hr>

<div class="topnav">
  <a href= windows.jsp>Home</a>
  <a class="active" href=AddMeal.jsp>Add & Track</a>  
  <a href= TrackRecords.jsp>Track Records</a>
  <div class="topnav-right">
    <a href="logout.jsp">Logout</a>
    <a href="about.jsp">About</a>
</div>
</div>

<%
	Date objDate1 = new Date();
	SimpleDateFormat ft1 = new SimpleDateFormat("dd/MM/yyyy");
	String strToday= ft1.format(objDate1);
	
	String strName = "";
	int iTarget = 0;
	
	if(session.getAttribute("uname") != null && (int)session.getAttribute("target") != 0)
	{
	strName = (String) session.getAttribute("uname");
	iTarget = (int) session.getAttribute("target");
%>
<div>
	<h3> <%=strName%> your daily target calorie is <%=iTarget%> </h3>
	<h3 class="topnav-right">Today (<%=strToday%>)</h3>
</div>
<%
	}
	else
	{
	response.sendRedirect("index.jsp");
	}
%>

<!--Make sure the form has the autocomplete function switched off:-->
<form autocomplete="off" class="form-inline" action="./UserCalorieServlet" method="post">
  <div class="autocomplete">
  <label for="food">Enter Food :</label>
  <input type="text" id="food" placeholder="Food" name="food" required>
  <label for="Quantity">Enter Quantity in grams or millilitres :</label>
  <input type="text" id="quantity" placeholder="Quantity in gm / ml" name="quantity" required>
  </div>
  <button type="submit">Submit</button>
</form>

<div>

	
<sql:setDataSource var="db" driver="org.postgresql.Driver" url="jdbc:postgresql://localhost:5432/postgres" user="postgres" password="postgres"/>

<sql:query var="rs" dataSource="${db}">SELECT "Time", "Food", "Category", "Quantity", "Calorie" FROM "Java"."UserCalorie" WHERE "UserName"=? AND "Date"=?
<sql:param value="<%=strName%>" />  
<sql:param value="<%=strToday%>" />
</sql:query>

<table id=table1>
<tr>
     <th class="th1">Time</th>
     <th class="th1">Food</th>
     <th class="th1">Category</th>
     <th class="th1">Quantity(gm/ml)</th>
     <th class="th1">Calories</th>
</tr>
<c:forEach items="${rs.rows}" var="User">
<tr>
<td><c:out value="${User.Time}"></c:out></td>
<td><c:out value="${User.Food}"></c:out></td>
<td><c:out value="${User.Category}"></c:out></td>
<td><c:out value="${User.Quantity}"></c:out></td>
<td><c:out value="${User.Calorie}"></c:out></td>
</tr>
</c:forEach>
</table>
</div>

<div>

<sql:query var="count" dataSource="${db}">SELECT COUNT("Food") FROM "Java"."UserCalorie" WHERE "UserName"=? AND "Date"=?
<sql:param value="<%=strName%>" />  
<sql:param value="<%=strToday%>" />
</sql:query>

<sql:query var="sum" dataSource="${db}">SELECT SUM("Calorie") FROM "Java"."UserCalorie" WHERE "UserName"=? AND "Date"=?
<sql:param value="<%=strName%>" />  
<sql:param value="<%=strToday%>" />
</sql:query>
<table id="table2">
<tfoot>
<c:forEach items="${count.rows}" var="length">
<c:forEach items="${sum.rows}" var="total">
<tr>
<td><h4> <c:out value="No. of Meal Added Today = ${length.count}"></c:out></h4></td>
<td><h4 id="totCal"><c:out value="No. of Calorie consumed today = ${total.sum}"></c:out></h4></td>
</tr>
</c:forEach>
</c:forEach>
</tfoot>
</table>
</div>


<%
Class.forName("org.postgresql.Driver");
Connection objConn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres","postgres");
PreparedStatement objStmt = null;
ResultSet objRes = null;
BigDecimal bigTotal;
int iTotal;

DecimalFormat df = new DecimalFormat("#.00");
try{

String strQuery = "SELECT SUM(\"Calorie\") FROM \"Java\".\"UserCalorie\" WHERE \"UserName\"=? AND \"Date\"=?";
objStmt = objConn.prepareStatement(strQuery);
objStmt.setString(1,strName);
objStmt.setString(2,strToday);
objRes =  objStmt.executeQuery();


if(objRes.next())
{
bigTotal = objRes.getBigDecimal(1);
iTotal = bigTotal.intValue();
iTotal *= 100;
double dAvg = (int)(iTotal/iTarget) ;
dAvg = Double.valueOf(df.format(dAvg));
%>

<script src="jquery/jquery.js" type="text/javascript"></script>
<script src="jquery/jqueryui/jquery-ui.js" type="text/javascript"></script>

<script>
$(document).ready(function(){    
  var progressBarVal = <%=dAvg%>;    
  var html="<div class='progress-bar progress-bar-striped active' role='progressbar' aria-valuenow="+progressBarVal+" aria-valuemin='0.0 aria-valuemax='100.0' style='width:"+progressBarVal+"%'>"+progressBarVal+"%</div>";    
  $(".progress").append(html);  
  $("#progHead").append(progressBarVal+ "%")
  
  if(progressBarVal > 100)
  {
  alert("You are exceeding your Daily target calorie.")
  }
  if(progressBarVal == 0)
  {
  alert("Start to add details of food you eat .")
  }
  
 });    
 
$(function() {
    $( "#quantity" ).spinner({
       min: 10, 
       max: 2000
    });
});
 </script>
<%
}
}
catch (Exception e)
{
e.printStackTrace();
}

finally
{
try {
    objStmt.close();
    objRes.close();
   }
catch (Exception e) {
// TODO Auto-generated catch block
     e.printStackTrace();
}

}
%>
     

<div class="container">    
 <h3 id="progHead">Percentage of target achieved today = </h3>    
  <div class="progress">    
  </div>    
</div>



<script>
function autocomplete(inp, arr) {
  /*the autocomplete function takes two arguments,
  the text field element and an array of possible autocompleted values:*/
  var currentFocus;
  /*execute a function when someone writes in the text field:*/
  inp.addEventListener("input", function(e) {
      var a, b, i, val = this.value;
      /*close any already open lists of autocompleted values*/
      closeAllLists();
      if (!val) { return false;}
      currentFocus = -1;
      /*create a DIV element that will contain the items (values):*/
      a = document.createElement("DIV");
      a.setAttribute("id", this.id + "autocomplete-list");
      a.setAttribute("class", "autocomplete-items");
      /*append the DIV element as a child of the autocomplete container:*/
      this.parentNode.appendChild(a);
      /*for each item in the array...*/
      for (i = 0; i < arr.length; i++) {
        /*check if the item starts with the same letters as the text field value:*/
        if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
          /*create a DIV element for each matching element:*/
          b = document.createElement("DIV");
          /*make the matching letters bold:*/
          b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
          b.innerHTML += arr[i].substr(val.length);
          /*insert a input field that will hold the current array item's value:*/
          b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
          /*execute a function when someone clicks on the item value (DIV element):*/
          b.addEventListener("click", function(e) {
              /*insert the value for the autocomplete text field:*/
              inp.value = this.getElementsByTagName("input")[0].value;
              /*close the list of autocompleted values,
              (or any other open lists of autocompleted values:*/
              closeAllLists();
          });
          a.appendChild(b);
        }
      }
  });
  /*execute a function presses a key on the keyboard:*/
  inp.addEventListener("keydown", function(e) {
      var x = document.getElementById(this.id + "autocomplete-list");
      if (x) x = x.getElementsByTagName("div");
      if (e.keyCode == 40) {
        /*If the arrow DOWN key is pressed,
        increase the currentFocus variable:*/
        currentFocus++;
        /*and and make the current item more visible:*/
        addActive(x);
      } else if (e.keyCode == 38) { //up
        /*If the arrow UP key is pressed,
        decrease the currentFocus variable:*/
        currentFocus--;
        /*and and make the current item more visible:*/
        addActive(x);
      } else if (e.keyCode == 13) {
        /*If the ENTER key is pressed, prevent the form from being submitted,*/
        e.preventDefault();
        if (currentFocus > -1) {
          /*and simulate a click on the "active" item:*/
          if (x) x[currentFocus].click();
        }
      }
  });
  function addActive(x) {
    /*a function to classify an item as "active":*/
    if (!x) return false;
    /*start by removing the "active" class on all items:*/
    removeActive(x);
    if (currentFocus >= x.length) currentFocus = 0;
    if (currentFocus < 0) currentFocus = (x.length - 1);
    /*add class "autocomplete-active":*/
    x[currentFocus].classList.add("autocomplete-active");
  }
  function removeActive(x) {
    /*a function to remove the "active" class from all autocomplete items:*/
    for (var i = 0; i < x.length; i++) {
      x[i].classList.remove("autocomplete-active");
    }
  }
  function closeAllLists(elmnt) {
    /*close all autocomplete lists in the document,
    except the one passed as an argument:*/
    var x = document.getElementsByClassName("autocomplete-items");
    for (var i = 0; i < x.length; i++) {
      if (elmnt != x[i] && elmnt != inp) {
        x[i].parentNode.removeChild(x[i]);
      }
    }
  }
  /*execute a function when someone clicks in the document:*/
  document.addEventListener("click", function (e) {
      closeAllLists(e.target);
  });
}

/*An array containing all the country names in the world:*/
var food = ["Chicken Curry","Chicken Kurma","Tandoori Chicken Breast","Aloo Ghost Kari (Goat)",
	"Rogan Josh","Aloo Baigan Mixed Vegetable","Aloo Beans Mixed Vegetable","Aloo Curry","Baigan ka Bharta",
	"Bhindi (Okra)","Chole (Chickpeas)","Methi Aloo","Mutter Paneer","Shahi Paneer",
	"Shimla Mirch Aloo","Stuffed Tomato","Vegetable Jalfrazi","Vegetable Kofta Curry","Vegetable Kuruma",
	"Dal Makhani","Sambhar","Boiled Rice","Pulao","Khichadi",
	"Biryani (Mutton)","Biryani (Veg.)","Pulav (Veg.)","Beer","Cola","Wine","Milk (Cow)","Milk (Buffalo)","Yogurt",
	"Buttermilk","Paneer (Cow milk)","Paneer (Buffalo milk)","Lassi","Samosa","Poppadums","Aloo Tikki","Pakoda Onion",
	"Pakoda Paneer","Vada(Medu)","Besan Laddu","Coconut Barfi","Kaju Rolls","Kheer","Ice Cream","Malai Kulfi","Mango Kulfi",
	"Rasgulla","Til Laddu","Beetroot","Carrot","Potato brown","Radish white","Sweet potato brown","Tapioca","Yam","Apple","Apricot (dried)",
	"Avocado","Banana","Blackberry fruit","Cherries red","Blackcurrants","Custard apple","Date, dry","Fig","Grapes","Guava",
	"Jack fruit","Sweet lime","Litchi","Mango","Musk melon","Orange","Papaya","Peach","Pear",
	"Pineapple","Plum","Pomegranate","Raisins, black","Sapota","Strawberry","Watermelon","Wood apple",
	"Green chillies","Coriander seeds","Curry leaves","Garlic","Ginger, fresh","Mint leaves",
	"Onion","Asafoetida","Cardamom, green","Red chillies","Cloves","Cumin seeds","Black cumin (Kalonji)",
    "Fenugreek seeds","Nutmeg","Basil seeds","Anise seeds","Pepper, black","Poppy seeds",
	"Turmeric powder","Almond","Arecanut dried","Cashew nut","Coconut dry","Coconut fresh","Gingelly seeds","Ground nut","Linseeds",
	"Pine seed","Pistachio nuts","Sunflower seeds","Walnut","Flax seeds","Chia seeds","Sugarcane juice",
	"Ghee","Butter","Oil","Cheese","Coconut water","Cat fish","Mackerel","Matha","Pomfret","Salmon","Sardine","Shark","Silver fish",
	"Catla","Tuna","Crab","Lobster","Oyster","Tiger prawns","Clam","Squid","Amaranth leaves","Beet greens",
	"Brussels sprouts","Cabbage Chinese","Cabbage, green","Cauliflower leaves","Colocasia leaves, green",
	"Drumstick leaves","Fenugreek leaves","Lettuce","Mustard leaves","Parsley","Radish leaves","Spinach",
	"Rice (Brown)","Rice Parboiled","Rice Raw milled","Wheat whole","Wheat flour","Bulgar wheat","Refined flour",
	"Ragi","Rice flakes","Wheat semolina","Wheat vermicelli","Barley",
	"Bajra","Jowar","Quinoa","Amaranth seed, Black","Bengal gram, dal","Bengal gram, whole",
	"Black gram whole","Cow peav brown","Cow pea, white","Green gram dal","Green gram, whole",
	"Horse gram, whole","Lentil dal","Peas, dry","Rajma, red","Red gram, dal","Red gram, whole",
	"Soya bean, brown","Biscuit","Chocolate Biscuits",
	"Cake (Plain)","Cake (Rich Chocolate)","Dosa (Plain)","Dosa (Masala)","Puri",
	"Chappatti","Parota","Idli","Boiled Egg", "Raw Egg", "Egg white", "Egg yolk" ];

/*initiate the autocomplete function on the "myInput" element, and pass along the countries array as possible autocomplete values:*/
autocomplete(document.getElementById("food"), food);
</script>

</body>
</html>
    