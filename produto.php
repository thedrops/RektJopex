<?php include"template/menu.php";  ?>

<div class="conatiner fundo">
<div class="row">
  <div class="col s12 m12"><h1>Produtos</h1></div>
  <?php
  $sql = "select * from produto order by nome_produto;";
  $rs = mysqli_query($con, $sql);
  $cnt = mysqli_num_rows($rs);

  while ($valor = mysqli_fetch_array($rs)) {
  ?>
  <div class="col s12 m3">
    <div class="icon-block">
      <div class="center produto"><img src="imagens/<?=$valor['foto']?>"width="150" height="150"  ></div>
      <h5><?=$valor['nome_produto']?></h5>
      <p class="light ">R$ <?=number_format($valor['preco_produto'],2,',','.');?></p>
      <p class="light "><?=$valor['categoria_produto']?></p>
      <a class="waves-effect black btn  "  href="compra.php?seq=<?=$valor['id_produto']?>">Mais informações</a>

    </div>
  </div>

  <?php

}
  ?>
</div>
</div>

<?php include"template/footer.php";  ?>
