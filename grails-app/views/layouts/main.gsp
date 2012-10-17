<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Grails"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
    <link href='http://fonts.googleapis.com/css?family=Quando' rel='stylesheet' type='text/css'>
    
    <r:require module="application"/>
    <g:layoutHead/>
    <r:layoutResources />
</head>
<body>
  <div id="wrapper">
    <div id="barraNavegacao">
      <div class="conteudo">
        <img src="${resource(dir: 'images', file: 'proprio/facisa.png')}" alt="Facisa" style="width: 60px; margin-right: 20px;" />
        <img src="${resource(dir: 'images', file: 'proprio/fcm.png')}" alt="FCM" style="width: 70px; margin-right: 20px;" />
        <img src="${resource(dir: 'images', file: 'proprio/esac.png')}" alt="Esac" style="width: 70px; margin-right: 20px;" />
        <p>
        <sec:username /> (<g:link controller="logout">sair</g:link>)
        </p>
      </div>
    </div>
    <div id="content">
      <div id="sidebarEsq">
        <h1>EventosWeb</h1>
        <nav>
          <ul id="nav-primary" class="vertical">    
            <li class="item01" style="border-top: 1px solid #e2e2e2;"><img src="${resource(dir: 'images', file: 'proprio/home.png')}" alt="">
              <a href="${createLink(uri: '/')}">Inicial</a>
            </li>
            <li class="item02"><img src="${resource(dir: 'images', file: 'proprio/eventos.png')}" alt="">
            <g:link controller="evento" action="list">Eventos</g:link>
            </li>
            <li class="item03"><img src="${resource(dir: 'images', file: 'proprio/usuario.png')}" alt="">
            <g:link controller="participante" action="list">Participante</g:link>
            </li>
            <li class="item04"><img src="${resource(dir: 'images', file: 'proprio/miscelandia.png')}" alt="">
              <a href="#">Miscelândia</a>
            </li>
            <li class="item06"><img src="${resource(dir: 'images', file: 'proprio/relatorios.png')}" alt="">
              <g:link controller="relatorio" action="resumo">Relatórios</g:link>
            </li>
            <li class="item07"><img src="${resource(dir: 'images', file: 'proprio/financeiro.png')}" alt="">
            <g:link controller="baixa" action="list">Financeiro</g:link>
            </li>
            <li class="item05"><img src="${resource(dir: 'images', file: 'proprio/usuario.png')}" alt="">
            <g:link controller="usuario" action="list">Usuários</g:link>
            </li>
            <li class="item07"><img src="${resource(dir: 'images', file: 'proprio/usuarioGrupo.png')}" alt="">
            <g:link controller="usuarioGrupo" action="list">Usuários / Grupos</g:link>
            </li>
            <li class="item07"><img src="${resource(dir: 'images', file: 'proprio/senha.png')}" alt="">
            <g:link controller="usuario" action="editSenha" params="[id: 1]">Mudar Senha</g:link>
            </li>
          </ul>
        </nav>
        <div class="final">&nbsp;</div>
      </div>
      <div id="corpo">
        <g:layoutBody/>
      </div>
    </div>
    <div id="footer">
      <div class="texto">
        <p>&copy; Cesed - Centro de Ensino Superior e Desenvolvimento<br />Desenvolvido por: <a href="http://about.me/alissondiniz">Alisson Diniz</a> e <a href="http://about.me/vandrepaulo">Vandré Paulo</a></p>
      </div>
    </div>
  </div>
  <div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
  <g:javascript library="application"/>
  <r:layoutResources />
</body>
</html>