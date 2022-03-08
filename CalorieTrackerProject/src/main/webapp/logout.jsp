<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="errorPage.jsp"%>
 <%@ page import="java.io.*, javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>logout</title>
</head>
<body>

<script>
	alert("You are exceeding your Daily target calorie.");
</script>

<%		
		
		session.removeAttribute("uname");
		session.removeAttribute("target");
		session.invalidate();
		response.sendRedirect("index.jsp");
%>
</body>
</html>