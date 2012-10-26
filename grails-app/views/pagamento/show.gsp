
<%@ page import="eventos.Pagamento" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pagamento.label', default: 'Pagamento')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-pagamento" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="enviarArquivo">Enviar Arquivo</g:link></li>
			</ul>
		</div>
		<div id="show-pagamento" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list pagamento">
			
				<g:if test="${pagamentoInstance?.nossoNumero}">
				<li class="fieldcontain">
					<span id="nossoNumero-label" class="property-label"><g:message code="pagamento.nossoNumero.label" default="Nosso Numero" /></span>
					
						<span class="property-value" aria-labelledby="nossoNumero-label"><g:fieldValue bean="${pagamentoInstance}" field="nossoNumero"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pagamentoInstance?.dataPagamento}">
				<li class="fieldcontain">
					<span id="dataPagamento-label" class="property-label"><g:message code="pagamento.dataPagamento.label" default="Data Pagamento" /></span>
					
						<span class="property-value" aria-labelledby="dataPagamento-label"><g:formatDate date="${pagamentoInstance?.dataPagamento}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${pagamentoInstance?.valor}">
				<li class="fieldcontain">
					<span id="valor-label" class="property-label"><g:message code="pagamento.valor.label" default="Valor" /></span>
					
						<span class="property-value" aria-labelledby="valor-label"><g:fieldValue bean="${pagamentoInstance}" field="valor"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pagamentoInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="pagamento.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${pagamentoInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${pagamentoInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="pagamento.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${pagamentoInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${pagamentoInstance?.observacao}">
				<li class="fieldcontain">
					<span id="observacao-label" class="property-label"><g:message code="pagamento.observacao.label" default="Observacao" /></span>
					
						<span class="property-value" aria-labelledby="observacao-label"><g:fieldValue bean="${pagamentoInstance}" field="observacao"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pagamentoInstance?.titulo}">
				<li class="fieldcontain">
					<span id="titulo-label" class="property-label"><g:message code="pagamento.titulo.label" default="Titulo" /></span>
					
						<span class="property-value" aria-labelledby="titulo-label"><g:link controller="titulo" action="show" id="${pagamentoInstance?.titulo?.id}">${pagamentoInstance?.titulo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${pagamentoInstance?.usuario}">
				<li class="fieldcontain">
					<span id="usuario-label" class="property-label"><g:message code="pagamento.usuario.label" default="Usuario" /></span>
					
						<span class="property-value" aria-labelledby="usuario-label"><g:link controller="usuario" action="show" id="${pagamentoInstance?.usuario?.id}">${pagamentoInstance?.usuario?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${pagamentoInstance?.id}" />
					<g:link class="edit" action="edit" id="${pagamentoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
