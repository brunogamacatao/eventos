<%@ page import="eventos.Constantes" %>
<!doctype html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>Formulário de Inscrição</title>
  <r:require module="wizard"/>
  <r:script>
    var fezUpload = false;
  
    $(document).ready(function(){
      $('#wizard').smartWizard({
        labelNext:     "Próximo",
        labelPrevious: "Anterior",
        labelFinish:   "Concluir",
        onLeaveStep:   leaveAStepCallback,
        onFinish:      onFinishCallback
      });

      function leaveAStepCallback(obj){
        var step_num = obj.attr('rel');
        
        if (step_num == 3) {
          if (!fezUpload) {
            alert("Você deve enviar o comprovante para que possa terminar a inscrição");
          }
          
          return fezUpload;
        } else {
          //return $("#form_inscricao").validationEngine('validate');
          return true;
        }
      }
      
      function onFinishCallback(){
       if($("#form_inscricao").validationEngine('validate')){
        $('#form_inscricao').submit();
       }
      }
      
      //Aplicando mascaras aos campos
      $('#data_de_nascimento').mask("99/99/9999");
      $('#cpf').mask('999.999.999-99');
      $('#cep').mask('99999-999');
      $('.telefone').mask('(99)9999-9999');
      
      //Ligando a validacao do formulario
      //$("#form_inscricao").validationEngine();
    });
    
    var criarAlerta = function(titulo, mensagem) {
      return "<div class='alert alert-success alert-block'>" +
        "<button type='button' class='close' data-dismiss='alert'>×</button>" +
        "<strong>" + titulo + "</strong>&nbsp;" + mensagem +
        "</div>";
    };
    
    var exibirAlerta = function(indiceWizard, titulo, mensagem) {
      $('#step-' + indiceWizard).prepend(criarAlerta(titulo, mensagem));
    };
  </r:script>
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

  <g:render template="modalUpload" model="['id': 'modal_aluno',     'titulo': 'Envie o seu comprovante de matrícula digitalizado']"/>
  <g:render template="modalUpload" model="['id': 'modal_professor', 'titulo': 'Envie algum documento que comprove seu vínculo com alguma instituição de ensino como professor']"/>
  <g:render template="modalUpload" model="['id': 'modal_medico',    'titulo': 'Envie o seu CRM digitalizado']"/>
  
  <r:layoutResources/>
</body>
</html>