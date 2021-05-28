<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Logout</title>
	<link rel="stylesheet" type="text/css" href="../css/estilo.css" />
	
</head>
<body style="background-image: URL(../targetree3.png); background-repeat: no-repeat;
	background-position: center; background-attachment: fixed; ">

		<%
			session.invalidate();
			response.sendRedirect("/SiAC");
		%>		

</body>
</html>