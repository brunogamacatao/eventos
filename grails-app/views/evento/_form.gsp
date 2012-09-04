<%@ page import="eventos.Evento" %>



<div class="fieldcontain ${hasErrors(bean: eventoInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="evento.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${eventoInstance?.nome}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventoInstance, field: 'data', 'error')} required">
	<label for="data">
		<g:message code="evento.data.label" default="Data" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="data" required="" value="${eventoInstance?.data}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventoInstance, field: 'local', 'error')} required">
	<label for="local">
		<g:message code="evento.local.label" default="Local" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="local" required="" value="${eventoInstance?.local}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventoInstance, field: 'identificador', 'error')} ">
	<label for="identificador">
		<g:message code="evento.identificador.label" default="Identificador" />
		
	</label>
	<g:textField name="identificador" value="${eventoInstance?.identificador}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventoInstance, field: 'logomarca', 'error')} required">
	<label for="logomarca">
		<g:message code="evento.logomarca.label" default="Logomarca" />
		<span class="required-indicator">*</span>
	</label>
	<g:if test="${eventoInstance.logomarca}"><span class="property-value" aria-labelledby="logomarca-label"><g:thumbnail id="${eventoInstance.logomarca?.id}"/></span></g:if><input type="file" id="logomarca" name="logomarca" />
</div>

<div class="fieldcontain ${hasErrors(bean: eventoInstance, field: 'configuracao', 'error')} required">
	<label for="configuracao">
		<g:message code="evento.configuracao.label" default="Configuracao" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="configuracao" name="configuracao.id" from="${eventos.Configuracao.list()}" optionKey="id" required="" value="${eventoInstance?.configuracao?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventoInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="evento.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="status" from="${eventoInstance.constraints.status.inList}" required="" value="${eventoInstance?.status}" valueMessagePrefix="evento.status"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventoInstance, field: 'dataTermino', 'error')} required">
	<label for="dataTermino">
		<g:message code="evento.dataTermino.label" default="Data Termino" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dataTermino" precision="day"  value="${eventoInstance?.dataTermino}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: eventoInstance, field: 'desconto', 'error')} required">
	<label for="desconto">
		<g:message code="evento.desconto.label" default="Desconto" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="desconto" max="100" required="" value="${fieldValue(bean: eventoInstance, field: 'desconto')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventoInstance, field: 'css', 'error')} ">
	<label for="css">
		<g:message code="evento.css.label" default="Css" />
		
	</label>
	<g:textArea name="css" cols="40" rows="5" value="${eventoInstance?.css}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventoInstance, field: 'cursos', 'error')} ">
	<label for="cursos">
		<g:message code="evento.cursos.label" default="Cursos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${eventoInstance?.cursos?}" var="c">
    <li><g:link controller="curso" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="curso" action="create" params="['evento.id': eventoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'curso.label', default: 'Curso')])}</g:link>
</li>
</ul>

</div>

