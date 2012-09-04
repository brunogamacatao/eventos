
<%@ page import="eventos.Participante" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'participante.label', default: 'Participante')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-participante" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-participante" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nome" title="${message(code: 'participante.nome.label', default: 'Nome')}" />
					
						<g:sortableColumn property="sexo" title="${message(code: 'participante.sexo.label', default: 'Sexo')}" />
					
						<g:sortableColumn property="dataNascimento" title="${message(code: 'participante.dataNascimento.label', default: 'Data Nascimento')}" />
					
						<g:sortableColumn property="cpf" title="${message(code: 'participante.cpf.label', default: 'Cpf')}" />
					
						<g:sortableColumn property="rg" title="${message(code: 'participante.rg.label', default: 'Rg')}" />
					
						<g:sortableColumn property="orgaoEmissor" title="${message(code: 'participante.orgaoEmissor.label', default: 'Orgao Emissor')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${participanteInstanceList}" status="i" var="participanteInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${participanteInstance.id}">${fieldValue(bean: participanteInstance, field: "nome")}</g:link></td>
					
						<td>${fieldValue(bean: participanteInstance, field: "sexo")}</td>
					
						<td><g:formatDate date="${participanteInstance.dataNascimento}" /></td>
					
						<td>${fieldValue(bean: participanteInstance, field: "cpf")}</td>
					
						<td>${fieldValue(bean: participanteInstance, field: "rg")}</td>
					
						<td>${fieldValue(bean: participanteInstance, field: "orgaoEmissor")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${participanteInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
