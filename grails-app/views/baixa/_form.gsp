<%@ page import="eventos.Baixa" %>



<div class="fieldcontain ${hasErrors(bean: baixaInstance, field: 'dataPagamento', 'error')} required">
  <label for="dataPagamento">
    <g:message code="baixa.dataPagamento.label" default="Data Pagamento" />
    <span class="required-indicator">*</span>
  </label>
  <g:datePicker name="dataPagamento" precision="day"  value="${baixaInstance?.dataPagamento}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: baixaInstance, field: 'valorPago', 'error')} required">
  <label for="valorPago">
    <g:message code="baixa.valorPago.label" default="Valor Pago" />
    <span class="required-indicator">*</span>
  </label>
  <g:field name="valorPago" value="${fieldValue(bean: baixaInstance, field: 'valorPago')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: baixaInstance, field: 'observacao', 'error')} required">
  <label for="observacao">
    <g:message code="baixa.observacao.label" default="Observacao" />
    <span class="required-indicator">*</span>
  </label>
  <g:textField name="observacao" required="" value="${baixaInstance?.observacao}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: baixaInstance, field: 'usuario', 'error')} required">
  <label for="usuario">
    <g:message code="baixa.usuario.label" default="Usuario" />
    <span class="required-indicator">*</span>
  </label>
  <g:select id="usuario" name="usuario.id" from="${eventos.Usuario.list()}" optionKey="id" required="" value="${baixaInstance?.usuario?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: baixaInstance, field: 'titulo', 'error')} required">
  <label for="titulo">
    <g:message code="baixa.titulo.label" default="Titulo" />
    <span class="required-indicator">*</span>
  </label>
  <g:select id="titulo" name="titulo.id" from="${eventos.Titulo.list()}" optionKey="id" required="" value="${baixaInstance?.titulo?.id}" class="many-to-one"/>
</div>

