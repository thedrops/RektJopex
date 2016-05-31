<?php
      include"template/menu.php";

      if(!isset($_SESSION['carrinho'])){
         $_SESSION['carrinho'] = array();
      }

      //adiciona produto

      if(isset($_GET['acao'])){

         if($_GET['acao'] == 'add'){
            $id = intval($_GET['id']);
            if(!isset($_SESSION['carrinho'][$id])){
               $_SESSION['carrinho'][$id] = 1;
            }else{
               $_SESSION['carrinho'][$id] += 1;
            }
         }

         if($_GET['acao'] == 'del'){
            $id = intval($_GET['id']);
            if(isset($_SESSION['carrinho'][$id])){
               unset($_SESSION['carrinho'][$id]);
            }
         }

         if($_GET['acao'] == 'up'){
            if(is_array($_POST['prod'])){
               foreach($_POST['prod'] as $id => $qtd){
                  $id  = intval($id);
                  $qtd = intval($qtd);
                  if(!empty($qtd) || $qtd <> 0){
                     $_SESSION['carrinho'][$id] = $qtd;
                  }else{
                     unset($_SESSION['carrinho'][$id]);
                  }
               }
            }
         }

      }


?>

<div class="container fundo ">
<body>
<table>
    <caption><h1>Carrinho de Compras</h1></caption>
    <thead>
          <tr>
            <th width="244">Produto</th>
            <th width="79">Quantidade</th>
            <th width="89">Pre&ccedil;o</th>
            <th width="100">SubTotal</th>
            <th width="64">Remover</th>
          </tr>
    </thead>
            <form action="?acao=up" method="post">
    <tfoot>
           <tr>
            <td><button value="Atualizar Carrinho" class="btn waves-effect waves-light" type="submit">Atualizar Carrinho
    <i class="material-icons right">refresh</i>
  </button></td>
            <tr>
            <td><a class="waves-effect black btn  "  href="produto.php">Continuar Comprando<i class="material-icons right">store</i></a></td>
            <tr>
            <td><a class="waves-effect black btn  "  href="finalizar.php">Finalizar Compra<i class="material-icons right">shopping_basket</i></a></td>

    </tfoot>

    <tbody>
               <?php
                     if(count($_SESSION['carrinho']) == 0){
                        echo '<tr><td><h3>Não há produto no carrinho</h3></td></tr>';
                     }else{


                        $total = 0;
                        foreach($_SESSION['carrinho'] as $id => $qtd){
                              $sql   = "SELECT * FROM produto WHERE id_produto= '$id' ";
                              $qr    = mysqli_query($con,$sql);
                              $ln    = mysqli_fetch_assoc($qr);

                              $nome  = $ln['nome_produto'];
                              $preco = number_format($ln['preco_produto'], 2, ',', '.');
                              $sub   = number_format($ln['preco_produto'] * $qtd, 2, ',', '.');

                              $total += $ln['preco_produto'] * $qtd;

                           echo '<tr>
                                 <td>'.$nome.'</td>
                                 <td><input type="text" size="3" name="prod['.$id.']" value="'.$qtd.'" /></td>
                                 <td>R$ '.$preco.'</td>
                                 <td>R$ '.$sub.'</td>
                                 <td><a href="?acao=del&id='.$id.'"><i class="material-icons black-text center-align">delete</i></a></td>
                              </tr>';
                        }
                           $total = number_format($total, 2, ',', '.');
                           echo '<tr>
                                    <td colspan="4">Total</td>
                                    <td>R$ '.$total.'</td>
                              </tr>';
                     }
               ?>

     </tbody>
        </form>
</table>
</div>
<?php include"template/footer.php" ?>
