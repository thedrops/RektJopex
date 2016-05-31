<?php
include"template/menu.php";

if ($con) {
  $sql = 'select * from usuario where id_usuario ='.$_GET['seq'];
  $rs = mysqli_query($con, $sql);
    if($valor = mysqli_fetch_array($rs)) { ?>
      <form name="altusuario" action="update.php" method="POST">
        <div class="container fundo">
        <h1>Inclusão de Clientes</h1>
      ID:<input type="text" name="id_usuario"size="5"
        value="<?php echo $valor['id_usuario']; ?>" readonly>
      Nome:<input type="text" name="nome_usuario"
        value="<?php echo $valor['nome_usuario']; ?>"><br>
      Email:<input type="text" name="email_usuario"
        value="<?php echo $valor['email_usuario']; ?>"><br>
      Endereço:<input type="text" name="end_usuario"
          value="<?php echo $valor['end_usuario']; ?>"><br>
      CEP:<input type="text" name="cep_usuario"
        value="<?php echo $valor['cep_usuario']; ?>"><br>
      Número:<input type="text" name="num_usuario"
        value="<?php echo $valor['num_usuario']; ?>"><br>
      Estado:<input type="text" name="estado_usuario"
        value="<?php echo $valor['estado_usuario']; ?>"><br>
      Cidade:<input type="text" name="cidade_usuario"
        value="<?php echo $valor['cidade_usuario']; ?>"><br>
      Senha:<input type="text" name="senha_usuario"
        value="<?php echo $valor['senha_usuario']; ?>"><br>
      <button class="btn waves-effect waves-light right teal " type="submit" name="action" value="altera">Alterar <i class="material-icons right">send</i> </button>
      </form>
    </div>
      <?php
    }else {
      echo "Usuario não cadastrado";

    }
  }else { echo "kappa";}

    include'template/footer.php';
?>
