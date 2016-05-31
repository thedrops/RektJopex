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
  $foto_antiga = $_POST['foto_antiga'];


  if ($_FILES["foto"]["error"]==0) {
    $ext = substr($_FILES["foto"]["name"],
        strpos(strrev($_FILES["foto"]["name"]),".")*-1);
    $foto = md5(time().$_FILES["foto"]["name"]).".".$ext;
    move_uploaded_file($_FILES["foto"]["tmp_name"], "imagens/".$foto);

    $sql="UPDATE produto SET nome_produto = '$nome', desc1_produto = '$desc1',desc2_produto = '$desc2', preco_produto = '$preco', categoria_produto='$categoria', foto = '$foto' where id_produto='$cod'";
    $rs = mysqli_query($con, $sql);
    echo "<script>alert('Cadastro Realizado com Sucesso');window.location.href='consulta-produto.php'</script>";

  }
  else {
    $sql="UPDATE produto SET nome_produto = '$nome', desc1_produto = '$desc1',desc2_produto = '$desc2', preco_produto = '$preco', categoria_produto='$categoria' where id_produto='$cod'";
    $rs = mysqli_query($con, $sql);
    echo "<script>alert('Cadastro Realizado com Sucesso');window.location.href='consulta-produto.php'</script>";
  }



}elseif($acao == "edt"){

  $sql = "select * from estoque where id_produto = '".$cod."' ";
  $rs = mysqli_query($con, $sql);
  $linha = mysqli_fetch_array($rs);
  $nome=$linha['nome_produto'];
  $categoria=$linha['categoria_produto'];

?>
<div class="container fundo">
<h1 class="header center black-text">Cadastro de produtos</h1>

  <div class="row">
      <br>
     <form id="incCliente" class="col s12" action="insere-produto.php" method="POST" enctype="multipart/form-data">
        <div class="row">
            <div class="input-field col s12 m6">
                <input id="nome_produto" type="text" class="validate " value="<?=$nome;?> " readonly name="nome_produto">
                <label for="rnome">Nome produto</label>
            </div>
            <div class="input-field col s12 m6">
                <input id="desc_produto" type="text" class="validate"  name="desc1_produto" >
                <label>Descrição do Produto</label>
            </div>
            <div class="input-field col s12 m6">
                <input id="desc_produto" type="text" class="validate"  name="desc2_produto" >
                <label>Especificações Técnicas</label>
            </div>
            <div class="input-field col s12 m6">
                <input id="categoria_produto" type="text" class="validate" value="<?=$categoria;?>" readonly name="categoria_produto">
                <label for="rnome">Categoria</label>
            </div>
            <div class="input-field col s12 m6">
                <input id="preco_produto" maxlength="10" type="text" name="preco_produto" >
                <label for="rnome">Preço</label>
            </div>
            <div class="input-field col s12 m12">
              <div class="file-field input-field ">
                <div class="btn">
                  <span>Foto</span>
                  <input type="file" name='foto' id="foto" class="black"  multiple>
                </div>
                <div class="file-path-wrapper">
                  <input class="file-path validate" type="text" placeholder="Adicione uma foto"><br>
                  <img src="imagens/<?=$foto;?>" width="150"height="150">
                  <input type="hidden" name="foto_antiga" value="<?= $foto;?>">
                </div>
              </div>
            </div>

            </div>
            <div class="input-field col s12 m6 right">
              <input type="hidden" name='cod' value="<?=$_GET['cod'];?>">
                <button class="btn waves-effect black right teal " type="submit" name="action">Cadastrar <i class="material-icons right">send</i> </button>
           </div>
      </form>
  </div>
</div>














<?php
include"template/footer.php";
}
?>
