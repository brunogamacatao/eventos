
<%@ page import="eventos.UsuarioGrupo" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'usuarioGrupo.label', default: 'UsuarioGrupo')}" />
  <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
  <a href="#list-usuarioGrupo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
  <div class="nav" role="navigation">
    <ul>
      <li><g:link class="create" action="create">Vincular Grupo </g:link></li>
      <li><g:link class="create" controller="grupo" action="create">Novo Grupo</g:link></li>
    </ul>
  </div>
  <div id="list-usuarioGrupo" class="content scaffold-list" role="main">
    <h1>Vinculos Listagem</h1>
    <g:if test="${flash.message}">
      <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
      <thead>
        <tr>
          <th><g:message code="usuarioGrupo.usuario.label" default="Usuario" /></th>
      <th><g:message code="usuarioGrupo.grupo.label" default="Grupo" /></th>
      </tr>
      </thead>
      <tbody>
      <g:each in="${usuarioGrupoInstanceList}" status="i" var="usuarioGrupoInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
          <td><g:link action="show" id="${usuarioGrupoInstance.id}">${fieldValue(bean: usuarioGrupoInstance, field: "usuario")}</g:link></td>
        <td>${fieldValue(bean: usuarioGrupoInstance, field: "grupo")}</td>
        </tr>
      </g:each>
      </tbody>
    </table>
    <div class="pagination">
      <g:paginate total="${usuarioGrupoInstanceTotal}" />
    </div>
  </div>
</body>
</html>
