<?php
include'template/menu.php'

?>
  <div class="container fundo">
  <h1>Consulta de Clientes </h1>
  <a href="apagar_tudo.php"><i class="fa fa-trash fa-2x black-text "></i>
  <table class="bordered highlight black-text"  width='100%'>
    <tr>
      <th>Seq</th>
      <th>Nome</th>
      <th>Email</th>
      <th>Endereço</th>
      <th>CEP</th>
      <th>Número</th>
      <th>Cidade</th>
      <th>Estado</th>
      <th>Alterar</th>
      <th>Deletar</th>
    </tr>
  <?php


  $sql = "select * from usuario;";
  $rs = mysqli_query($con, $sql);
  while ($valor = mysqli_fetch_array($rs)) { ?>
    <tr>
      <td><?=$valor['id_usuario']?></td>
      <td><?=$valor['nome_usuario']?></td>
      <td><?=$valor['email_usuario']?></td>
      <td><?=$valor['end_usuario']?></td>
      <td><?=$valor['cep_usuario']?></td>
      <td><?=$valor['num_usuario']?></td>
      <td><?=$valor['cidade_usuario']?></td>
      <td><?=$valor['estado_usuario']?></td>

      <td ><a href="altera.php?seq=<?=$valor['id_usuario']?>"><i class="fa fa-pencil-square-o fa-2x black-text" aria-hidden="true"></i></td>
      <td ><a href="delete.php?seq=<?=$valor['id_usuario']?>"><i class="fa fa-trash fa-2x black-text" aria-hidden="true"></i></td>

    </tr>

  <?php
}


?>
  </table>
</div>
<?php
include'template/footer.php'
?>
