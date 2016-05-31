<?php

include"template/menu.php";



$id_produto = $_GET['seq'];
if($con){
$sql = " DELETE FROM estoque where id_produto = $id_produto;";
$rs = mysqli_query($con ,$sql);
  if($rs){
      echo "<center class='fundo'><h1>Produto Deletado do estoque com sucesso!</h1></center>";
      echo "<script>setTimeout(function(){window.location.href='consulta-estoque.php'},3000);</script>";
  }
  else{
      echo"Erro na alteração".mysqli_error($con);
  }
}else{
    echo"Erro de Conexão".mysqli_error($con);
}



include"template/footer.php";
?>
