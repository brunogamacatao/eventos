
<%@ page import="eventos.Pergunta" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'pergunta.label', default: 'Pergunta')}" />
  <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
  <a href="#show-pergunta" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
  <div class="nav" role="navigation">
    <ul>
      <li>
        <a class="voltar" href="${createLink(controller: 'questionario', action: 'show', id: perguntaInstance?.questionario?.evento?.id)}">
          <g:message code="Voltar"/>
        </a>
      </li>
    </ul>
  </div>
  <div id="show-pergunta" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
      <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list pergunta">
      <g:if test="${perguntaInstance?.titulo}">
        <li class="fieldcontain">
          <span id="tipo-label" class="property-label"><g:message code="pergunta.titulo.label" default="Titulo" /></span>
          <span class="property-value" aria-labelledby="titulo-label"><g:fieldValue bean="${perguntaInstance}" field="titulo"/></span>
        </li>
      </g:if>
      <g:if test="${perguntaInstance?.tipo}">
        <li class="fieldcontain">
          <span id="tipo-label" class="property-label"><g:message code="pergunta.tipo.label" default="Tipo" /></span>
          <span class="property-value" aria-labelledby="tipo-label"><g:fieldValue bean="${perguntaInstance}" field="tipo"/></span>
        </li>
      </g:if>
      <g:if test="${perguntaInstance?.opcoes}">
        <li class="fieldcontain">
          <span id="opcoes-label" class="property-label"><g:message code="pergunta.opcoes.label" default="Opcoes" /></span>
        <g:each in="${perguntaInstance.opcoes}" var="o">
          <span class="property-value" aria-labelledby="opcoes-label"><g:link controller="opcaoResposta" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></span>
        </g:each>
        </li>
      </g:if>
    </ol>
    <g:form>
      <fieldset class="buttons">
        <g:hiddenField name="id" value="${perguntaInstance?.id}" />
        <g:if test="${perguntaInstance?.tipo == 'Objetiva'}">
          <g:link class="create" controller="opcaoResposta" action="create" params="['pergunta.id': perguntaInstance?.id]">
            Adicionar Opção
          </g:link>
        </g:if>
        <g:link class="edit" action="edit" id="${perguntaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
        <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
      </fieldset>
    </g:form>
  </div>
</body>
</html>
