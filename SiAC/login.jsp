<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login SiAC</title>
</head>

<body>
	<center>
	
	<img alt="" src="../siaclogo.jpg" >
	<form action="j_security_check" method="POST">
		Matrícula:<br/><input type="text" name="j_username"/> <br/>
		Senha:<br/><input type="password" name="j_password"/> <br/>
		<input type="submit" value="Acessar"/>
	</form>
	</center>
</body>
</html>