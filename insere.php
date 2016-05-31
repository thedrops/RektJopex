<?php
include"template/menu.php";

$nome_usuario = $_POST['nome_usuario'];
$email_usuario = $_POST['email_usuario'];
$end_usuario = $_POST['end_usuario'];
$cep_usuario = $_POST['cep_usuario'];
$num_usuario = $_POST['num_usuario'];
$estado_usuario = $_POST['estado_usuario'];
$cidade_usuario = $_POST['cidade_usuario'];
$senha_usuario = md5($_POST['senha_usuario']);


if($con){
$sql = "insert into usuario(nome_usuario,email_usuario,end_usuario,cep_usuario,num_usuario,cidade_usuario,estado_usuario,senha_usuario)".
"values('$nome_usuario','$email_usuario','$end_usuario','$cep_usuario','$num_usuario','$cidade_usuario','$estado_usuario','$senha_usuario')";
$run = $con->query($sql);
   if($run){
       echo "<center class='fundo'><h1>Cadastro concluido com Sucesso!<br>Boas Compras</h1></center>";
       echo "<script>setTimeout(function(){window.location.href='index.php'},9000);</script>";
   }
   else{
       echo"<center class='fundo'>Erro na inclusão</center>".mysqli_error($con);
   }
}else{
   echo"<center class='fundo'>Erro de Conexão</center>".mysqli_error($con);
}

include"template/footer.php";



?>
