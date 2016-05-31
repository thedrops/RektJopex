<?php

include"template/menu.php";



$id_usuario = $_GET['seq'];
if($con){
$sql = " DELETE FROM usuario where id_usuario = $id_usuario;";
$rs = mysqli_query($con ,$sql);
  if($rs){
      echo "<center class='fundo'><h1>Cadastro Deletado com sucesso!</h1></center>";
      echo "<script>setTimeout(function(){window.location.href='consulta.php'},3000);</script>";
  }
  else{
      echo"Erro na alteração".mysqli_error($con);
  }
}else{
    echo"Erro de Conexão".mysqli_error($con);
}



include"template/footer.php";
?>
