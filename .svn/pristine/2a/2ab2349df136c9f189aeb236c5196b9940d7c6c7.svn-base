<%@ page import="eventos.Pergunta" %>



<div class="fieldcontain ${hasErrors(bean: perguntaInstance, field: 'titulo', 'error')} required">
  <label for="titulo">
    <g:message code="pergunta.titulo.label" default="Titulo" />
    <span class="required-indicator">*</span>
  </label>
  <g:textField name="titulo" required="" value="${perguntaInstance?.titulo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: perguntaInstance, field: 'tipo', 'error')} required">
  <label for="tipo">
    <g:message code="pergunta.tipo.label" default="Tipo" />
    <span class="required-indicator">*</span>
  </label>
  <g:select name="tipo" from="${perguntaInstance.constraints.tipo.inList}" required="" value="${perguntaInstance?.tipo}" valueMessagePrefix="pergunta.tipo"/>
</div>

<div class="fieldcontain ${hasErrors(bean: perguntaInstance, field: 'ordem', 'error')} required">
  <label for="ordem">
    <g:message code="pergunta.ordem.label" default="Ordem" />
    <span class="required-indicator">*</span>
  </label>
  <g:field name="ordem" type="number" value="${perguntaInstance.ordem}" required=""/>
</div>