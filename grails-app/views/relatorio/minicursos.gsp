<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
  <head>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8">
    <title>Relatório dos MiniCursos</title>
    <meta name="layout" content="main">
  </head>
  <body>
    <h1>MiniCursos</h1>
    <table>
      <thead>
        <tr>
          <th>Título</th>
          <th>Palestrante</th>
          <th>Participantes</th>
        </tr>
      </thead>
      <tbody>
        <g:each var="minicurso" in="${minicursos}">
          <tr>
            <td><g:link action="participantesMinicurso" id="${minicurso.id}">${minicurso.titulo}</g:link></td>
            <td>${minicurso.professor}</td>
            <td>${minicurso.quantidadeParticipantesConfirmados}</td>
          </tr>
        </g:each>
      </tbody>
    </table>
  </body>
</html>
