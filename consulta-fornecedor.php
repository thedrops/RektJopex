<?php
include'template/menu.php'

?>
  <div class="container fundo">
  <h1>Consulta de Fornecedor </h1>
  <a href="apagar_tudo.php"><i class="fa fa-trash fa-2x black-text "></i>
  <table class="bordered highlight black-text"  width='100%'>
    <tr>
      <th>Seq</th>
      <th>Nome</th>
      <th>Endereço</th>
      <th>CNPJ</th>
    </tr>
  <?php


  $sql = "select * from fornecedor;";
  $rs = mysqli_query($con, $sql);
  while ($valor = mysqli_fetch_array($rs)) { ?>
    <tr>
      <td><?=$valor['id_fornecedor']?></td>
      <td><?=$valor['nome_fornecedor']?></td>
      <td><?=$valor['endereco_fornecedor']?></td>
      <td><?=$valor['cnpj_fornecedor']?></td>
    </tr>

  <?php
}


?>
  </table>
</div>
<?php
include'template/footer.php'
?>
