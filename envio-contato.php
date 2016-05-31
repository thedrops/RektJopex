<?php
include"template/menu.php";
$nome_contato = $_POST['nome_contato'];
$email_contato = $_POST['email_contato'];
$cpf_contato = $_POST['cpf_contato'];
$assunto_contato = $_POST['assunto_contato'];
$mensagem_contato = $_POST['mensagem_contato'];

   if($con){
$sql = "insert into contato(nome_contato,email_contato,cpf_contato,assunto_contato,mensagem_contato) values ('$nome_contato','$email_contato','$cpf_contato','$assunto_contato','$mensagem_contato')";
$run = $con->query($sql);
    if($run){
        echo "<center class='fundo'><h1>Mensagem enviada com sucesso!</h1></center>";
        echo "<script>setTimeout(function(){window.location.href='index.php'},5000);</script>";
    }
    else{
        echo"Erro no envio da mensagem!".mysqli_error($con);
    }
}else{
    echo"Erro de Conexão".mysqli_error($con);
}

include"template/footer.php";
?>
