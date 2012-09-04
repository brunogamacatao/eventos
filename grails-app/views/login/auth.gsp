<html>
  <head>
    <title><g:message code="springSecurity.login.title"/></title>
    <link href="${resource(dir: 'css', file: 'main.css')}" rel="stylesheet" type="text/css" />
    <link href='http://fonts.googleapis.com/css?family=Quando' rel='stylesheet' type='text/css'>
  </head>
  <body>
    <div id="wrapper">
      <div id="barraNavegacao">
        <div class="conteudo">
          <img src="${resource(dir: 'images', file: 'proprio/facisa.png')}" alt="Facisa" style="width: 60px; margin-right: 20px;" />
          <img src="${resource(dir: 'images', file: 'proprio/fcm.png')}" alt="FCM" style="width: 70px; margin-right: 20px;" />
          <img src="${resource(dir: 'images', file: 'proprio/esac.png')}" alt="Esac" style="width: 70px; margin-right: 20px;" />
        </div>
      </div>
      <div id="boxCentral">
        <div class="logoTexto">
          <h1>EventosWeb</h1>
          <span>Release 1.0</span>
          <p>Controle de eventos das IES - Facisa, FCM e Esac.</p>
        </div>
        <div class="login">
          <h1>Login</h1>
          <form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>
            <p>
              <label for='username'><g:message code="springSecurity.login.username.label"/>:</label>
              <input type='text' class='text_' name='j_username' id='username'/>
            </p>
            <p>
              <label for='password'><g:message code="springSecurity.login.password.label"/>:</label>
              <input type='password' class='text_' name='j_password' id='password'/>
            </p>
            <p>
              <input type='submit' id="submit" class="botao" value='${message(code: "springSecurity.login.button")}'/>
            </p>
            <p id="remember_me_holder" style="padding-top: 10px; width: 140px; margin-left: 38px">
            <input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
            <label for='remember_me'>
              <g:message code="springSecurity.login.remember.me.label"/>
            </label>
            </p>
            <g:if test='${flash.message}'>
              <div class='login_message'>${flash.message}</div>
            </g:if>
          </form>
        </div>
      </div>
      <div id="footer">
        <div class="texto">
          <p>&copy; Cesed - Centro de Ensino Superior e Desenvolvimento<br />Desenvolvido por: <a href="http://about.me/alissondiniz">Alisson Diniz</a> e <a href="http://about.me/vandrepaulo">Vandré Paulo</a></p>
        </div>
      </div>
    </div>
    <script type='text/javascript'>
      <!--
      (function() {
              document.forms['loginForm'].elements['j_username'].focus();
      })();
      // -->
    </script>
  </body>
</html>
