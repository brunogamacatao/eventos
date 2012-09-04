<%@ page import="eventos.Usuario" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
  <title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
  <a href="#edit-usuario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
  <div class="nav" role="navigation">
    <ul>
      <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
      <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
    </ul>
  </div>
  <div id="edit-usuario" class="content scaffold-edit" role="main">
    <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
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

        <div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'username', 'error')} required">
          <label for="username">
            <g:message code="usuario.username.label" default="Username" />
            <span class="required-indicator">*</span>
          </label>
          <g:textField name="username" required="" value="${usuarioInstance?.username}"/>
        </div>

        <div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'accountExpired', 'error')} ">
          <label for="accountExpired">
            <g:message code="usuario.accountExpired.label" default="Account Expired" />

          </label>
          <g:checkBox name="accountExpired" value="${usuarioInstance?.accountExpired}" />
        </div>

        <div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'accountLocked', 'error')} ">
          <label for="accountLocked">
            <g:message code="usuario.accountLocked.label" default="Account Locked" />

          </label>
          <g:checkBox name="accountLocked" value="${usuarioInstance?.accountLocked}" />
        </div>

        <div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'enabled', 'error')} ">
          <label for="enabled">
            <g:message code="usuario.enabled.label" default="Enabled" />

          </label>
          <g:checkBox name="enabled" value="${usuarioInstance?.enabled}" />
        </div>

        <div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'passwordExpired', 'error')} ">
          <label for="passwordExpired">
            <g:message code="usuario.passwordExpired.label" default="Password Expired" />

          </label>
          <g:checkBox name="passwordExpired" value="${usuarioInstance?.passwordExpired}" />
        </div>


      </fieldset>
      <fieldset class="buttons">
        <g:link class="edit" action="editPassword" id="${usuarioInstance.id}">Alterar Senha</g:link>
        <g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
        <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
      </fieldset>
    </g:form>
  </div>
</body>
</html>
