<?php

include"template/menu.php";



if($con){
$sql = "call apagar_tudo;";
$rs = mysqli_query($con ,$sql);
  if($rs){
      echo "<center class='fundo'><h1>Todos os usuários apagados com sucesso!</h1></center>";
      echo "<script>setTimeout(function(){window.location.href='consulta.php'},2000);</script>";
  }
  else{
      echo"Erro na exclusão!".mysqli_error($con);
  }
}else{
    echo"Erro de Conexão".mysqli_error($con);
}



include"template/footer.php";
?>
