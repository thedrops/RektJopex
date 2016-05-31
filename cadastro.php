<?php
include"template/menu.php";
 ?>
<div class="container fundo">
<h1 class="header center black-text">Cadastro</h1>

  <div class="row">
      <br>
     <form id="incCliente" class="col s12" action="insere.php" method="POST">
            <div class="input-field col s12 m6">
                <input id="nome_usuario" type="text" class="validate" name="nome_usuario" placeholder="Ex:Maria, João">
                <label for="rnome">Nome</label>
            </div>
            <div class="input-field col s12 m6">
                <input id="email_usuario" type="text" class="validate" name="email_usuario" placeholder="Ex:asd@asd.com">
                <label for="remail" data-error="Escreva Corretamente" >Email</label>
            </div>
            <div class="input-field col s12 m6">
                <input id="end_usuario" type="text" class="validate" name="end_usuario" placeholder="Ex:Rua Maria João">
                <label for="rnome">Endereço</label>
            </div>
            <div class="input-field col s12 m6">
                <input id="cep_usuario" maxlength="8" type="text" class="validate" name="cep_usuario" placeholder="Ex:11111111">
                <label for="rnome">CEP</label>
            </div>
            <div class="input-field col s12 m4">
                <input id="end_usuario" type="text" maxlength="4" class="validate" name="num_usuario" placeholder="Ex:111">
                <label for="rnome">Número</label>
            </div>
            <div class="input-field col s12 m4">
                <input id="cep_usuario" maxlength="50" type="text" class="validate" name="cidade_usuario" placeholder="Ex:Araçoiaba da Serra">
                <label for="rnome">Cidade</label>
            </div>
            <div class="input-field col s12 m4">
                <input id="end_usuario" type="text" maxlength="2" class="validate" name="estado_usuario" placeholder="Ex:SP">
                <label for="rnome">Estado</label>
            </div>
            <div class="input-field col s12 m12">
                <input id="senha_usuario" maxlength="12" type="password" class="validate" name="senha_usuario" placeholder="Ex:12345678">
                <label for="valor">Senha</label>
            </div>

            </div>
            <div class="input-field col s12 m6 right">
                <button class="btn waves-effect waves-light right teal " type="submit" name="action">Cadastrar <i class="material-icons right">send</i> </button>
           </div>
      </form>

</div>
  <?php
  include"template/footer.php"
  ?>
