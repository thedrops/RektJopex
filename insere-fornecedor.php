<?php
include"template/menu.php";

$nome_fornecedor = $_POST['nome_fornecedor'];
$endereco_fornecedor = $_POST['endereco_fornecedor'];
$cnpj_fornecedor = $_POST['cnpj_fornecedor'];

if($con){
$sql = "insert into fornecedor(nome_fornecedor,endereco_fornecedor,cnpj_fornecedor)".
"values('$nome_fornecedor','$endereco_fornecedor','$cnpj_fornecedor')";
$run = $con->query($sql);
   if($run){
       echo "<center class='fundo'><h3>Cadastro do fornecedor concluido com Sucesso!<br>Boas Compras</h3></center>";
       echo "<script>setTimeout(function(){window.location.href='index.php'},2000);</script>";
   }
   else{
       echo"<center class='fundo'>Erro na inclusão</center>".mysqli_error($con);
   }
}else{
   echo"<center class='fundo'>Erro de Conexão</center>".mysqli_error($con);
}

include"template/footer.php";



?>
