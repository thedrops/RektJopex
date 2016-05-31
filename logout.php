<?php

	include 'template/menu.php';
  session_destroy();

	setcookie("email_usuario", "",time());
	setcookie("senha_usuario", "",time());



  echo "<center class='fundo'><h1>Logout efetuado com sucesso!</h1></center>";
  echo "<script>setTimeout(function(){window.location.href='index.php'},1000);</script>";


	include 'template/footer.php';
?>
