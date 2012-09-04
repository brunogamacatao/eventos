
<%@ page import="eventos.Baixa" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'baixa.label', default: 'Baixa')}" />
  <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
  <a href="#list-baixa" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
  <div class="nav" role="navigation">
    <ul>
      <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
    </ul>
  </div>
  <div id="list-baixa" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
      <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
      <thead>
        <tr>

      <g:sortableColumn property="dataPagamento" title="${message(code: 'baixa.dataPagamento.label', default: 'Data Pagamento')}" />

      <g:sortableColumn property="valorPago" title="${message(code: 'baixa.valorPago.label', default: 'Valor Pago')}" />

      <g:sortableColumn property="observacao" title="${message(code: 'baixa.observacao.label', default: 'Observacao')}" />

      <th><g:message code="baixa.usuario.label" default="Usuario" /></th>

      <g:sortableColumn property="dateCreated" title="${message(code: 'baixa.dateCreated.label', default: 'Date Created')}" />

      <g:sortableColumn property="lastUpdated" title="${message(code: 'baixa.lastUpdated.label', default: 'Last Updated')}" />

      </tr>
      </thead>
      <tbody>
      <g:each in="${baixaInstanceList}" status="i" var="baixaInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

          <td><g:link action="show" id="${baixaInstance.id}">${fieldValue(bean: baixaInstance, field: "dataPagamento")}</g:link></td>

        <td>${fieldValue(bean: baixaInstance, field: "valorPago")}</td>

        <td>${fieldValue(bean: baixaInstance, field: "observacao")}</td>

        <td>${fieldValue(bean: baixaInstance, field: "usuario")}</td>

        <td><g:formatDate date="${baixaInstance.dateCreated}" /></td>

        <td><g:formatDate date="${baixaInstance.lastUpdated}" /></td>

        </tr>
      </g:each>
      </tbody>
    </table>
    <div class="pagination">
      <g:paginate total="${baixaInstanceTotal}" />
    </div>
  </div>
</body>
</html>
