<%@ page import="eventos.OpcaoResposta" %>



<div class="fieldcontain ${hasErrors(bean: opcaoRespostaInstance, field: 'descricao', 'error')} required">
  <label for="descricao">
    <g:message code="opcaoResposta.descricao.label" default="Descricao" />
    <span class="required-indicator">*</span>
  </label>
  <g:textField name="descricao" required="" value="${opcaoRespostaInstance?.descricao}"/>
</div>

