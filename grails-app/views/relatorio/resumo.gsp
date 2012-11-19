<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
  <head>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8">
    <title>Relatório Resumido das Inscrições</title>
    <meta name="layout" content="main">
  </head>
  <body>
    <h1>Relatório</h1>
    <table>
      <thead>
        <tr>
          <th>-</th>
          <th>Participante</th>
          <th>E-Mail</th>
          <th>Telefone</th>
          <th>Minicurso</th>
          <th>Artigo</th>
          <th>Situação</th>
        </tr>
      </thead>
      <tbody>
        <g:each var="participante" in="${participantes}" status="i">
          <tr>
            <td>${i + 1}</td>
            <td>${participante.nome}</td>
            <td>${participante.email}</td>
            <td>${participante.telefone1} | ${participante.telefone2}</td>
            <td>${participante.miniCurso ? participante.miniCurso.titulo : '-'}</td>
            <g:if test="${participante.artigo}">
              <td><g:link action="downloadResumo" id="${participante.id}">sim</g:link></td>
            </g:if>
            <g:else>
              <td>não</td>
            </g:else>
            <td>${participante.estadoAtual}</td>
          </tr>
        </g:each>
      </tbody>
    </table>
  </body>
</html>
