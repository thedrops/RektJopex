<?php include"template/menu.php"; ?>
<div class="container fundo">
<h1 class="header center black-text">Contato - Fale Conosco</h1>

  <div class="row">
      <br>
     <form id="incCliente" class="col s12" action="envio-contato.php" method="POST">
            <div class="input-field col s12 m6">
                <input id="nome_contato" type="text" class="validate" name="nome_contato" placeholder="Ex:Maria, João">
                <label for="rnome">Nome</label>
            </div>
            <div class="input-field col s12 m6">
                <input id="email_contato" type="text" class="validate" name="email_contato" placeholder="Ex:asd@domínio.com">
                <label for="remail" data-error="Escreva Corretamente" >Email</label>
            </div>
            <div class="input-field col s12 m6">
                <input id="cep_contato" maxlength="8" type="text" class="validate" name="cpf_contato" placeholder="Ex:11111111">
                <label for="rnome">CPF</label>
            </div>
            <div class="input-field col s12 m6">
                <input id="assunto_usuario" maxlength="8" type="text" class="validate" name="assunto_contato" placeholder="Ex:Duvidas, problemas, etc...">
                <label for="rnome">Assunto</label>
            </div>
            <div class="input-field col s12">
                <textarea id="mensagem_contato" name="mensagem_contato" class="materialize-textarea"></textarea>
                <label for="textarea1">Conteúdo da mensagem</label>
            </div>
            <div class="input-field col s12 m6 right">
                <button class="btn waves-effect waves-light right teal " type="submit" name="action">Enviar<i class="material-icons right">send</i> </button>
           </div>
      </form>
</div>
<?php include"template/footer.php"; ?>
