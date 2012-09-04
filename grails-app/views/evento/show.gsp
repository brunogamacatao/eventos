
<%@ page import="eventos.Evento" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'evento.label', default: 'Evento')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-evento" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-evento" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list evento">
			
				<g:if test="${eventoInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="evento.nome.label" default="Nome" /></span>
					
						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${eventoInstance}" field="nome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${eventoInstance?.data}">
				<li class="fieldcontain">
					<span id="data-label" class="property-label"><g:message code="evento.data.label" default="Data" /></span>
					
						<span class="property-value" aria-labelledby="data-label"><g:fieldValue bean="${eventoInstance}" field="data"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${eventoInstance?.local}">
				<li class="fieldcontain">
					<span id="local-label" class="property-label"><g:message code="evento.local.label" default="Local" /></span>
					
						<span class="property-value" aria-labelledby="local-label"><g:fieldValue bean="${eventoInstance}" field="local"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${eventoInstance?.identificador}">
				<li class="fieldcontain">
					<span id="identificador-label" class="property-label"><g:message code="evento.identificador.label" default="Identificador" /></span>
					
						<span class="property-value" aria-labelledby="identificador-label"><g:fieldValue bean="${eventoInstance}" field="identificador"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${eventoInstance?.logomarca}">
				<li class="fieldcontain">
					<span id="logomarca-label" class="property-label"><g:message code="evento.logomarca.label" default="Logomarca" /></span>
					
            <span class="property-value" aria-labelledby="logomarca-label"><g:thumbnail id="${eventoInstance?.logomarca?.id}"/></span>					  
					
				</li>
				</g:if>
			
				<g:if test="${eventoInstance?.configuracao}">
				<li class="fieldcontain">
					<span id="configuracao-label" class="property-label"><g:message code="evento.configuracao.label" default="Configuracao" /></span>
					
						<span class="property-value" aria-labelledby="configuracao-label"><g:link controller="configuracao" action="show" id="${eventoInstance?.configuracao?.id}">${eventoInstance?.configuracao?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${eventoInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="evento.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${eventoInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${eventoInstance?.dataTermino}">
				<li class="fieldcontain">
					<span id="dataTermino-label" class="property-label"><g:message code="evento.dataTermino.label" default="Data Termino" /></span>
					
						<span class="property-value" aria-labelledby="dataTermino-label"><g:formatDate date="${eventoInstance?.dataTermino}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${eventoInstance?.desconto}">
				<li class="fieldcontain">
					<span id="desconto-label" class="property-label"><g:message code="evento.desconto.label" default="Desconto" /></span>
					
						<span class="property-value" aria-labelledby="desconto-label"><g:fieldValue bean="${eventoInstance}" field="desconto"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${eventoInstance?.css}">
				<li class="fieldcontain">
					<span id="css-label" class="property-label"><g:message code="evento.css.label" default="Css" /></span>
					
						<span class="property-value" aria-labelledby="css-label"><g:fieldValue bean="${eventoInstance}" field="css"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${eventoInstance?.cursos}">
				<li class="fieldcontain">
					<span id="cursos-label" class="property-label"><g:message code="evento.cursos.label" default="Cursos" /></span>
					
						<g:each in="${eventoInstance.cursos}" var="c">
						<span class="property-value" aria-labelledby="cursos-label"><g:link controller="curso" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${eventoInstance?.id}" />
					<g:link class="edit" action="edit" id="${eventoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
