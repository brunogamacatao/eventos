
<%@ page import="eventos.Pagamento" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pagamento.label', default: 'Pagamento')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-pagamento" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-pagamento" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nossoNumero" title="${message(code: 'pagamento.nossoNumero.label', default: 'Nosso Numero')}" />
					
						<g:sortableColumn property="dataPagamento" title="${message(code: 'pagamento.dataPagamento.label', default: 'Data Pagamento')}" />
					
						<g:sortableColumn property="valor" title="${message(code: 'pagamento.valor.label', default: 'Valor')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'pagamento.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'pagamento.lastUpdated.label', default: 'Last Updated')}" />
					
						<g:sortableColumn property="observacao" title="${message(code: 'pagamento.observacao.label', default: 'Observacao')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${pagamentoInstanceList}" status="i" var="pagamentoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${pagamentoInstance.id}">${fieldValue(bean: pagamentoInstance, field: "nossoNumero")}</g:link></td>
					
						<td><g:formatDate date="${pagamentoInstance.dataPagamento}" /></td>
					
						<td>${fieldValue(bean: pagamentoInstance, field: "valor")}</td>
					
						<td><g:formatDate date="${pagamentoInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${pagamentoInstance.lastUpdated}" /></td>
					
						<td>${fieldValue(bean: pagamentoInstance, field: "observacao")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${pagamentoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
