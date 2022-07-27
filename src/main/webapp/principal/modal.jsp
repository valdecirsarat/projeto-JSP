<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<div class="modal"  id ="exampleModalUsuario" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Usuário</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Fechar">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
			
				<div class="input-group mb-3">
					<input type="text" class="form-control"
						placeholder="Nome" aria-label="nome" aria-describedby="basic-addon2" id="nomeBusca">
					<div class="input-group-append">
						<button class="btn btn-success" type="button" onclick="buscarUsuario()">Buscar</button>
					</div>
				</div>
				<table class="table">
					<thead>
						<tr>
							<th scope="col">ID</th>
							<th scope="col">Nome</th>
							<th scope="col">Ver</th>
							
						</tr>
					</thead>
					<tbody>
				
					</tbody>
				</table>


			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal" >Fechar</button>
				
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">
function buscarUsuario(){
 	var nomeBusca = document.getElementById("nomeBusca").value;
 	if(nomeBusca != null && nomeBusca != "" && nomeBusca.trim() != ""){
 		
 		var urlAction = document.getElementById("formUser").action;
		
 		$.ajax({
			
			method: "get",
			url: urlAction,
			data: "nomeBusca=" + nomeBusca + "&acao=buscarUsuario",
			success: function(response){
				alert(response);
			} 
			
		}).fail(function(xhr, status, errorThrown){
			alert("Erro ao Buscar Usuário por nome: " + xhr.responseText);
		})
		
 	}
	
}



</script>






<!--  Comentado para nao ficar aparencendo toda vez que realiza um teste
<script type="text/javascript">
var teste = document.getElementById("teste").innerText;

function abrirModal(){
	if(teste !=""){
		document.getElementById("modalTeste").style.display = "block";
	}else{
		document.getElementById("modalTeste").style.display = "none";
	}
	
}
abrirModal();

</script>
 -->
 

