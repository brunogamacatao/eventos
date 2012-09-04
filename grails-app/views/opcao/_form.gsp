<%@ page import="eventos.Opcao" %>

<div class="fieldcontain ${hasErrors(bean: opcaoInstance, field: 'descricao', 'error')} required">
  <label for="descricao">
    <g:message code="opcao.descricao.label" default="Descricao" />
    <span class="required-indicator">*</span>
  </label>
  <g:textField name="descricao" required="" class="validate[required] text-input" value="${opcaoInstance?.descricao}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: opcaoInstance, field: 'preco', 'error')} required">
  <label for="preco">
    <g:message code="opcao.preco.label" default="Preco" />
    <span class="required-indicator">*</span>
  </label>
  <g:field name="preco" value="${fieldValue(bean: opcaoInstance, field: 'preco')}" class="validate[required] text-input" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: opcaoInstance, field: 'dataTermino', 'error')} required">
  <label for="dataTermino">
    <g:message code="opcao.dataTermino.label" default="Data Termino" />
    <span class="required-indicator">*</span>
  </label>
  <g:datePicker name="dataTermino" precision="day"  value="${opcaoInstance?.dataTermino}"  />
</div>


