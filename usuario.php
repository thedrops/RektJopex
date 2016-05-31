<?php

	include 'template/menu.php';
	if (isset($_SESSION['nome'])) {
		echo "<center class='fundo' ><h1>Seja bem Vindo, ".$_SESSION['nome']." !</h1></center>";
    
	}
	include 'template/footer.php';
?>
