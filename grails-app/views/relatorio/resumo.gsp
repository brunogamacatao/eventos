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
          <th>Sócio</th>
          <th>Minicursos</th>
          <th>Artigo</th>
          <th>Situação</th>
        </tr>
      </thead>
      <tbody>
        <g:each var="participante" in="${participantes}" status="i">
          <tr>
            <td>${i + 1}</td>
            <td>${participante.nome}</td>
            <td>${participante.socio}</td>
            <td>${participante.miniCurso ? participante.miniCurso.titulo : '-'}</td>
            <td>${participante.artigo ? 'sim' : 'não'}</td>
            <td>PENDENTE</td>
          </tr>
        </g:each>
      </tbody>
    </table>
  </body>
</html>
