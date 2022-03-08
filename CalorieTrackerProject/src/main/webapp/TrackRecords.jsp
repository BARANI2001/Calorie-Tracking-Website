<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.*, java.util.*" %>
<%@ page import="java.io.*, java.util.Date, java.text.*, java.math.*, java.sql.*"  %>

<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">    
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">    
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>    
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>    
<title>Track Records</title>

<style>
	
body {
    background-image : linear-gradient(rgba(0,0,3,0.80),rgba(0,0,3,0.80)),url("images/pic6.jpg");
    background-repeat : true;
    background-size : 1366px 700px;
    font-family: Arial, Helvetica, sans-serif;
    color: white;
}
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


</style>
</head>
<body>

<h1>CALORIE TRACKER</h1>
<hr>

<div class="topnav">
  <a href= windows.jsp>Home</a>
  <a href=AddMeal.jsp>Add Food</a>
  <a class="active" href=TrackRecords.jsp>Track Records</a>
  <div class="topnav-right">
    <a href="logout.jsp">Logout</a>
    <a href="about.jsp">About</a>
	</div>
</div>

<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

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
	<h3> <%=strName%>, your daily target calorie is <%=iTarget%> </h3>
	<h3 class="topnav-right">Today (<%=strToday%>)</h3><br>
</div><br><br>

<%
	}
	else
	{
	response.sendRedirect("index.jsp");
	}
	
%>
 
<%

Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();


Gson PgsonObj= new Gson();
Map<Object,Object> Pmap = null;
List<Map<Object,Object>> Plist = new ArrayList<Map<Object,Object>>();

Class.forName("org.postgresql.Driver");
Connection objConn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres","postgres");
PreparedStatement objStmt1, objStmt2, objStmt3, objStmt4, objStmt5, objStmt6, objStmt7, objStmtP1, objStmtP2, objStmtP3, objStmtP4, objStmtP5, objStmtP6, objStmtP7, objStmtP8, objStmtP9, objStmtP10, objStmtP11, objStmtP12,objStmtP13, objStmtP14, objStmtP15, objStmtP16 = null;
ResultSet objRes1, objRes2, objRes3, objRes4, objRes5, objRes6, objRes7, objResP1, objResP2, objResP3, objResP4, objResP5, objResP6, objResP7, objResP8, objResP9, objResP10, objResP11, objResP12, objResP13, objResP14, objResP15, objResP16 = null;
BigDecimal bigTotal1, bigTotal2, bigTotal3, bigTotal4, bigTotal5, bigTotal6, bigTotal7, bigTotalP1, bigTotalP2, bigTotalP3, bigTotalP4, bigTotalP5, bigTotalP6, bigTotalP7, bigTotalP8, bigTotalP9, bigTotalP10, bigTotalP11, bigTotalP12, bigTotalP13, bigTotalP14, bigTotalP15, bigTotalP16;
Double iTotal1, iTotal2, iTotal3, iTotal4, iTotal5, iTotal6, iTotal7, iTotalP1, iTotalP2, iTotalP3, iTotalP4, iTotalP5, iTotalP6, iTotalP7, iTotalP8, iTotalP9, iTotalP10, iTotalP11, iTotalP12, iTotalP13, iTotalP14, iTotalP15, iTotalP16;
Boolean rs1, rs2, rs3, rs4, rs5, rs6, rs7, rsP1, rsP2, rsP3, rsP4, rsP5, rsP6, rsP7, rsP8, rsP9, rsP10, rsP11, rsP12, rsP13, rsP14, rsP15, rsP16;
Double dAvg1=0.0, dAvg2=0.0, dAvg3=0.0, dAvg4=0.0, dAvg5=0.0, dAvg6=0.0, dAvg7=0.0, dAvgP1, dAvgP2, dAvgP3, dAvgP4, dAvgP5, dAvgP6, dAvgP7, dAvgP8, dAvgP9, dAvgP10, dAvgP11, dAvgP12, dAvgP13, dAvgP14, dAvgP15, dAvgP16  = 0.0; 
DecimalFormat df = new DecimalFormat("#.00");

List<Double> dList1 = new ArrayList<Double>();
double dAvgTot = 0.0;

try{

	String strQuery1 = "SELECT SUM(\"Calorie\") FROM \"Java\".\"UserCalorie\" WHERE \"UserName\"=? AND \"Date\"=?";
	objStmt1 = objConn.prepareStatement(strQuery1);
	objStmt1.setString(1,strName);
	objStmt1.setString(2,"17/06/2021");
	objRes1 =  objStmt1.executeQuery();
	rs1 = objRes1.next();
	if(rs1!=null && objRes1.getBigDecimal(1)!=null)
	{
	bigTotal1 = objRes1.getBigDecimal(1);
	iTotal1 = bigTotal1.doubleValue();
	iTotal1 *= 100;
	dAvg1 = iTotal1/iTarget;
	map = new HashMap<Object,Object>(); map.put("label", "June 17, 2021"); map.put("y", dAvg1); list.add(map);
	dList1.add(dAvg1);
	dAvgTot += dAvg1;
	}
	else{
		map = new HashMap<Object,Object>(); map.put("label", "June 17, 2021"); map.put("y", 0); list.add(map);
		dList1.add(dAvg1);
		dAvgTot += dAvg1;
	}

	String strQuery2 = "SELECT SUM(\"Calorie\") FROM \"Java\".\"UserCalorie\" WHERE \"UserName\"=? AND \"Date\"=?";
	objStmt2 = objConn.prepareStatement(strQuery2);
	objStmt2.setString(1,strName);
	objStmt2.setString(2,"18/06/2021");
	objRes2 =  objStmt2.executeQuery();
	rs2 = objRes2.next();
	if(rs2!=null && objRes2.getBigDecimal(1)!=null)
	{
	bigTotal2 = objRes2.getBigDecimal(1);
	iTotal2 = bigTotal2.doubleValue();
	iTotal2 *= 100;
	dAvg2 = (iTotal2/iTarget);
	map = new HashMap<Object,Object>(); map.put("label", "June 18, 2021"); map.put("y", dAvg2); list.add(map);
	dList1.add(dAvg2);
	dAvgTot += dAvg2;
	}
	else{
		map = new HashMap<Object,Object>(); map.put("label", "June 18, 2021"); map.put("y", 0); list.add(map);
		dList1.add(dAvg2);
		dAvgTot += dAvg2;
	}

	String strQuery3 = "SELECT SUM(\"Calorie\") FROM \"Java\".\"UserCalorie\" WHERE \"UserName\"=? AND \"Date\"=?";
	objStmt3 = objConn.prepareStatement(strQuery3);
	objStmt3.setString(1,strName);
	objStmt3.setString(2,"19/06/2021");
	objRes3 =  objStmt3.executeQuery();
	rs3 = objRes3.next();
	if(rs3!=null && objRes3.getBigDecimal(1)!=null)
	{
	bigTotal3 = objRes3.getBigDecimal(1);
	iTotal3 = bigTotal3.doubleValue();
	iTotal3 *= 100;
	 dAvg3 = (iTotal3/iTarget);
	map = new HashMap<Object,Object>(); map.put("label", "June 19, 2021"); map.put("y", dAvg3); list.add(map);
	dList1.add(dAvg3);	
	dAvgTot += dAvg3;
	}
	else{
		map = new HashMap<Object,Object>(); map.put("label", "June 19, 2021"); map.put("y", 0); list.add(map);
		dList1.add(dAvg3);
		dAvgTot += dAvg3;
	}

	String strQuery4 = "SELECT SUM(\"Calorie\") FROM \"Java\".\"UserCalorie\" WHERE \"UserName\"=? AND \"Date\"=?";
	objStmt4 = objConn.prepareStatement(strQuery4);
	objStmt4.setString(1,strName);
	objStmt4.setString(2,"20/06/2021");
	objRes4 =  objStmt4.executeQuery();
	rs4 = objRes4.next();
	if(rs4!=null && objRes4.getBigDecimal(1)!=null)
	{
	bigTotal4 = objRes4.getBigDecimal(1);
	iTotal4 = bigTotal4.doubleValue();
	iTotal4 *= 100;
	 dAvg4 = (iTotal4/iTarget);
	map = new HashMap<Object,Object>(); map.put("label", "June 20, 2021"); map.put("y", dAvg4); list.add(map);
	dList1.add(dAvg4);
	dAvgTot += dAvg4;
	}
	else{
		map = new HashMap<Object,Object>(); map.put("label", "June 20, 2021"); map.put("y", 0); list.add(map);
		dList1.add(dAvg4);
		dAvgTot += dAvg4;
	}

	String strQuery5 = "SELECT SUM(\"Calorie\") FROM \"Java\".\"UserCalorie\" WHERE \"UserName\"=? AND \"Date\"=?";
	objStmt5 = objConn.prepareStatement(strQuery5);
	objStmt5.setString(1,strName);
	objStmt5.setString(2,"21/06/2021");
	objRes5 =  objStmt5.executeQuery();
	rs5 = objRes5.next();
	if(rs5!=null && objRes5.getBigDecimal(1)!=null)
	{
	bigTotal5 = objRes5.getBigDecimal(1);
	iTotal5 = bigTotal5.doubleValue();
	iTotal5 *= 100;
	 dAvg5 = (iTotal5/iTarget);
	map = new HashMap<Object,Object>(); map.put("label", "June 21, 2021"); map.put("y", dAvg5); list.add(map);
	dList1.add(dAvg5);	
	dAvgTot += dAvg5;
	}
	else{
		map = new HashMap<Object,Object>(); map.put("label", "June 21, 2021"); map.put("y", 0); list.add(map);
		dList1.add(dAvg5);
		dAvgTot += dAvg5;
	}

	String strQuery6 = "SELECT SUM(\"Calorie\") FROM \"Java\".\"UserCalorie\" WHERE \"UserName\"=? AND \"Date\"=?";
	objStmt6 = objConn.prepareStatement(strQuery6);
	objStmt6.setString(1,strName);
	objStmt6.setString(2,"22/06/2021");
	objRes6 =  objStmt6.executeQuery();
	rs6 = objRes6.next();
	if(rs6!=null && objRes6.getBigDecimal(1)!=null)
	{
	bigTotal6 = objRes6.getBigDecimal(1);
	iTotal6 = bigTotal6.doubleValue();
	iTotal6 *= 100;
	 dAvg6 = (iTotal6/iTarget);
	map = new HashMap<Object,Object>(); map.put("label", "June 22, 2021"); map.put("y", dAvg6); list.add(map);
	dList1.add(dAvg6);
	dAvgTot += dAvg6;
	}
	else{
		map = new HashMap<Object,Object>(); map.put("label", "June 22, 2021"); map.put("y", 0); list.add(map);
		dList1.add(dAvg6);
		dAvgTot += dAvg6;
	}


	String strQuery7 = "SELECT SUM(\"Calorie\") FROM \"Java\".\"UserCalorie\" WHERE \"UserName\"=? AND \"Date\"=?";
	objStmt7 = objConn.prepareStatement(strQuery7);
	objStmt7.setString(1,strName);
	objStmt7.setString(2,strToday);
	objRes7 =  objStmt7.executeQuery();
	rs7 = objRes7.next();
	if(rs7 != null && objRes7.getBigDecimal(1)!=null)
	{
	bigTotal7 = objRes7.getBigDecimal(1);
	iTotal7 = bigTotal7.doubleValue();
	
		String strQueryP1 = "SELECT SUM(\"Calorie\") FROM \"Java\".\"UserCalorie\" WHERE \"UserName\"=? AND \"Date\"=? AND \"Category\"=?";
		objStmtP1 = objConn.prepareStatement(strQueryP1);
		objStmtP1.setString(1,strName);
		objStmtP1.setString(2,strToday);
		objStmtP1.setString((3),"Vegetable Curries");
		objResP1 =  objStmtP1.executeQuery();
		rsP1 = objResP1.next();
		
		if(rsP1 != null && objResP1.getBigDecimal(1)!=null)
		{
			bigTotalP1 = objResP1.getBigDecimal(1);
			iTotalP1 = bigTotalP1.doubleValue();
			dAvgP1 = (iTotalP1/iTotal7) * 100;
			dAvgP1 = Double.valueOf(df.format(dAvgP1));
			map = new HashMap<Object,Object>(); map.put("label", "Vegetable Curries"); map.put("y", dAvgP1); map.put("exploded", false); Plist.add(map);
		}
		
		String strQueryP2 = "SELECT SUM(\"Calorie\") FROM \"Java\".\"UserCalorie\" WHERE \"UserName\"=? AND \"Date\"=? AND \"Category\"=?";
		objStmtP2 = objConn.prepareStatement(strQueryP2);
		objStmtP2.setString(1,strName);
		objStmtP2.setString(2,strToday);
		objStmtP2.setString((3),"NonVeg Curries");
		objResP2 =  objStmtP2.executeQuery();
		rsP2 = objResP2.next();
		
		if(rsP2 != null && objResP2.getBigDecimal(1)!=null)
		{
			bigTotalP2 = objResP2.getBigDecimal(1);
			iTotalP2 = bigTotalP2.doubleValue();
			dAvgP2 = (iTotalP2/iTotal7) * 100;
			dAvgP2 = Double.valueOf(df.format(dAvgP2));
			map = new HashMap<Object,Object>(); map.put("label", "NonVeg Curries"); map.put("y", dAvgP2); map.put("exploded", false); Plist.add(map);
		}
	
		String strQueryP3 = "SELECT SUM(\"Calorie\") FROM \"Java\".\"UserCalorie\" WHERE \"UserName\"=? AND \"Date\"=? AND \"Category\"=?";
		objStmtP3 = objConn.prepareStatement(strQueryP3);
		objStmtP3.setString(1,strName);
		objStmtP3.setString(2,strToday);
		objStmtP3.setString((3),"Rice");
		objResP3 =  objStmtP3.executeQuery();
		rsP3 = objResP3.next();
		
		if(rsP3 != null && objResP3.getBigDecimal(1)!=null)
		{
			bigTotalP3 = objResP3.getBigDecimal(1);
			iTotalP3 = bigTotalP3.doubleValue();
			dAvgP3 = (iTotalP3/iTotal7) * 100;
			dAvgP3 = Double.valueOf(df.format(dAvgP3));
			map = new HashMap<Object,Object>(); map.put("label", "Rice"); map.put("y", dAvgP3); map.put("exploded", false); Plist.add(map);
		}
		
		String strQueryP4 = "SELECT SUM(\"Calorie\") FROM \"Java\".\"UserCalorie\" WHERE \"UserName\"=? AND \"Date\"=? AND \"Category\"=?";
		objStmtP4 = objConn.prepareStatement(strQueryP4);
		objStmtP4.setString(1,strName);
		objStmtP4.setString(2,strToday);
		objStmtP4.setString((3),"Egg");
		objResP4 =  objStmtP4.executeQuery();
		rsP4 = objResP4.next();
		
		if(rsP4 != null && objResP4.getBigDecimal(1)!=null)
		{
			bigTotalP4 = objResP4.getBigDecimal(1);
			iTotalP4 = bigTotalP4.doubleValue();
			dAvgP4 = (iTotalP4/iTotal7) * 100;
			dAvgP4 = Double.valueOf(df.format(dAvgP4));
			map = new HashMap<Object,Object>(); map.put("label", "Egg"); map.put("y", dAvgP4); map.put("exploded", false); Plist.add(map);
		}
		
		String strQueryP5 = "SELECT SUM(\"Calorie\") FROM \"Java\".\"UserCalorie\" WHERE \"UserName\"=? AND \"Date\"=? AND \"Category\"=?";
		objStmtP5 = objConn.prepareStatement(strQueryP5);
		objStmtP5.setString(1,strName);
		objStmtP5.setString(2,strToday);
		objStmtP5.setString((3),"Beverages");
		objResP5 =  objStmtP5.executeQuery();
		rsP5 = objResP5.next();
		
		if(rsP5 != null && objResP5.getBigDecimal(1)!=null)
		{
			bigTotalP5 = objResP5.getBigDecimal(1);
			iTotalP5 = bigTotalP5.doubleValue();
			dAvgP5 = (iTotalP5/iTotal7) * 100;
			dAvgP5 = Double.valueOf(df.format(dAvgP5));
			map = new HashMap<Object,Object>(); map.put("label", "Beverages"); map.put("y", dAvgP5); map.put("exploded", false); Plist.add(map);
		}
	
		String strQueryP6 = "SELECT SUM(\"Calorie\") FROM \"Java\".\"UserCalorie\" WHERE \"UserName\"=? AND \"Date\"=? AND \"Category\"=?";
		objStmtP6 = objConn.prepareStatement(strQueryP6);
		objStmtP6.setString(1,strName);
		objStmtP6.setString(2,strToday);
		objStmtP6.setString((3),"Dairy Products");
		objResP6 =  objStmtP6.executeQuery();
		rsP6 = objResP6.next();
		
		if(rsP6 != null && objResP6.getBigDecimal(1)!=null)
		{
			bigTotalP6 = objResP6.getBigDecimal(1);
			iTotalP6 = bigTotalP6.doubleValue();
			dAvgP6 = (iTotalP6/iTotal7) * 100;
			dAvgP6 = Double.valueOf(df.format(dAvgP6));
			map = new HashMap<Object,Object>(); map.put("label", "Dairy Products"); map.put("y", dAvgP6); map.put("exploded", false); Plist.add(map);
		}
		
		String strQueryP7 = "SELECT SUM(\"Calorie\") FROM \"Java\".\"UserCalorie\" WHERE \"UserName\"=? AND \"Date\"=? AND \"Category\"=?";
		objStmtP7 = objConn.prepareStatement(strQueryP7);
		objStmtP7.setString(1,strName);
		objStmtP7.setString(2,strToday);
		objStmtP7.setString((3),"Starters");
		objResP7 =  objStmtP7.executeQuery();
		rsP7 = objResP7.next();
		
		if(rsP7 != null && objResP7.getBigDecimal(1)!=null)
		{
			bigTotalP7 = objResP7.getBigDecimal(1);
			iTotalP7 = bigTotalP7.doubleValue();
			dAvgP7 = (iTotalP7/iTotal7) * 100;
			dAvgP7 = Double.valueOf(df.format(dAvgP7));
			map = new HashMap<Object,Object>(); map.put("label", "Starters"); map.put("y", dAvgP7); map.put("exploded", false); Plist.add(map);
		}
		
		String strQueryP8 = "SELECT SUM(\"Calorie\") FROM \"Java\".\"UserCalorie\" WHERE \"UserName\"=? AND \"Date\"=? AND \"Category\"=?";
		objStmtP8 = objConn.prepareStatement(strQueryP8);
		objStmtP8.setString(1,strName);
		objStmtP8.setString(2,strToday);
		objStmtP8.setString((3),"Desserts");
		objResP8 =  objStmtP8.executeQuery();
		rsP8 = objResP8.next();
		
		if(rsP8 != null && objResP8.getBigDecimal(1)!=null)
		{
			bigTotalP8 = objResP8.getBigDecimal(1);
			iTotalP8 = bigTotalP8.doubleValue();
			dAvgP8 = (iTotalP8/iTotal7) * 100;
			dAvgP8 = Double.valueOf(df.format(dAvgP8));
			map = new HashMap<Object,Object>(); map.put("label", "Desserts"); map.put("y", dAvgP8); map.put("exploded", false); Plist.add(map);
		}
	
		String strQueryP9 = "SELECT SUM(\"Calorie\") FROM \"Java\".\"UserCalorie\" WHERE \"UserName\"=? AND \"Date\"=? AND \"Category\"=?";
		objStmtP9 = objConn.prepareStatement(strQueryP9);
		objStmtP9.setString(1,strName);
		objStmtP9.setString(2,strToday);
		objStmtP9.setString((3),"Vegetables");
		objResP9 =  objStmtP9.executeQuery();
		rsP9 = objResP9.next();
		
		if(rsP9 != null && objResP9.getBigDecimal(1)!=null)
		{
			bigTotalP9 = objResP9.getBigDecimal(1);
			iTotalP9 = bigTotalP9.doubleValue();
			dAvgP9 = (iTotalP9/iTotal7) * 100;
			dAvgP9 = Double.valueOf(df.format(dAvgP9));
			map = new HashMap<Object,Object>(); map.put("label", "Vegetables"); map.put("y", dAvgP9); map.put("exploded", false); Plist.add(map);
		}
		
		String strQueryP10 = "SELECT SUM(\"Calorie\") FROM \"Java\".\"UserCalorie\" WHERE \"UserName\"=? AND \"Date\"=? AND \"Category\"=?";
		objStmtP10 = objConn.prepareStatement(strQueryP10);
		objStmtP10.setString(1,strName);
		objStmtP10.setString(2,strToday);
		objStmtP10.setString((3),"Fruits");
		objResP10 =  objStmtP10.executeQuery();
		rsP10 = objResP10.next();
		
		if(rsP10 != null && objResP10.getBigDecimal(1)!=null)
		{
			bigTotalP10 = objResP10.getBigDecimal(1);
			iTotalP10 = bigTotalP10.doubleValue();
			dAvgP10 = (iTotalP10/iTotal7) * 100;
			dAvgP10 = Double.valueOf(df.format(dAvgP10));
			map = new HashMap<Object,Object>(); map.put("label", "Fruits"); map.put("y", dAvgP10); map.put("exploded", false); Plist.add(map);
		}
		
		String strQueryP11 = "SELECT SUM(\"Calorie\") FROM \"Java\".\"UserCalorie\" WHERE \"UserName\"=? AND \"Date\"=? AND \"Category\"=?";
		objStmtP11 = objConn.prepareStatement(strQueryP11);
		objStmtP11.setString(1,strName);
		objStmtP11.setString(2,strToday);
		objStmtP11.setString((3),"Condiments and Spices");
		objResP11 =  objStmtP11.executeQuery();
		rsP11 = objResP11.next();
		
		if(rsP11 != null && objResP11.getBigDecimal(1)!=null)
		{
			bigTotalP11 = objResP11.getBigDecimal(1);
			iTotalP11 = bigTotalP11.doubleValue();
			dAvgP11 = (iTotalP11/iTotal7) * 100;
			dAvgP11 = Double.valueOf(df.format(dAvgP11));
			map = new HashMap<Object,Object>(); map.put("label", "Condiments and Spices"); map.put("y", dAvgP11); map.put("exploded", false); Plist.add(map);
		}
		
	
		String strQueryP12 = "SELECT SUM(\"Calorie\") FROM \"Java\".\"UserCalorie\" WHERE \"UserName\"=? AND \"Date\"=? AND \"Category\"=?";
		objStmtP12 = objConn.prepareStatement(strQueryP12);
		objStmtP12.setString(1,strName);
		objStmtP12.setString(2,strToday);
		objStmtP12.setString((3),"Nuts and Oil seeds");
		objResP12 =  objStmtP12.executeQuery();
		rsP12 = objResP12.next();
		
		if(rsP12 != null && objResP12.getBigDecimal(1)!=null)
		{
			bigTotalP12 = objResP12.getBigDecimal(1);
			iTotalP12 = bigTotalP12.doubleValue();
			dAvgP12 = (iTotalP12/iTotal7) * 100;
			dAvgP12 = Double.valueOf(df.format(dAvgP12));
			map = new HashMap<Object,Object>(); map.put("label", "Nuts and Oil seeds"); map.put("y", dAvgP12); map.put("exploded", false); Plist.add(map);
		}
		
		String strQueryP13 = "SELECT SUM(\"Calorie\") FROM \"Java\".\"UserCalorie\" WHERE \"UserName\"=? AND \"Date\"=? AND \"Category\"=?";
		objStmtP13 = objConn.prepareStatement(strQueryP13);
		objStmtP13.setString(1,strName);
		objStmtP13.setString(2,strToday);
		objStmtP13.setString((3),"Fish and seafood");
		objResP13 =  objStmtP13.executeQuery();
		rsP13 = objResP13.next();
		
		if(rsP13 != null && objResP13.getBigDecimal(1)!=null)
		{
			bigTotalP13 = objResP13.getBigDecimal(1);
			iTotalP13 = bigTotalP13.doubleValue();
			dAvgP13 = (iTotalP13/iTotal7) * 100;
			dAvgP13 = Double.valueOf(df.format(dAvgP13));
			map = new HashMap<Object,Object>(); map.put("label", "Fish and seafood"); map.put("y", dAvgP13); map.put("exploded", false); Plist.add(map);
		}
		
		String strQueryP14 = "SELECT SUM(\"Calorie\") FROM \"Java\".\"UserCalorie\" WHERE \"UserName\"=? AND \"Date\"=? AND \"Category\"=?";
		objStmtP14 = objConn.prepareStatement(strQueryP14);
		objStmtP14.setString(1,strName);
		objStmtP14.setString(2,strToday);
		objStmtP14.setString((3),"Cereals and Millets");
		objResP14 =  objStmtP14.executeQuery();
		rsP14 = objResP14.next();
		
		if(rsP14 != null && objResP14.getBigDecimal(1)!=null)
		{
			bigTotalP14 = objResP14.getBigDecimal(1);
			iTotalP14 = bigTotalP14.doubleValue();
			dAvgP14 = (iTotalP14/iTotal7) * 100;
			dAvgP14 = Double.valueOf(df.format(dAvgP14));
			map = new HashMap<Object,Object>(); map.put("label", "Cereals and Millets"); map.put("y", dAvgP14); map.put("exploded", false); Plist.add(map);
		}
	
		String strQueryP15 = "SELECT SUM(\"Calorie\") FROM \"Java\".\"UserCalorie\" WHERE \"UserName\"=? AND \"Date\"=? AND \"Category\"=?";
		objStmtP15 = objConn.prepareStatement(strQueryP15);
		objStmtP15.setString(1,strName);
		objStmtP15.setString(2,strToday);
		objStmtP15.setString((3),"Grain legumes");
		objResP15 =  objStmtP15.executeQuery();
		rsP15 = objResP15.next();
		
		if(rsP15 != null && objResP15.getBigDecimal(1)!=null)
		{
			bigTotalP15 = objResP15.getBigDecimal(1);
			iTotalP15 = bigTotalP15.doubleValue();
			dAvgP15 = (iTotalP15/iTotal7) * 100;
			dAvgP15 = Double.valueOf(df.format(dAvgP15));
			map = new HashMap<Object,Object>(); map.put("label", "Grain legumes"); map.put("y", dAvgP15); map.put("exploded", false); Plist.add(map);
		}
		
		String strQueryP16 = "SELECT SUM(\"Calorie\") FROM \"Java\".\"UserCalorie\" WHERE \"UserName\"=? AND \"Date\"=? AND \"Category\"=?";
		objStmtP16 = objConn.prepareStatement(strQueryP16);
		objStmtP16.setString(1,strName);
		objStmtP16.setString(2,strToday);
		objStmtP16.setString((3),"Pastries");
		objResP16 =  objStmtP16.executeQuery();
		rsP16 = objResP16.next();
		
		if(rsP16 != null && objResP16.getBigDecimal(1)!=null)
		{
			bigTotalP16 = objResP16.getBigDecimal(1);
			iTotalP16 = bigTotalP16.doubleValue();
			dAvgP16 = (iTotalP16/iTotal7) * 100;
			dAvgP16 = Double.valueOf(df.format(dAvgP16));
			map = new HashMap<Object,Object>(); map.put("label", "Pastries"); map.put("y", dAvgP16); map.put("exploded", false); Plist.add(map);
		}
		
		
		
	iTotal7 *= 100;
	dAvg7 = (iTotal7/iTarget);
	map = new HashMap<Object,Object>(); map.put("label", "June 23, 2021"); map.put("y", dAvg7); list.add(map);
	dList1.add(dAvg7);
	dAvgTot += dAvg7;
	}
	else{
		map = new HashMap<Object,Object>(); map.put("label", "June 23, 2021"); map.put("y", 0); list.add(map);
		dList1.add(dAvg7);
		dAvgTot += dAvg7;
	}
	String PdataPoints = PgsonObj.toJson(Plist);
	String dataPoints = gsonObj.toJson(list);
	
	double dAvgMax = Collections.max(dList1);
	dAvgMax = Double.valueOf(df.format(dAvgMax));
	double dAvgMin = Collections.min(dList1);
	dAvgMin = Double.valueOf(df.format(dAvgMin));
	dAvgTot /= 7;
	dAvgTot = Double.valueOf(df.format(dAvgTot));
	
	
%>

<center>
<div id="PchartContainer1" style="height: 370px; width: 99%;"></div>
<br><br><br>
<div id="chartContainer" style="height: 370px; width: 99%;"></div>
<br><br><br><br>
<div id="1table">
<table id="table1">	
	<tr>
		<td class="th1">Analysis from bar chart</td>
		<td class="th1">Values in Percentage</td>
	</tr>

	<tbody>
		<tr>
			<td>Maximum</td>
			<td><%=dAvgMax%> %</td>
		</tr>
		<tr>
			<td>Minimum</td>
			<td><%=dAvgMin%> %</td>
		</tr>
		<tr>
			<td>Average</td>
			<td><%=dAvgTot%> %</td>
		</tr>
	</tbody>
</table>
</div>
</center>
<script type="text/javascript">
window.onload = function() { 
	var Pchart1 = new CanvasJS.Chart("PchartContainer1", {
		theme: "dark2",
		animationEnabled: true,
		title:{
			text: "Category of food intake today"
		},
		legend: {
			verticalAlign: "center",
			horizontalAlign: "right"
		},
		data: [{
			type: "pie",
			showInLegend: true,
			indexLabel: "{y}%",
			indexLabelPlacement: "inside",
			legendText: "{label}: {y}%",
			toolTipContent: "<b>{label}</b>: {y}%",
			dataPoints : <%out.print(PdataPoints);%>
		}]
	});
	Pchart1.render();
	
var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
	theme: "dark2",
	title: {
		text: "Daily target calorie achievement (last 7 days)"
	},
	axisY: {
		suffix: "%",
		includeZero: true
	},
	axisX: {
		title: "DATES"
	},
	data: [{
		type: "column",
		yValueFormatString: "#,##0\"%\"",
		dataPoints: <%out.print(dataPoints);%>
	}]
});
chart.render();

}

	 
	
</script>

<%
}
catch(SQLException e){
	out.println("<div  style='width: 50%; margin-left: auto; margin-right: auto; margin-top: 200px;'>Could not connect to the database.</div>");
	
}
%>



<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</html>