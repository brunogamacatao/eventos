<%@ page import="eventos.Resposta" %>



<div class="fieldcontain ${hasErrors(bean: respostaInstance, field: 'participante', 'error')} required">
	<label for="participante">
		<g:message code="resposta.participante.label" default="Participante" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="participante" name="participante.id" from="${eventos.Participante.list()}" optionKey="id" required="" value="${respostaInstance?.participante?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: respostaInstance, field: 'pergunta', 'error')} required">
	<label for="pergunta">
		<g:message code="resposta.pergunta.label" default="Pergunta" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="pergunta" name="pergunta.id" from="${eventos.Pergunta.list()}" optionKey="id" required="" value="${respostaInstance?.pergunta?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: respostaInstance, field: 'resposta', 'error')} required">
	<label for="resposta">
		<g:message code="resposta.resposta.label" default="Resposta" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="resposta" required="" value="${respostaInstance?.resposta}"/>
</div>

