<?php include"template/menu.php";  ?>
<div class="container">
<div id="login-page" class="row">
    <div class="col s12 z-depth-6 card-panel">
      <form class="login-form">
        <div class="row">
          <div class="input-field col s12 center">
            <img src="ico/decepticons-black.png" alt="" class="responsive-img valign profile-image-login">
            <h5 class="center login-form-text">Login</h5>
          </div>
          <form name="form_login" action="logar.php" method="POST">

            <div class="row margin">
              <div class="input-field col s12">
                <i class="mdi-social-person-outline prefix"></i>
                <input class="validate" name="email_usuario" id="email" type="email">
                <label for="email" data-error="Email invalido" data-success="right" class="left-align">Email</label>
              </div>
              <div class="input-field col s12">
                <i class="mdi-action-lock-outline prefix"></i>
                <input id="password" name="senha_usuario" maxlength="12"  type="password">
                <label for="password">Senha</label>
              </div>
              <div class="input-field col s12 m12 l12  login-text">
                  <input type="checkbox" id="remember-me" />
                  <label for="remember-me">Lembre</label>
              </div>
              <div class="input-field col s12 m8  center-align">
                <button class="btn waves-effect waves-light right teal " type="submit" name="action">Logar</button>
              </div>
              <div class="input-field col s6 m6 l6">
                <p class="margin medium-small"><a href="cadastro.php">Crie uma conta!</a></p>
              </div>
            </div>

      </form>
    </div>
  </div>
</div>
<?php include"template/footer.php";  ?>
