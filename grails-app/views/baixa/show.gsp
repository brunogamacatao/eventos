
<%@ page import="eventos.Baixa" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'baixa.label', default: 'Baixa')}" />
  <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
  <a href="#show-baixa" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
  <div class="nav" role="navigation">
    <ul>
      <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
      <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
      <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
    </ul>
  </div>
  <div id="show-baixa" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
      <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list baixa">

      <g:if test="${baixaInstance?.dataPagamento}">
        <li class="fieldcontain">
          <span id="dataPagamento-label" class="property-label"><g:message code="baixa.dataPagamento.label" default="Data Pagamento" /></span>

          <span class="property-value" aria-labelledby="dataPagamento-label"><g:formatDate date="${baixaInstance?.dataPagamento}" /></span>

        </li>
      </g:if>

      <g:if test="${baixaInstance?.valorPago}">
        <li class="fieldcontain">
          <span id="valorPago-label" class="property-label"><g:message code="baixa.valorPago.label" default="Valor Pago" /></span>

          <span class="property-value" aria-labelledby="valorPago-label"><g:fieldValue bean="${baixaInstance}" field="valorPago"/></span>

        </li>
      </g:if>

      <g:if test="${baixaInstance?.observacao}">
        <li class="fieldcontain">
          <span id="observacao-label" class="property-label"><g:message code="baixa.observacao.label" default="Observacao" /></span>

          <span class="property-value" aria-labelledby="observacao-label"><g:fieldValue bean="${baixaInstance}" field="observacao"/></span>

        </li>
      </g:if>

      <g:if test="${baixaInstance?.usuario}">
        <li class="fieldcontain">
          <span id="usuario-label" class="property-label"><g:message code="baixa.usuario.label" default="Usuario" /></span>

          <span class="property-value" aria-labelledby="usuario-label"><g:link controller="usuario" action="show" id="${baixaInstance?.usuario?.id}">${baixaInstance?.usuario?.encodeAsHTML()}</g:link></span>

        </li>
      </g:if>

      <g:if test="${baixaInstance?.dateCreated}">
        <li class="fieldcontain">
          <span id="dateCreated-label" class="property-label"><g:message code="baixa.dateCreated.label" default="Date Created" /></span>

          <span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${baixaInstance?.dateCreated}" /></span>

        </li>
      </g:if>

      <g:if test="${baixaInstance?.lastUpdated}">
        <li class="fieldcontain">
          <span id="lastUpdated-label" class="property-label"><g:message code="baixa.lastUpdated.label" default="Last Updated" /></span>

          <span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${baixaInstance?.lastUpdated}" /></span>

        </li>
      </g:if>

      <g:if test="${baixaInstance?.titulo}">
        <li class="fieldcontain">
          <span id="titulo-label" class="property-label"><g:message code="baixa.titulo.label" default="Titulo" /></span>

          <span class="property-value" aria-labelledby="titulo-label"><g:link controller="titulo" action="show" id="${baixaInstance?.titulo?.id}">${baixaInstance?.titulo?.encodeAsHTML()}</g:link></span>

        </li>
      </g:if>

    </ol>
    <g:form>
      <fieldset class="buttons">
        <g:hiddenField name="id" value="${baixaInstance?.id}" />
        <g:link class="edit" action="edit" id="${baixaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
        <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
      </fieldset>
    </g:form>
  </div>
</body>
</html>
