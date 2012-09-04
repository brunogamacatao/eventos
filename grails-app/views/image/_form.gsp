<%@ page import="pl.burningice.plugins.image.ast.Image" %>



<div class="fieldcontain ${hasErrors(bean: imageInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="image.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="type" required="" value="${imageInstance?.type}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: imageInstance, field: 'data', 'error')} required">
	<label for="data">
		<g:message code="image.data.label" default="Data" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="data" name="data" />
</div>

