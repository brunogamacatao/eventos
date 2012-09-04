
<%@ page import="eventos.Resposta" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'resposta.label', default: 'Resposta')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-resposta" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-resposta" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="resposta.participante.label" default="Participante" /></th>
					
						<th><g:message code="resposta.pergunta.label" default="Pergunta" /></th>
					
						<g:sortableColumn property="resposta" title="${message(code: 'resposta.resposta.label', default: 'Resposta')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${respostaInstanceList}" status="i" var="respostaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${respostaInstance.id}">${fieldValue(bean: respostaInstance, field: "participante")}</g:link></td>
					
						<td>${fieldValue(bean: respostaInstance, field: "pergunta")}</td>
					
						<td>${fieldValue(bean: respostaInstance, field: "resposta")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${respostaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
