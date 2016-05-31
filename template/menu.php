<?php session_start(); ?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
  <title>Fubex Interprise</title>

  <!-- CSS  -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
</head>
<body>

<nav>
<div class="nav-wrapper black">
  <a href="index.php" class="brand-logo"><img src="ico/decepticons-.png"></a>
  <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
  <ul class="right hide-on-med-and-down">
    <li><a href="index.php">Home</a></li>
    <li><a href="produto.php">Produtos</a></li>
    <li><a href="sobre.php">Sobre</a></li>
    <li><a href="contato.php">Contatos</a></li>
    <?php
    if (isset($_SESSION['nome'])) {
		echo "<li><a href='carrinho.php'>Carrinho</a></li>";
    echo "<li><a href='logout.php'>Sair</a></li>";

  }elseif(isset($_COOKIE['email_usuario'])) {
        echo "<li><a href='carrinho.php'>Carrinho</a></li>";
        echo "<li><a href='logout.php'>Sair</a></li>";
    }
	else{ ?>
    <li><a class=" modal-trigger" href="#modal1">Login</a></li>
    <li><a href="cadastro.php">Cadastro</a></li>
  <?php } ?>


    </ul>
    <ul class="side-nav" id="mobile-demo">
      <li><a href="index.php">Home</a></li>
      <li><a href="produto.php">Produtos</a></li>
      <li><a href="sobre.php">Sobre</a></li>
      <li><a href="contato.php">Contatos</a></li>
      <li><a href="login.php">Login</a></li>
      <li><a href="cadastro.php">Cadastro</a></li>
      </ul>
</div>
</nav>

<main>
<?php $con = new mysqli("localhost","root","","projeto")
          or die("A conexão com o servidor não foi excecutada");
          ?>
