<?php
include"template/menu.php";


if(isset($_GET['acao'])){
  $acao = $_GET['acao'];
}else {
  $acao = "";
}

if(isset($_GET['cod'])){
  $cod = $_GET['cod'];
}else {
  $cod = "";
}

if($acao == "upd"){

  $cod=$_POST['cod'];
  $nome=$_POST['nome_produto'];
  $categoria=$_POST['categoria_produto'];
  $qt_produto=$_POST['qt_produto'];


    $sql="UPDATE estoque SET nome_produto = '$nome', qt_produto='$qt_produto', categoria_produto='$categoria' where id_produto='$cod'";
    $rs = mysqli_query($con, $sql);
    echo "<center class='fundo'><h1>Estoque Editado com Sucesso </h1></center>";
    echo "<script>window.location.href='consulta-estoque.php'</script>";

  }

elseif($acao == "edt"){
  $sql = "select * from estoque where id_produto = '".$cod."' ";
  $rs = mysqli_query($con, $sql);
  $linha = mysqli_fetch_array($rs);
  $nome=$linha['nome_produto'];
  $qt_produto=$linha['qt_produto'];
  $categoria=$linha['categoria_produto'];


?>
<div class="container fundo">
<h1 class="header center black-text">Atualização de produtos do Estoque</h1>

  <div class="row">
      <br>
     <form id="incCliente" class="col s12" action="update-estoque.php?acao=upd" method="POST" enctype="multipart/form-data">
            <div class="input-field col s12 m6">
                <input id="nome_produto" type="text" class="validate" value="<?=$nome;?>" name="nome_produto">
                <label for="rnome">Nome produto</label>
            </div>
            <div class="input-field col s12 m6">
                <input id="categoria_produto" type="text" class="validate" value="<?=$categoria;?>" name="categoria_produto">
                <label for="rnome">Categoria</label>
            </div>
            <div class="input-field col s12 m6">
                <input id="preco_produto" maxlength="10" type="number" value="<?=$qt_produto;?>"  name="qt_produto" >
                <label for="rnome">Quantidade</label>
            </div>
    </div>
            <div class="input-field col s12 m6 left">
              <input type="hidden" name='cod' value="<?=$_GET['cod'];?>">
                <button class="btn waves-effect black right teal " type="submit" name="action">Atualizar</button>
           </div>
      </form>
  </div>

<?php
}
include"template/footer.php";

?>
