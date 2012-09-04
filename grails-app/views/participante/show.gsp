
<%@ page import="eventos.Participante" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'participante.label', default: 'Participante')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-participante" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-participante" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list participante">
			
				<g:if test="${participanteInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="participante.nome.label" default="Nome" /></span>
					
						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${participanteInstance}" field="nome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${participanteInstance?.sexo}">
				<li class="fieldcontain">
					<span id="sexo-label" class="property-label"><g:message code="participante.sexo.label" default="Sexo" /></span>
					
						<span class="property-value" aria-labelledby="sexo-label"><g:fieldValue bean="${participanteInstance}" field="sexo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${participanteInstance?.dataNascimento}">
				<li class="fieldcontain">
					<span id="dataNascimento-label" class="property-label"><g:message code="participante.dataNascimento.label" default="Data Nascimento" /></span>
					
						<span class="property-value" aria-labelledby="dataNascimento-label"><g:formatDate date="${participanteInstance?.dataNascimento}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${participanteInstance?.cpf}">
				<li class="fieldcontain">
					<span id="cpf-label" class="property-label"><g:message code="participante.cpf.label" default="Cpf" /></span>
					
						<span class="property-value" aria-labelledby="cpf-label"><g:fieldValue bean="${participanteInstance}" field="cpf"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${participanteInstance?.rg}">
				<li class="fieldcontain">
					<span id="rg-label" class="property-label"><g:message code="participante.rg.label" default="Rg" /></span>
					
						<span class="property-value" aria-labelledby="rg-label"><g:fieldValue bean="${participanteInstance}" field="rg"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${participanteInstance?.orgaoEmissor}">
				<li class="fieldcontain">
					<span id="orgaoEmissor-label" class="property-label"><g:message code="participante.orgaoEmissor.label" default="Orgao Emissor" /></span>
					
						<span class="property-value" aria-labelledby="orgaoEmissor-label"><g:fieldValue bean="${participanteInstance}" field="orgaoEmissor"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${participanteInstance?.estadoRG}">
				<li class="fieldcontain">
					<span id="estadoRG-label" class="property-label"><g:message code="participante.estadoRG.label" default="Estado RG" /></span>
					
						<span class="property-value" aria-labelledby="estadoRG-label"><g:fieldValue bean="${participanteInstance}" field="estadoRG"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${participanteInstance?.estadoCivil}">
				<li class="fieldcontain">
					<span id="estadoCivil-label" class="property-label"><g:message code="participante.estadoCivil.label" default="Estado Civil" /></span>
					
						<span class="property-value" aria-labelledby="estadoCivil-label"><g:fieldValue bean="${participanteInstance}" field="estadoCivil"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${participanteInstance?.nacionalidade}">
				<li class="fieldcontain">
					<span id="nacionalidade-label" class="property-label"><g:message code="participante.nacionalidade.label" default="Nacionalidade" /></span>
					
						<span class="property-value" aria-labelledby="nacionalidade-label"><g:fieldValue bean="${participanteInstance}" field="nacionalidade"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${participanteInstance?.pais}">
				<li class="fieldcontain">
					<span id="pais-label" class="property-label"><g:message code="participante.pais.label" default="Pais" /></span>
					
						<span class="property-value" aria-labelledby="pais-label"><g:fieldValue bean="${participanteInstance}" field="pais"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${participanteInstance?.estadoNaturalidade}">
				<li class="fieldcontain">
					<span id="estadoNaturalidade-label" class="property-label"><g:message code="participante.estadoNaturalidade.label" default="Estado Naturalidade" /></span>
					
						<span class="property-value" aria-labelledby="estadoNaturalidade-label"><g:fieldValue bean="${participanteInstance}" field="estadoNaturalidade"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${participanteInstance?.cidadeNaturalidade}">
				<li class="fieldcontain">
					<span id="cidadeNaturalidade-label" class="property-label"><g:message code="participante.cidadeNaturalidade.label" default="Cidade Naturalidade" /></span>
					
						<span class="property-value" aria-labelledby="cidadeNaturalidade-label"><g:fieldValue bean="${participanteInstance}" field="cidadeNaturalidade"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${participanteInstance?.cep}">
				<li class="fieldcontain">
					<span id="cep-label" class="property-label"><g:message code="participante.cep.label" default="Cep" /></span>
					
						<span class="property-value" aria-labelledby="cep-label"><g:fieldValue bean="${participanteInstance}" field="cep"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${participanteInstance?.rua}">
				<li class="fieldcontain">
					<span id="rua-label" class="property-label"><g:message code="participante.rua.label" default="Rua" /></span>
					
						<span class="property-value" aria-labelledby="rua-label"><g:fieldValue bean="${participanteInstance}" field="rua"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${participanteInstance?.numero}">
				<li class="fieldcontain">
					<span id="numero-label" class="property-label"><g:message code="participante.numero.label" default="Numero" /></span>
					
						<span class="property-value" aria-labelledby="numero-label"><g:fieldValue bean="${participanteInstance}" field="numero"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${participanteInstance?.bairro}">
				<li class="fieldcontain">
					<span id="bairro-label" class="property-label"><g:message code="participante.bairro.label" default="Bairro" /></span>
					
						<span class="property-value" aria-labelledby="bairro-label"><g:fieldValue bean="${participanteInstance}" field="bairro"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${participanteInstance?.cidade}">
				<li class="fieldcontain">
					<span id="cidade-label" class="property-label"><g:message code="participante.cidade.label" default="Cidade" /></span>
					
						<span class="property-value" aria-labelledby="cidade-label"><g:fieldValue bean="${participanteInstance}" field="cidade"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${participanteInstance?.telefone1}">
				<li class="fieldcontain">
					<span id="telefone1-label" class="property-label"><g:message code="participante.telefone1.label" default="Telefone1" /></span>
					
						<span class="property-value" aria-labelledby="telefone1-label"><g:fieldValue bean="${participanteInstance}" field="telefone1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${participanteInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="participante.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${participanteInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${participanteInstance?.complemento}">
				<li class="fieldcontain">
					<span id="complemento-label" class="property-label"><g:message code="participante.complemento.label" default="Complemento" /></span>
					
						<span class="property-value" aria-labelledby="complemento-label"><g:fieldValue bean="${participanteInstance}" field="complemento"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${participanteInstance?.estado}">
				<li class="fieldcontain">
					<span id="estado-label" class="property-label"><g:message code="participante.estado.label" default="Estado" /></span>
					
						<span class="property-value" aria-labelledby="estado-label"><g:fieldValue bean="${participanteInstance}" field="estado"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${participanteInstance?.socio}">
				<li class="fieldcontain">
					<span id="socio-label" class="property-label"><g:message code="participante.socio.label" default="Socio" /></span>
					
						<span class="property-value" aria-labelledby="socio-label"><g:fieldValue bean="${participanteInstance}" field="socio"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${participanteInstance?.comprovante}">
				<li class="fieldcontain">
					<span id="comprovante-label" class="property-label"><g:message code="participante.comprovante.label" default="Comprovante" /></span>
					
						<span class="property-value" aria-labelledby="comprovante-label"><g:link controller="imagem" action="show" id="${participanteInstance?.comprovante?.id}">${participanteInstance?.comprovante?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${participanteInstance?.telefone2}">
				<li class="fieldcontain">
					<span id="telefone2-label" class="property-label"><g:message code="participante.telefone2.label" default="Telefone2" /></span>
					
						<span class="property-value" aria-labelledby="telefone2-label"><g:fieldValue bean="${participanteInstance}" field="telefone2"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${participanteInstance?.id}" />
					<g:link class="edit" action="edit" id="${participanteInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
