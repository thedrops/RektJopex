<?php
include"template/menu.php";

$sql =" call primeiros_cadastrados();";
$rs=mysqli_query($con,$sql);


?>
<div class="container">
<div class="center fundo">
  <h1>Rekt Jopex</h1>
  <p style="font-size:22px">A Rekt Jopex herdou seu nome de um bordão de um streamer de games. Rekt é uma gíria americana usada para interpretar a palavra "humilhar". Já Jopex foi apenas uma palavra no calor do momento, não deve ser confundida com quaisquer palavras ou nomes!</p>
  <p style="font-size:22px">Até o momento a Rekt Jopex é uma empresa fícticia de vendas de aparelhos eletrônicos com ênfase de tecnologia computacional.</p>
  <p style="font-size:22px">Um pouco sobre a entidade da qual os programadores se inspiraram para dar nome a empresa: Hastad, streamer da Twitch(grande site de streaming) e famoso geralmente pela sua atitude em respostas a outros jogadores, o famoso rage. Rage, simplesmente "raiva" em inglês, da qual Hastad esboça muito em suas streams a ponto de quase infartar. Apesar das suas atitudes, Hastad é comumente referência de streamer por conta da condução de sua narração e a interação com seu público, muito próxima.</p>
  <p style="font-size:22px">Nós da Rekt Jopex Agradecemos aos nossos 10 primeiros cadastrados : </p><b style="font-size:25px"> <?php while ($valor = mysqli_fetch_array($rs)) { ?> <?=$valor['nome_usuario']?>;<br> <?php } ?></b>
  <a class="left black-text" href="http://www.twitch.tv/hastad">Stream do Hastad</a>
</div>

</div>

<?php include"template/footer.php"; ?>
