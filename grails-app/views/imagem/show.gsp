
<%@ page import="eventos.Imagem" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'imagem.label', default: 'Imagem')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-imagem" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-imagem" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list imagem">
			
				<g:if test="${imagemInstance?.imagem}">
				<li class="fieldcontain">
					<span id="imagem-label" class="property-label"><g:message code="imagem.imagem.label" default="Imagem" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${imagemInstance?.nomeArquivo}">
				<li class="fieldcontain">
					<span id="nomeArquivo-label" class="property-label"><g:message code="imagem.nomeArquivo.label" default="Nome Arquivo" /></span>
					
						<span class="property-value" aria-labelledby="nomeArquivo-label"><g:fieldValue bean="${imagemInstance}" field="nomeArquivo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${imagemInstance?.largura}">
				<li class="fieldcontain">
					<span id="largura-label" class="property-label"><g:message code="imagem.largura.label" default="Largura" /></span>
					
						<span class="property-value" aria-labelledby="largura-label"><g:fieldValue bean="${imagemInstance}" field="largura"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${imagemInstance?.altura}">
				<li class="fieldcontain">
					<span id="altura-label" class="property-label"><g:message code="imagem.altura.label" default="Altura" /></span>
					
						<span class="property-value" aria-labelledby="altura-label"><g:fieldValue bean="${imagemInstance}" field="altura"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${imagemInstance?.imagemOriginal}">
				<li class="fieldcontain">
					<span id="imagemOriginal-label" class="property-label"><g:message code="imagem.imagemOriginal.label" default="Imagem Original" /></span>
					
						<span class="property-value" aria-labelledby="imagemOriginal-label"><g:link controller="imagem" action="show" id="${imagemInstance?.imagemOriginal?.id}">${imagemInstance?.imagemOriginal?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${imagemInstance?.thumbnails}">
				<li class="fieldcontain">
					<span id="thumbnails-label" class="property-label"><g:message code="imagem.thumbnails.label" default="Thumbnails" /></span>
					
						<g:each in="${imagemInstance.thumbnails}" var="t">
						<span class="property-value" aria-labelledby="thumbnails-label"><g:link controller="imagem" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${imagemInstance?.id}" />
					<g:link class="edit" action="edit" id="${imagemInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
