<?php
include"template/menu.php";
if(!isset($_SESSION['nome'])) {
  echo "<center class='fundo'><h1> Realize o Login para Acessar esta Página</h1></center>";
}else {
?>
<div class="container fundo">
<h1 class="header center black-text">Cadastro de estoque</h1>

  <div class="row">
      <br>
     <form id="Estoque" class="col s12" action="insere-estoque.php" method="POST">
        <div class="row">
            <div class="input-field col s12 m6">
                <input id="nome_produto" type="text" class="validate" name="nome_produto">
                <label for="rnome">Nome produto</label>
            </div>
            <div class="input-field col s12 m6">
                <input id="categoria_produto" type="text" class="validate" name="categoria_produto">
                <label for="rnome">Categoria</label>
            </div>
            <div class="input-field col s12 m6">
                <input id="qt_produto" maxlength="10" type="number"  name="qt_produto" >
                <label for="rnome">Quantidades do produto</label>
            </div>

            </div>
            <div class="input-field col s12 m6 right">
                <button class="btn waves-effect waves-light right teal " type="submit" name="action">Cadastrar</button>
           </div>
      </form>
  </div>
</div>
<?php
}
include"template/footer.php";
?>
