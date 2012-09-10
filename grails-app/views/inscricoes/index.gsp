<%@ page import="eventos.Constantes" %>
<!doctype html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>Formulário de Inscrição</title>
  <r:require module="wizard"/>
  <r:layoutResources/>
  <style type="text/css" media="screen">
    .minicurso,.tipo_participante {
      margin: 0px;
    }
    
    .minicurso > div {
      height: 300px;
    }
    
    .tipo_participante > div {
      height: 200px;
    }

    .titulo_tipo_participante {
      height: 60px;
    }
    
    .titulo_minicurso {
      height: 90px;
    }
    
    .professor_minicurso {
      height: 63px;
    }
  </style>
</head>
<body style="background-color:transparent">
  <g:form name="form_inscricao" controller="inscricoes" action="gerarBoleto" class="form-horizontal">
    <g:hiddenField name="id_minicurso"/>
    <g:hiddenField name="tipo_participante"/>
    <g:hiddenField name="socio_sbg"/>
    <g:hiddenField name="socio_sbmcta"/>
    <g:hiddenField name="arquivo_comprovante"/>
    <g:hiddenField name="arquivo_socio"/>
    <g:hiddenField name="arquivo_artigo"/>
    
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
  </g:form>

  <g:render template="modalUpload" model="['tipo_profissional': 'aluno_graduacao','id': 'modal_aluno_grad',     'titulo': 'Envie o seu comprovante de matrícula digitalizado', 'valor': 100]"/>
  <g:render template="modalUpload" model="['tipo_profissional': 'aluno_pos_graduacao','id': 'modal_aluno_pos_grad', 'titulo': 'Envie o seu comprovante de matrícula digitalizado', 'valor': 120]"/>
  <g:render template="modalUpload" model="['tipo_profissional': 'aluno_pos_doc','id': 'modal_aluno_pos_doc',  'titulo': 'Envie o seu comprovante de matrícula digitalizado', 'valor': 140]"/>
  <g:render template="modalUpload" model="['tipo_profissional': 'profissional','id': 'modal_medico',         'titulo': 'Envie o seu comprovante de atuação profissional digitalizado', 'valor': 160]"/>
  
  <g:render template="modalSocio" model="['tipoSocio': 'sbg']"/>
  <g:render template="modalSocio" model="['tipoSocio': 'sbmcta']"/>
  
  <g:render template="modalResumo"/>
  
  <r:layoutResources/>
</body>
</html>