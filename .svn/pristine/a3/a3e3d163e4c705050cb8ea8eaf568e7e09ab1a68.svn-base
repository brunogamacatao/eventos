<%@ page import="eventos.Titulo" %>



<div class="fieldcontain ${hasErrors(bean: tituloInstance, field: 'valor', 'error')} required">
	<label for="valor">
		<g:message code="titulo.valor.label" default="Valor" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="valor" value="${fieldValue(bean: tituloInstance, field: 'valor')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: tituloInstance, field: 'dataVencimento', 'error')} required">
	<label for="dataVencimento">
		<g:message code="titulo.dataVencimento.label" default="Data Vencimento" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dataVencimento" precision="day"  value="${tituloInstance?.dataVencimento}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: tituloInstance, field: 'nossoNumero', 'error')} required">
	<label for="nossoNumero">
		<g:message code="titulo.nossoNumero.label" default="Nosso Numero" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nossoNumero" required="" value="${tituloInstance?.nossoNumero}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tituloInstance, field: 'linhaDigitavel', 'error')} required">
	<label for="linhaDigitavel">
		<g:message code="titulo.linhaDigitavel.label" default="Linha Digitavel" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="linhaDigitavel" required="" value="${tituloInstance?.linhaDigitavel}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tituloInstance, field: 'baixa', 'error')} required">
	<label for="baixa">
		<g:message code="titulo.baixa.label" default="Baixa" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="baixa" name="baixa.id" from="${eventos.Baixa.list()}" optionKey="id" required="" value="${tituloInstance?.baixa?.id}" class="many-to-one"/>
</div>

