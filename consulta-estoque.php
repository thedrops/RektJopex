<?php
include'template/menu.php';
if(!isset($_SESSION['nome'])) {
  echo "<center class='fundo'><h1> Realize o Login para Acessar esta Página</h1></center>";
}else {
?>
  <div class="container fundo">
  <center><h1>Consulta de Estoque</h1></center>
  <table border='1' width='80%' align="center" class="bordered">
    <tr>
<a href="cadastro-estoque.php"><i class="fa fa-pencil-square-o fa-2x black-text" aria-hidden="true"></i>Novo Produto
      <td align="center">Dados</td>
      <td align="center">Alterar</td>
      <td align="center">Deletar</td>
    </tr>
  <?php


  $sql = "select * from estoque;";
  $rs = mysqli_query($con, $sql);
  while ($valor = mysqli_fetch_array($rs)) { ?>
    <tr>
    <td>
      <b>ID:</b><?=$valor['id_produto']?><br>
      <b>Nome:</b><?=$valor['nome_produto']?><br>
      <b>Categoria:</b><?=$valor['categoria_produto']?><br>
      <b>Quantidades:</b><?=$valor['qt_produto']?><br>

    </td>

      <td align='center'><a href="update-estoque.php?cod=<?=$valor['id_produto']?>&acao=edt"><i class="fa fa-pencil-square-o fa-2x black-text" aria-hidden="true"></i></td>
      <td align='center'><a href="delete-estoque.php?seq=<?=$valor['id_produto']?>"><i class="fa fa-trash fa-2x black-text" aria-hidden="true"></i></td>

    </tr>

  <?php
}


?>
  </table>
</div>
<?php
}
include'template/footer.php'
?>
