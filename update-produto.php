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
  $desc1=$_POST['desc1_produto'];
  $desc2=$_POST['desc2_produto'];
  $preco=$_POST['preco_produto'];
  $categoria=$_POST['categoria_produto'];
  $foto_antiga = $_POST['foto_antiga'];


  if ($_FILES["foto"]["error"]==0) {
    $ext = substr($_FILES["foto"]["name"],
        strpos(strrev($_FILES["foto"]["name"]),".")*-1);
    $foto = md5(time().$_FILES["foto"]["name"]).".".$ext;
    move_uploaded_file($_FILES["foto"]["tmp_name"], "imagens/".$foto);
    unlink("imagens/".$foto_antiga);

    $sql="UPDATE produto SET nome_produto = '$nome', desc1_produto = '$desc1', desc2_produto = '$desc2', preco_produto = '$preco', categoria_produto='$categoria', foto = '$foto' where id_produto='$cod'";
    $rs = mysqli_query($con, $sql);
    echo "<center class='fundo'><h1>Produto Editado com Sucesso! </h1></center>";
    echo "<script>window.location.href='consulta-produto.php'</script>";

  }
  else {
    $sql="UPDATE produto SET nome_produto = '$nome', desc1_produto = '$desc1', desc2_produto = '$desc2', preco_produto = '$preco', categoria_produto='$categoria' where id_produto='$cod'";
    $rs = mysqli_query($con, $sql);
    echo "<center class='fundo'><h1>Produto Editado com Sucesso! </h1></center>";
    echo "<script>window.location.href='consulta-produto.php'</script>";
  }



}elseif($acao == "edt"){

  $sql = "select * from produto where id_produto = '".$cod."' ";
  $rs = mysqli_query($con, $sql);
  $linha = mysqli_fetch_array($rs);
  $nome=$linha['nome_produto'];
  $desc1=$linha['desc1_produto'];
  $desc2=$linha['desc2_produto'];
  $preco=$linha['preco_produto'];
  $categoria=$linha['categoria_produto'];
  $foto=$linha['foto'];

?>
<div class="container fundo">
<h1 class="header center black-text">Atualização de produtos</h1>

  <div class="row">
      <br>
     <form id="incCliente" class="col s12" action="update-produto.php?acao=upd" method="POST" enctype="multipart/form-data">
        <div class="row">
            <div class="input-field col s12 m6">
                <input id="nome_produto" type="text" class="validate" value="<?=$nome;?>" name="nome_produto">
                <label for="rnome">Nome do Produto</label>
            </div>
            <div class="input-field col s12 m6">
                <input id="desc_produto" type="text" class="validate" value="<?=$desc1;?>" name="desc1_produto" >
                <label>Descrição do Produto</label>
            </div>
            <div class="input-field col s12 m6">
                <input id="desc_produto" type="text" class="validate" value="<?=$desc2;?>" name="desc2_produto" >
                <label>Especificações Técnicas</label>
            </div>
            <div class="input-field col s12 m6">
                <input id="categoria_produto" type="text" class="validate" value="<?=$categoria;?>" name="categoria_produto">
                <label for="rnome">Categoria</label>
            </div>
            <div class="input-field col s12 m6">
                <input id="preco_produto" maxlength="10" type="number" value="<?=$preco;?>"  name="preco_produto" >
                <label for="rnome">Preço</label>
            </div>
            <div class="input-field col s12 m12">
              <div class="file-field input-field ">
                <div class="btn">
                  <span>Foto</span>
                  <input type="file" name='foto' id="foto"  multiple>
                </div>
                <div class="file-path-wrapper">
                  <input class="file-path validate" type="text" placeholder="Upload one or more files"><br>
                  <img src="imagens/<?=$foto;?>" width="150"height="150">
                  <input type="hidden" name="foto_antiga" value="<?= $foto;?>">
                </div>
              </div>
            </div>

            </div>
            <div class="input-field col s12 m6 right">
              <input type="hidden" name='cod' value="<?=$_GET['cod'];?>">
                <button class="btn waves-effect black right teal " type="submit" name="action">Atualizar</button>
           </div>
      </form>
  </div>
</div>














<?php
include"template/footer.php";
}
?>
