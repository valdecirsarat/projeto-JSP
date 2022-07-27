<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<div class="modal"  id ="modalTeste" tabindex="-1" role="dialog" style="display:block;">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Usuário Salvo com Sucesso! obs falta colocar fecha modal</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Fechar">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<p>${msg}</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal" >Fechar</button>
				<button type="button" class="btn btn-primary">Salvar
					mudanças</button>
			</div>
		</div>
	</div>
</div>
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
 

