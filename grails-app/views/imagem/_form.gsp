<%@ page import="eventos.Imagem" %>



<div class="fieldcontain ${hasErrors(bean: imagemInstance, field: 'imagem', 'error')} required">
	<label for="imagem">
		<g:message code="imagem.imagem.label" default="Imagem" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="imagem" name="imagem" />
</div>

<div class="fieldcontain ${hasErrors(bean: imagemInstance, field: 'nomeArquivo', 'error')} required">
	<label for="nomeArquivo">
		<g:message code="imagem.nomeArquivo.label" default="Nome Arquivo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nomeArquivo" required="" value="${imagemInstance?.nomeArquivo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: imagemInstance, field: 'largura', 'error')} required">
	<label for="largura">
		<g:message code="imagem.largura.label" default="Largura" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="largura" type="number" value="${imagemInstance.largura}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: imagemInstance, field: 'altura', 'error')} required">
	<label for="altura">
		<g:message code="imagem.altura.label" default="Altura" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="altura" type="number" value="${imagemInstance.altura}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: imagemInstance, field: 'imagemOriginal', 'error')} ">
	<label for="imagemOriginal">
		<g:message code="imagem.imagemOriginal.label" default="Imagem Original" />
		
	</label>
	<g:select id="imagemOriginal" name="imagemOriginal.id" from="${eventos.Imagem.list()}" optionKey="id" value="${imagemInstance?.imagemOriginal?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: imagemInstance, field: 'thumbnails', 'error')} ">
	<label for="thumbnails">
		<g:message code="imagem.thumbnails.label" default="Thumbnails" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${imagemInstance?.thumbnails?}" var="t">
    <li><g:link controller="imagem" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="imagem" action="create" params="['imagem.id': imagemInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'imagem.label', default: 'Imagem')])}</g:link>
</li>
</ul>

</div>

