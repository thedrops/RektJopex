<?php
include"template/menu.php";
$nome_produto = $_POST['nome_produto'];
$categoria_produto = $_POST['categoria_produto'];
$qt_produto = $_POST['qt_produto'];

   if($con){
$sql = "insert into estoque(nome_produto,categoria_produto,qt_produto) values ('$nome_produto','$categoria_produto','$qt_produto')";
$run = $con->query($sql);
    if($run){
        echo "<center class='fundo'><h1>Cadastro de produto no estoque concluido com Sucesso!</h1></center>";
        echo "<script>setTimeout(function(){window.location.href='cadastro-produto.php'},5000);</script>";
    }
    else{
        echo"Erro na inclusão".mysqli_error($con);
    }
}else{
    echo"Erro de Conexão".mysqli_error($con);
}

include"template/footer.php";



?>
