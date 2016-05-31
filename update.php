<?php

include"template/menu.php";
$id_usuario = $_POST['id_usuario'];
$nome_usuario = $_POST['nome_usuario'];
$email_usuario = $_POST['email_usuario'];
$end_usuario = $_POST['end_usuario'];
$cep_usuario = $_POST['cep_usuario'];
$num_usuario = $_POST['num_usuario'];
$estado_usuario = $_POST['estado_usuario'];
$cidade_usuario = $_POST['cidade_usuario'];
$senha_usuario = $_POST['senha_usuario'];




  if($con){
$sql = " UPDATE usuario set
        nome_usuario = '$nome_usuario',
        email_usuario = '$email_usuario',
        end_usuario = '$end_usuario',
        cep_usuario = '$cep_usuario',
        num_usuario = '$num_usuario',
        estado_usuario = '$estado_usuario',
        cidade_usuario = '$cidade_usuario',
        senha_usuario = '$senha_usuario'

        where id_usuario = $id_usuario;";
$rs = mysqli_query($con ,$sql);
    if($rs){
        echo "<center class='fundo'><h1>Cadastro Atualizado com sucesso</h1></center>";
    }
    else{
        echo"Erro na alteração".mysqli_error($con);
    }
}else{
    echo"Erro de Conexão".mysqli_error($con);
}


include"template/footer.php";
?>
