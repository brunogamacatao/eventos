
<%@ page import="eventos.Opcao" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'opcao.label', default: 'Opcao')}" />
  <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
  <a href="#show-opcao" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
  <div class="nav" role="navigation">
    <ul>
      <li>
        <a class="voltar" href="${createLink(controller: 'curso', action: 'show', id: opcaoInstance?.curso?.id)}">
          <g:message code="Voltar"/>
        </a>
      </li>
    </ul>
  </div>
  <div id="show-opcao" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
      <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list opcao">
      <g:if test="${opcaoInstance?.descricao}">
        <li class="fieldcontain">
          <span id="descricao-label" class="property-label"><g:message code="opcao.descricao.label" default="Descricao" /></span>
          <span class="property-value" aria-labelledby="descricao-label"><g:fieldValue bean="${opcaoInstance}" field="descricao"/></span>
        </li>
      </g:if>
      <g:if test="${opcaoInstance?.preco}">
        <li class="fieldcontain">
          <span id="preco-label" class="property-label"><g:message code="opcao.preco.label" default="Preco" /></span>
          <span class="property-value" aria-labelledby="preco-label">
            R$ <g:formatNumber number="${opcaoInstance.preco}" type="number" maxFractionDigits="2" minFractionDigits="2"/>
          </span>
        </li>
      </g:if>
      <g:if test="${opcaoInstance?.dataTermino}">
        <li class="fieldcontain">
          <span id="dataTermino-label" class="property-label"><g:message code="opcao.dataTermino.label" default="Data Termino" /></span>
          <span class="property-value" aria-labelledby="dataTermino-label"><g:formatDate date="${opcaoInstance?.dataTermino}" format="dd/MM/yyyy" /></span>
        </li>
      </g:if>
    </ol>
    <g:form>
      <fieldset class="buttons">
        <g:hiddenField name="id" value="${opcaoInstance?.id}" />
        <g:link class="edit" action="edit" id="${opcaoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
        <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
      </fieldset>
    </g:form>
  </div>
</body>
</html>
