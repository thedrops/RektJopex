<?php
include'template/menu.php';

if(isset($_POST['lembrar']))
{
  setcookie("email_usuario", $_POST['email_usuario'],time() + (86400 * 30));
  setcookie("senha_usuario", $_POST['senha_usuario'],time() + (86400 * 30));
}

$email_usuario = $_POST['email_usuario'];
$senha_usuario = md5($_POST['senha_usuario']);
$sql =" SELECT * FROM usuario where email_usuario='$email_usuario'";
$rs = mysqli_query($con, $sql);
$linhas = mysqli_num_rows($rs);
if ($linhas == 0) {
  echo "<center class='fundo'>Usuario não encontrado </center>";
}
else {
  $valor = mysqli_fetch_array($rs);
  if ($senha_usuario!=$valor['senha_usuario']) {
    echo "<center class='fundo'>A senha esta incorreta !</center>";
  }
  else {
    $_SESSION['email_usuario'] = $email_usuario;
    $_SESSION["senha_usuario"] = $senha_usuario;
    $_SESSION["nome"] = $valor['nome_usuario'];

    echo "<center class='fundo'><h1>Login efetuado com sucesso!</h1></center>";
    echo "<script>setTimeout(function(){window.location.href='index.php'},2000);</script>";
  }
}



include'template/footer.php';
?>
