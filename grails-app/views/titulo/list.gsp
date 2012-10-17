
<%@ page import="eventos.Titulo" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'titulo.label', default: 'Titulo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-titulo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-titulo" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="valor" title="${message(code: 'titulo.valor.label', default: 'Valor')}" />
					
						<g:sortableColumn property="dataVencimento" title="${message(code: 'titulo.dataVencimento.label', default: 'Data Vencimento')}" />
					
						<g:sortableColumn property="nossoNumero" title="${message(code: 'titulo.nossoNumero.label', default: 'Nosso Numero')}" />
					
						<g:sortableColumn property="linhaDigitavel" title="${message(code: 'titulo.linhaDigitavel.label', default: 'Linha Digitavel')}" />
					
						<th><g:message code="titulo.participante.label" default="Participante" /></th>
					
						<th>Pago</th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${tituloInstanceList}" status="i" var="tituloInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${tituloInstance.id}">${fieldValue(bean: tituloInstance, field: "valor")}</g:link></td>
					
						<td><g:formatDate date="${tituloInstance.dataVencimento}" /></td>
					
						<td>${fieldValue(bean: tituloInstance, field: "nossoNumero")}</td>
					
						<td>${fieldValue(bean: tituloInstance, field: "linhaDigitavel")}</td>
					
						<td>${fieldValue(bean: tituloInstance, field: "participante")}</td>
					
						<td>${tituloInstance?.pago}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${tituloInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
