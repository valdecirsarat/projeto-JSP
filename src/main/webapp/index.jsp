<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PROJETO - JSP</title>
</head>
<body>
	<h1>Olá mundo, Porjeto em JSP</h1>
	
	<form action="ServeletLogin" method="post">
	<input type="hidden" value =<% request.getParameter("url"); %> name="url">
		<table>
			<tr>
				<td><label>Login </label></td>
				<td><input name="Login" type="text"></td>
			</tr>
			<tr>
				<td><label>Senha </label></td>
				<td><input name="Senha" type ="password"></td>
			</tr>
			<tr>
			<td></td>
				<td><input type="submit"value="Enviar"  style="color: blue; width: 100%"></td>
			</tr>
		</table>		
	</form>
	<h4>${msg}</h4>
</body>
</html>