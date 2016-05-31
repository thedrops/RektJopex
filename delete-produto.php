<?php

include"template/menu.php";

$id_produto = $_GET['seq'];

$sql ="select * from produto where id_produto =".$id_produto;
$rs = mysqli_query($con ,$sql);
if($con){
  if($valor=mysqli_fetch_array($rs)){
$sql = " DELETE FROM produto where id_produto = $id_produto;";
$rs = mysqli_query($con ,$sql);
  if($rs){
      echo "<center class='fundo'><h1>Produto Deletado com sucesso!</h1></center>";
      if (file_exists("imagens/".$valor["foto"])) {
        unlink("imagens/".$valor["foto"]);
      }
  }
}else{
      echo"Erro na alteração".mysqli_error($con);
  }
}else{
    echo"Erro de Conexão".mysqli_error($con);
}



include"template/footer.php";
?>
