
<%@ page import="eventos.Evento" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'evento.label', default: 'Evento')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-evento" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-evento" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nome" title="${message(code: 'evento.nome.label', default: 'Nome')}" />
					
						<g:sortableColumn property="data" title="${message(code: 'evento.data.label', default: 'Data')}" />
					
						<g:sortableColumn property="local" title="${message(code: 'evento.local.label', default: 'Local')}" />
					
						<g:sortableColumn property="identificador" title="${message(code: 'evento.identificador.label', default: 'Identificador')}" />
					
						<th><g:message code="evento.logomarca.label" default="Logomarca" /></th>
					
						<th><g:message code="evento.configuracao.label" default="Configuracao" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${eventoInstanceList}" status="i" var="eventoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${eventoInstance.id}">${fieldValue(bean: eventoInstance, field: "nome")}</g:link></td>
					
						<td>${fieldValue(bean: eventoInstance, field: "data")}</td>
					
						<td>${fieldValue(bean: eventoInstance, field: "local")}</td>
					
						<td>${fieldValue(bean: eventoInstance, field: "identificador")}</td>
					
					  <td><g:thumbnail id="${eventoInstance?.logomarca?.id}" width="50" height="50"/></td>
					
						<td>${fieldValue(bean: eventoInstance, field: "configuracao")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${eventoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
