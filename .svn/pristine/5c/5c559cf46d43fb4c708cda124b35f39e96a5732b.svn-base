
<%@ page import="eventos.OpcaoResposta" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'opcaoResposta.label', default: 'OpcaoResposta')}" />
  <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
  <a href="#show-opcaoResposta" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
  <div class="nav" role="navigation">
    <ul>
      <li>
        <a class="voltar" href="${createLink(controller: 'pergunta', action: 'show', id: opcaoRespostaInstance?.pergunta?.id)}">
          <g:message code="Voltar"/>
        </a>
      </li>
    </ul>
  </div>
  <div id="show-opcaoResposta" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
      <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list opcaoResposta">

      <g:if test="${opcaoRespostaInstance?.descricao}">
        <li class="fieldcontain">
          <span id="descricao-label" class="property-label"><g:message code="opcaoResposta.descricao.label" default="Descricao" /></span>

          <span class="property-value" aria-labelledby="descricao-label"><g:fieldValue bean="${opcaoRespostaInstance}" field="descricao"/></span>

        </li>
      </g:if>

    </ol>
    <g:form>
      <fieldset class="buttons">
        <g:hiddenField name="id" value="${opcaoRespostaInstance?.id}" />
        <g:link class="edit" action="edit" id="${opcaoRespostaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
        <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
      </fieldset>
    </g:form>
  </div>
</body>
</html>
