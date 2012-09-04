<%@ page import="eventos.Constantes" %>
<!doctype html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>Formulário de Inscrição</title>
  <r:require module="wizard"/>
  <r:layoutResources/>
</head>
<body>
  <form id="form_inscricao" action="index_submit" method="get" accept-charset="utf-8" class="form-horizontal">
    <g:wizard>
      <g:wizardTitle>
        <g:wizardStep titulo="Dados Pessoais"/>
        <g:wizardStep titulo="Endereço e Contato"/>
        <g:wizardStep titulo="Tipo do Participante"/>
        <g:wizardStep titulo="Minicursos"/>
      </g:wizardTitle>
      <g:wizardContent titulo="Dados Pessoais">
        <g:render template="dadosPessoais"/>
      </g:wizardContent>
      <g:wizardContent titulo="Endereço e Contato">
      <g:render template="endereco"/>
      </g:wizardContent>
      <g:wizardContent titulo="Tipo do Participante">
        <g:render template="tipoParticipante"/>
      </g:wizardContent>
      <g:wizardContent titulo="Minicursos">
        <g:render template="minicursos"/>
      </g:wizardContent>
    </g:wizard>
  </form>

  <g:render template="modalUpload" model="['id': 'modal_aluno',     'titulo': 'Envie o seu comprovante de matrícula digitalizado', 'valor': 60]"/>
  <g:render template="modalUpload" model="['id': 'modal_professor', 'titulo': 'Envie algum documento que comprove seu vínculo com alguma instituição de ensino como professor', 'valor': 120]"/>
  <g:render template="modalUpload" model="['id': 'modal_medico',    'titulo': 'Envie o seu CRM digitalizado', 'valor': 180]"/>
  
  <r:layoutResources/>
</body>
</html>