
<%@ page import="eventos.Questionario" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'questionario.label', default: 'Questionario')}" />
  <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
  <a href="#show-questionario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
  <div class="nav" role="navigation">
    <ul>
      <li>
        <a class="voltar" href="${createLink(controller: 'evento', action: 'show', id: questionarioInstance?.evento?.id)}">
          <g:message code="Voltar"/>
        </a>
      </li>
    </ul>
  </div>
  <div id="show-questionario" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
      <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list questionario">
      <g:if test="${questionarioInstance?.perguntas}">
        <li class="fieldcontain">
          <span id="perguntas-label" class="property-label"><g:message code="questionario.perguntas.label" default="Perguntas" /></span>
        <g:each in="${questionarioInstance.perguntas}" var="p">
          <span class="property-value" aria-labelledby="perguntas-label"><g:link controller="pergunta" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
        </g:each>
        </li>
      </g:if>
    </ol>
    <g:form>
      <fieldset class="buttons">
        <g:link class="create" controller="pergunta" action="create" params="['questionario.id': questionarioInstance?.id]">
          Adicionar Pergunta
        </g:link>
      </fieldset>
    </g:form>
  </div>
</body>
</html>
