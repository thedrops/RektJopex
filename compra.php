<?php
include"template/menu.php";
?>
<div class="container">
<?php
if ($con) {
  $sql = 'select * from consulta_produto where id_produto ='.$_GET['seq'];
  $rs = mysqli_query($con, $sql);
    if($valor = mysqli_fetch_array($rs)) { ?>
    <div class="fundo center-align">
      <h1><?php echo $valor['nome_produto']; ?></h1>
      <h2><?php echo "R$ ". $valor['preco_produto']; ?></h1>
      <div><img src="imagens/<?=$valor['foto']?>" width="250px"height="250x"></div>

  <ul class="collapsible" data-collapsible="expandable">
    <li>
      <div class="collapsible-header "><i class="material-icons">store</i>Quantidade no Estoque</div>
      <div class="collapsible-body "><p><?php echo $valor['qt_produto']; ?></p></div>
    </li>
    <li>
      <div class="collapsible-header "><i class="material-icons">description</i>Descrição do Produto</div>
      <div class="collapsible-body "><p><?php echo $valor['desc1_produto']; ?></p></div>
    </li>
    <li>
      <div class="collapsible-header"><i class="material-icons">settings</i>Especificações Técnicas</div>
      <div class="collapsible-body"><p><?php echo $valor['desc2_produto']; ?></p></div>
    </li>
    <li>
      <div class="collapsible-header"><i class="material-icons">payment</i>Meios de pagamento</div>
      <div class="collapsible-body"><p>A vista: <?php echo "R$ ". $valor['preco_produto']; ?> </p>
        <p>Parcelado:<br/>
          <?php
            include"funcoes/parcelas.php";
          ?>
        </p>

      </div>
    </li>
  </ul>

  <a class="waves-effect black btn  " href="carrinho.php?acao=add&id=<?=$valor['id_produto']?>">Adicionar ao Carrinho<i class="material-icons right">add</i></a>


<?php
      }else {
        echo "<center class='fundo'>Produto não cadastrado</center>";
?>
</div>
<?php
      }
      }else { echo "kappa";}

      include'template/footer.php';
      ?>
