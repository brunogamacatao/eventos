
<%@ page import="eventos.Titulo" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'titulo.label', default: 'Titulo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-titulo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-titulo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list titulo">
			
				<g:if test="${tituloInstance?.valor}">
				<li class="fieldcontain">
					<span id="valor-label" class="property-label"><g:message code="titulo.valor.label" default="Valor" /></span>
					
						<span class="property-value" aria-labelledby="valor-label"><g:fieldValue bean="${tituloInstance}" field="valor"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tituloInstance?.dataVencimento}">
				<li class="fieldcontain">
					<span id="dataVencimento-label" class="property-label"><g:message code="titulo.dataVencimento.label" default="Data Vencimento" /></span>
					
						<span class="property-value" aria-labelledby="dataVencimento-label"><g:formatDate date="${tituloInstance?.dataVencimento}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${tituloInstance?.nossoNumero}">
				<li class="fieldcontain">
					<span id="nossoNumero-label" class="property-label"><g:message code="titulo.nossoNumero.label" default="Nosso Numero" /></span>
					
						<span class="property-value" aria-labelledby="nossoNumero-label"><g:fieldValue bean="${tituloInstance}" field="nossoNumero"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tituloInstance?.linhaDigitavel}">
				<li class="fieldcontain">
					<span id="linhaDigitavel-label" class="property-label"><g:message code="titulo.linhaDigitavel.label" default="Linha Digitavel" /></span>
					
						<span class="property-value" aria-labelledby="linhaDigitavel-label"><g:fieldValue bean="${tituloInstance}" field="linhaDigitavel"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tituloInstance?.baixa}">
				<li class="fieldcontain">
					<span id="baixa-label" class="property-label"><g:message code="titulo.baixa.label" default="Baixa" /></span>
					
						<span class="property-value" aria-labelledby="baixa-label"><g:link controller="baixa" action="show" id="${tituloInstance?.baixa?.id}">${tituloInstance?.baixa?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${tituloInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="titulo.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${tituloInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${tituloInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="titulo.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${tituloInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${tituloInstance?.id}" />
					<g:link class="edit" action="edit" id="${tituloInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
