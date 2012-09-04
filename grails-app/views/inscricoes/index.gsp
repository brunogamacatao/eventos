<%@ page import="eventos.Constantes" %>
<!doctype html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>Formulário de Inscrição</title>
  <r:require module="wizard"/>
  <r:script>
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
          // Validar se foi feito o upload do documento
          return true;
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
        <div class="span12">
          <g:field label="Nome"/>
          <g:field label="Sexo">
            <g:select name="sexo" from="${Constantes.SEXO}" noSelection="['':'Selecione o sexo']" class="validate[required]"/>
          </g:field>
          <g:field label="Data de Nascimento"/>
          <g:field label="CPF" id="cpf"/>
          <g:field label="RG" id="rg"/>
          <g:field label="Órgão Emissor"/>
          <g:field label="Estado Emissor"><g:fieldEstado nome="estado_emissor"/></g:field>
          <g:field label="Estado Civil">
            <g:select name="sexo" from="${Constantes.ESTADO_CIVIL}" noSelection="['':'Selecione o estado civil']" class="validate[required]"/>
          </g:field>
        </div>
        <div class="span12">
          <g:field label="Nacionalidade">
            <g:select name="nacionalidade" from="${Constantes.NACIONALIDADE}" noSelection="['':'Selecione o nacionalidade']" class="validate[required]"/>
          </g:field>
          <g:field label="País"/>
          <g:field label="Estado Naturalidade"><g:fieldEstado nome="estado_naturalidade"/></g:field>
          <g:field label="Cidade Naturalidade"/>
        </div>
      </g:wizardContent>
      <g:wizardContent titulo="Endereço e Contato">
        <div class="span12">
          <g:field label="Endereço"/>
          <g:field label="Número"/>
          <g:field label="Complemento" required="false"/>
          <g:field label="Bairro"/>
          <g:field label="CEP" id="cep"/>
          <g:field label="Estado"><g:fieldEstado nome="estado"/></g:field>
          <g:field label="Cidade"/>
        </div>
        <div class="span12">
          <g:field label="Telefone" style="telefone"/>
          <g:field label="Celular" required="false" style="telefone"/>
          <g:field label="E-mail" email="true"/>
        </div>
      </g:wizardContent>
      <g:wizardContent titulo="Tipo do Participante">
        <div class="hero-unit">
          <h1>Evento Principal</h1>
          <p>Descrição do evento principal</p>
          <br/>
          <div class="row-fluid">
            <ul class="thumbnails">
              <li class="span4">
                <div class="thumbnail">
                  <div class="caption">
                    <h3>Estudante</h3>
                    <p>R$ 60,00</p>
                    <p>
                      <a href="#modal_aluno" role="button" class="btn btn-large btn-block btn-primary" data-toggle="modal">
                        Escolher
                      </a>
                    </p>
                  </div>
                </div>
              </li>
              <li class="span4">
                <div class="thumbnail">
                  <div class="caption">
                    <h3>Professor</h3>
                    <p>R$ 120,00</p>
                    <p>
                      <a href="#modal_professor" role="button" class="btn btn-large btn-block btn-primary" data-toggle="modal">
                        Escolher
                      </a>
                    </p>
                  </div>
                </div>
              </li>
              <li class="span4">
                <div class="thumbnail">
                  <div class="caption">
                    <h3>Médico</h3>
                    <p>R$ 180,00</p>
                    <p>
                      <a href="#modal_medico" role="button" class="btn btn-large btn-block btn-primary" data-toggle="modal">
                        Escolher
                      </a>
                    </p>
                  </div>
                </div>
              </li>
            </ul>
          </div>
          
        </div>
      </g:wizardContent>
      <g:wizardContent titulo="Minicursos">
          <ul class="thumbnails">
            <li class="span3">
              <div class="thumbnail">
                <div class="caption">
                  <h3>Estudante</h3>
                  <p>R$ 60,00</p>
                  <p><a href="#" class="btn btn-large btn-block btn-primary">Escolher</a></p>
                </div>
              </div>
            </li>
            <li class="span3">
              <div class="thumbnail">
                <div class="caption">
                  <h3>Professor</h3>
                  <p>R$ 120,00</p>
                  <p><a href="#" class="btn btn-large btn-block btn-primary">Escolher</a></p>
                </div>
              </div>
            </li>
            <li class="span3">
              <div class="thumbnail">
                <div class="caption">
                  <h3>Médico</h3>
                  <p>R$ 180,00</p>
                  <p><a href="#" class="btn btn-large btn-block btn-primary">Escolher</a></p>
                </div>
              </div>
            </li>
            <li class="span3">
              <div class="thumbnail">
                <div class="caption">
                  <h3>Médico</h3>
                  <p>R$ 180,00</p>
                  <p><a href="#" class="btn btn-large btn-block btn-primary">Escolher</a></p>
                </div>
              </div>
            </li>
            <li class="span3">
              <div class="thumbnail">
                <div class="caption">
                  <h3>Médico</h3>
                  <p>R$ 180,00</p>
                  <p><a href="#" class="btn btn-large btn-block btn-primary">Escolher</a></p>
                </div>
              </div>
            </li>
            <li class="span3">
              <div class="thumbnail">
                <div class="caption">
                  <h3>Médico</h3>
                  <p>R$ 180,00</p>
                  <p><a href="#" class="btn btn-large btn-block btn-primary">Escolher</a></p>
                </div>
              </div>
            </li>
            <li class="span3">
              <div class="thumbnail">
                <div class="caption">
                  <h3>Médico</h3>
                  <p>R$ 180,00</p>
                  <p><a href="#" class="btn btn-large btn-block btn-primary">Escolher</a></p>
                </div>
              </div>
            </li>
            <li class="span3">
              <div class="thumbnail">
                <div class="caption">
                  <h3>Médico</h3>
                  <p>R$ 180,00</p>
                  <p><a href="#" class="btn btn-large btn-block btn-primary">Escolher</a></p>
                </div>
              </div>
            </li>
          </ul>
      </g:wizardContent>
    </g:wizard>
  </form>
  
  <div id="modal_aluno" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
      <h3 id="myModalLabel">Modal Aluno</h3>
    </div>
    <div class="modal-body">
      <p>One fine body…</p>
    </div>
    <div class="modal-footer">
      <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
      <button class="btn btn-primary">Save changes</button>
    </div>
  </div>  
  <div id="modal_professor" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
      <h3 id="myModalLabel">Modal Professor</h3>
    </div>
    <div class="modal-body">
      <p>One fine body…</p>
    </div>
    <div class="modal-footer">
      <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
      <button class="btn btn-primary">Save changes</button>
    </div>
  </div>  
  <div id="modal_medico" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
      <h3 id="myModalLabel">Modal Médico</h3>
    </div>
    <div class="modal-body">
      <p>One fine body…</p>
    </div>
    <div class="modal-footer">
      <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
      <button class="btn btn-primary">Save changes</button>
    </div>
  </div>  
  
  <r:layoutResources/>
</body>
</html>