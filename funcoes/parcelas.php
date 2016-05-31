<?php
    function parcelas($valor){
      $valorparcela=0;
      for($i=2;$i<=12;$i++){
        $valorparcela = ($valor / $i) * 1.1;
        $valorparcela = number_format($valorparcela, 2, ',', '.');

        echo $i."x de "."R$".$valorparcela."<br/>";
        $valorparcela=0;
      }
    }
    parcelas($valor['preco_produto']);
 ?>
