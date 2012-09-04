
<%@ page import="eventos.Configuracao" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'configuracao.label', default: 'Configuracao')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-configuracao" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-configuracao" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="banco" title="${message(code: 'configuracao.banco.label', default: 'Banco')}" />
					
						<g:sortableColumn property="agencia" title="${message(code: 'configuracao.agencia.label', default: 'Agencia')}" />
					
						<g:sortableColumn property="conta" title="${message(code: 'configuracao.conta.label', default: 'Conta')}" />
					
						<g:sortableColumn property="carteira" title="${message(code: 'configuracao.carteira.label', default: 'Carteira')}" />
					
						<g:sortableColumn property="convenio" title="${message(code: 'configuracao.convenio.label', default: 'Convenio')}" />
					
						<g:sortableColumn property="operacao" title="${message(code: 'configuracao.operacao.label', default: 'Operacao')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${configuracaoInstanceList}" status="i" var="configuracaoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${configuracaoInstance.id}">${fieldValue(bean: configuracaoInstance, field: "banco")}</g:link></td>
					
						<td>${fieldValue(bean: configuracaoInstance, field: "agencia")}</td>
					
						<td>${fieldValue(bean: configuracaoInstance, field: "conta")}</td>
					
						<td>${fieldValue(bean: configuracaoInstance, field: "carteira")}</td>
					
						<td>${fieldValue(bean: configuracaoInstance, field: "convenio")}</td>
					
						<td>${fieldValue(bean: configuracaoInstance, field: "operacao")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${configuracaoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
