<%@ page import="eventos.Titulo" %>



<div class="fieldcontain ${hasErrors(bean: tituloInstance, field: 'valor', 'error')} required">
	<label for="valor">
		<g:message code="titulo.valor.label" default="Valor" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="valor" required="" value="${fieldValue(bean: tituloInstance, field: 'valor')}"/>
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

<div class="fieldcontain ${hasErrors(bean: tituloInstance, field: 'participante', 'error')} required">
	<label for="participante">
		<g:message code="titulo.participante.label" default="Participante" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="participante" name="participante.id" from="${eventos.Participante.list()}" optionKey="id" required="" value="${tituloInstance?.participante?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tituloInstance, field: 'pagamentos', 'error')} ">
	<label for="pagamentos">
		<g:message code="titulo.pagamentos.label" default="Pagamentos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${tituloInstance?.pagamentos?}" var="p">
    <li><g:link controller="pagamento" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="pagamento" action="create" params="['titulo.id': tituloInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'pagamento.label', default: 'Pagamento')])}</g:link>
</li>
</ul>

</div>

