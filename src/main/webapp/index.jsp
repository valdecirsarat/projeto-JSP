<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">

<title>PROJETO - JSP</title>
 <style type="text/css">
 
 form {
 	position: absolute;
	top: 30%;
	left: 33%;
	rigth: 33%	
}
 h3 {
 	position: absolute;
	top: 20%;
	left: 33%;	
}
h6{
position: absolute;
	top: 50%;
	left: 33%;
	color: red;	
}
 

 </style>
 
</head>
<body>
	<h3>Projeto com JSP</h3>
	
	<form action="<%=request.getContextPath() %>/ServeletLogin" method="post" class="row g-3 needs-validation" novalidate>
	<input type="hidden" value =<% request.getParameter("url"); %> name="url">
		<div class="col-md-6">
			<label class="form-label">Login </label>
			<input class="form-control"  name="Login" type="text"  placeholder ="Login" required>
		</div>
		<div class="col-md-6">	
			<label  class="form-label">Senha </label>
			<input  class="form-control"  placeholder ="senha" name="Senha" type ="password" required>		
		</div>
		<input type="submit"value="Logar" class="btn btn-primary">
	
	</form>
	<div class="col-md-6">
		<h6>${msg}</h6>
		</div>
	
	 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
	 <script type="text/javascript">
	 (() => {
		  'use strict'

		  // Fetch all the forms we want to apply custom Bootstrap validation styles to
		  const forms = document.querySelectorAll('.needs-validation')

		  // Loop over them and prevent submission
		  Array.from(forms).forEach(form => {
		    form.addEventListener('submit', event => {
		      if (!form.checkValidity()) {
		        event.preventDefault()
		        event.stopPropagation()
		      }

		      form.classList.add('was-validated')
		    }, false)
		  })
		})()
	 
	 
	 
	 
	 </script>

</body>
</html>