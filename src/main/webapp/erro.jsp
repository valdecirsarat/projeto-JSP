<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>pagina Erro</title>
</head>
<body>
<h2>Mensagem de Erro, entre em contato com o desenvolvedor do sistema</h2>
<%
	out.print(request.getAttribute("msg"));
%>
</body>
</html>