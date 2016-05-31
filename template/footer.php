<?php mysqli_close($con);  ?>

<div class="section">

</div>
</div>
</main>
<footer class="page-footer black">
<div class="footer-copyright">
  <div class="container center-align">
    Iguana is Love <img src="ico/heart.png" width="15" heigth="15"> <img src="ico/iguana.png"  width="15" heigth="15">
  </div>
</div>
</footer>

<div id="modal1" class="modal modal-fixed-footer">
   <div class="modal-content" style="overflow-x: hidden;">
     <div class="input-field col s12 center">
       <img src="ico/decepticons-black.png" width="50px" alt="" class="responsive-img valign profile-image-login">
       <h5 class="center login-form-text">Login</h5>
     </div>
     <form name="form_login" action="logar.php" method="POST">


       <div class="row margin">
         <div class="input-field col s12">
           <i class="mdi-social-person-outline prefix"></i>
           <input class="validate" name="email_usuario" id="email" type="email">
           <label for="email" data-error="Email invalido" class="left-align">Email</label>
         </div>
         <div class="input-field col s12">
           <i class="mdi-action-lock-outline prefix"></i>
           <input id="password" name="senha_usuario" maxlength="12"  type="password">
           <label for="password">Senha</label>
         </div>
         <div class="input-field col s12">
             <input type="checkbox" id="remember-me" name="lembrar" />
             <label for="remember-me">Lembre</label>
         </div>
         <div class="input-field col s12  center-align">
           <button class="btn waves-effect  black " type="submit" name="action">Logar</button>
         </div>
         <div class="input-field col s6 m6 l6">
           <p class="margin medium-small"><a class="black-text" href="cadastro.php">Crie uma conta!</a></p>
         </div>
       </div>
     </form>
   </div>
 </div>


<!--  Scripts-->
<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="js/materialize.js"></script>
<script src="js/init.js"></script>
<script src="js/backstrech.js"></script>
<script>
$(document).ready(function(){
$('.slider').slider({full_width: true});
$('body').backstretch("ico/fundo.gif");
$('.modal-trigger').leanModal();
});
</script>

</body>
</html>
