<?php
include"template/menu.php";
$nome_produto = $_POST['nome_produto'];
$desc1_produto = $_POST['desc1_produto'];
$desc2_produto = $_POST['desc2_produto'];
$categoria_produto = $_POST['categoria_produto'];
$preco_produto = $_POST['preco_produto'];


if ($_FILES["foto"]["error"]==0) {
  $ext = substr($_FILES["foto"]["name"],
      strpos(strrev($_FILES["foto"]["name"]),".")*-1);
  $foto = md5(time().$_FILES["foto"]["name"]).".".$ext;
  move_uploaded_file($_FILES["foto"]["tmp_name"], "imagens/".$foto);
}
else {
  $foto ="nouser.png";
}
   if($con){
$sql = "insert into produto(nome_produto,desc1_produto,desc2_produto,categoria_produto,preco_produto ,foto) values ('$nome_produto','$desc1_produto','$desc2_produto','$categoria_produto','$preco_produto','$foto')";
$run = $con->query($sql);
    if($run){
        echo "<center class='fundo'><h1>Cadastro concluido com Sucesso!</h1></center>";
        echo "<script>setTimeout(function(){window.location.href='consulta-produto.php'},5000);</script>";
    }
    else{
        echo"<center class='fundo'>Erro na inclusão</center>".mysqli_error($con);
    }
}else{
    echo"<center class='fundo'>Erro de Conexão</center>".mysqli_error($con);
}

include"template/footer.php";



?>
