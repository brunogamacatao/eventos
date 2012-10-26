<%@ page import="eventos.Pagamento" %>

<!doctype html>
<html>
  <head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'pagamento.label', default: 'Pagamento')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
  </head>
  <body>
    <div class="nav" role="navigation">
      <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
      </ul>
    </div>
    <div id="create-pagamento" class="content scaffold-create" role="main">
      <h1>Fazer upload de arquivo bancário</h1>
      <g:uploadForm name="meuUpload" action="upload">
        <fieldset class="form">
          <div class="fieldcontain ${hasErrors(bean: pagamentoInstance, field: 'dataPagamento', 'error')} required">
            <label for="dataPagamento">Arquivo</label>
            <input type="file" name="arquivo" />
          </div>
        </fieldset>
        <fieldset class="buttons">
          <g:submitButton name="enviar" class="save" value="Enviar" />
        </fieldset>
      </g:uploadForm>
    </div>
  </body>
</html>