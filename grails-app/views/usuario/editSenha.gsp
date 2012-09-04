<%@ page import="eventos.Usuario" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
  <r:require module="formulario"/>
  <title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
  <a href="#edit-usuario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
  <div class="nav" role="navigation">
  </div>
<jq:jquery>
  $("form").validationEngine();
</jq:jquery>
<div id="edit-usuario" class="content scaffold-edit" role="main">
  <h1>Mudar Senha</h1>
  <g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
  </g:if>
  <g:hasErrors bean="${usuarioInstance}">
    <ul class="errors" role="alert">
      <g:eachError bean="${usuarioInstance}" var="error">
        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
      </g:eachError>
    </ul>
  </g:hasErrors>
  <g:form method="post" >
    <g:hiddenField name="id" value="${usuarioInstance?.id}" />
    <g:hiddenField name="version" value="${usuarioInstance?.version}" />
    <fieldset class="form">
      <div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'password', 'error')} required">
        <label for="password">
          <g:message code="usuario.password.label" default="Senha Anterior" />
          <span class="required-indicator">*</span>
        </label>
        <g:passwordField name="password_old" required="" class="validate[required] text-input"  value=""/>
      </div>
      <div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'password', 'error')} required">
        <label for="password">
          <g:message code="usuario.password.label" default="Nova Senha" />
          <span class="required-indicator">*</span>
        </label>
        <g:passwordField name="password" required="" class="validate[required] text-input"  value=""/>
      </div>
      <div class="fieldcontain">
        <label>
          Confirme a Senha
          <span class="required-indicator">*</span>
        </label>
        <g:passwordField name="password_again" required="" class="validate[required,equals[password]]" value=""/>
      </div>
    </fieldset>
    <fieldset class="buttons">
      <g:actionSubmit class="save" action="updateSenha" value="${message(code: 'default.button.update.label', default: 'Update')}" />
    </fieldset>
  </g:form>
</div>
</body>
</html>
