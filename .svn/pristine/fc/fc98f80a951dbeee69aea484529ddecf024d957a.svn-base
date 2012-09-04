
<%@ page import="eventos.Configuracao" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'configuracao.label', default: 'Configuracao')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-configuracao" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-configuracao" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list configuracao">
			
				<g:if test="${configuracaoInstance?.banco}">
				<li class="fieldcontain">
					<span id="banco-label" class="property-label"><g:message code="configuracao.banco.label" default="Banco" /></span>
					
						<span class="property-value" aria-labelledby="banco-label"><g:fieldValue bean="${configuracaoInstance}" field="banco"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${configuracaoInstance?.agencia}">
				<li class="fieldcontain">
					<span id="agencia-label" class="property-label"><g:message code="configuracao.agencia.label" default="Agencia" /></span>
					
						<span class="property-value" aria-labelledby="agencia-label"><g:fieldValue bean="${configuracaoInstance}" field="agencia"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${configuracaoInstance?.conta}">
				<li class="fieldcontain">
					<span id="conta-label" class="property-label"><g:message code="configuracao.conta.label" default="Conta" /></span>
					
						<span class="property-value" aria-labelledby="conta-label"><g:fieldValue bean="${configuracaoInstance}" field="conta"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${configuracaoInstance?.carteira}">
				<li class="fieldcontain">
					<span id="carteira-label" class="property-label"><g:message code="configuracao.carteira.label" default="Carteira" /></span>
					
						<span class="property-value" aria-labelledby="carteira-label"><g:fieldValue bean="${configuracaoInstance}" field="carteira"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${configuracaoInstance?.convenio}">
				<li class="fieldcontain">
					<span id="convenio-label" class="property-label"><g:message code="configuracao.convenio.label" default="Convenio" /></span>
					
						<span class="property-value" aria-labelledby="convenio-label"><g:fieldValue bean="${configuracaoInstance}" field="convenio"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${configuracaoInstance?.operacao}">
				<li class="fieldcontain">
					<span id="operacao-label" class="property-label"><g:message code="configuracao.operacao.label" default="Operacao" /></span>
					
						<span class="property-value" aria-labelledby="operacao-label"><g:fieldValue bean="${configuracaoInstance}" field="operacao"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${configuracaoInstance?.id}" />
					<g:link class="edit" action="edit" id="${configuracaoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
