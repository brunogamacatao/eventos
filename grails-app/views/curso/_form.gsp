<%@ page import="eventos.Curso" %>

<div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'nome', 'error')} required">
  <label for="nome">
    <g:message code="curso.nome.label" default="Nome" />
    <span class="required-indicator">*</span>
  </label>
  <g:textField name="nome" required="" value="${cursoInstance?.nome}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: perguntaInstance, field: 'tipo', 'error')} required">
  <label for="tipo">
    <g:message code="curso.tipo.label" default="Tipo" />
    <span class="required-indicator">*</span>
  </label>
  <g:select name="tipo" from="${cursoInstance.constraints.tipo.inList}" required="" value="${cursoInstance?.tipo}" valueMessagePrefix="curso.tipo"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'vagas', 'error')} required">
  <label for="vagas">
    <g:message code="curso.vagas.label" default="Vagas" />
    <span class="required-indicator">*</span>
  </label>
  <g:field name="vagas" type="number" value="${cursoInstance.vagas}" required=""/>
</div>

