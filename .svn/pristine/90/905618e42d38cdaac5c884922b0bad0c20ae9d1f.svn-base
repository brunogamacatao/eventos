
<%@ page import="eventos.Participante" %>

<!doctype html>
<html>
  <head>
    <link href="${resource(dir: 'plugins', file: 'formee-3-1/css/formee-structure.css')}" type="text/css" rel="stylesheet" media="screen, projection" />
    <link href="${resource(dir: 'plugins', file: 'formee-3-1/css/formee-style.css')}" type="text/css" rel="stylesheet" media="screen, projection" />
    <link href="${resource(dir: 'js', file: 'jquery/validationEngine.jquery.css')}" type="text/css" rel="stylesheet" media="screen, projection" />
    <script src="${resource(dir: 'plugins', file: 'formee-3-1/js/jquery-1.6.4.min.js')}" type="text/javascript" ></script>
    <script src="${resource(dir: 'plugins', file: 'formee-3-1/js/formee.js')}" type="text/javascript" ></script>
    <script src="${resource(dir: 'js', file: 'jquery/jquery.maskedinput-1.2.2.min.js')}" type="text/javascript" ></script>
    <script src="${resource(dir: 'js', file: 'jquery/jquery.maskMoney.js')}" type="text/javascript" ></script>
    <script src="${resource(dir: 'js', file: 'jquery/jquery.validationEngine-pt.js')}" type="text/javascript" ></script>
    <script src="${resource(dir: 'js', file: 'jquery/jquery.validationEngine.js')}" type="text/javascript" ></script>
    <link href='<g:createLink controller="evento" action="getCSS" params="[evento: eventoInstance.identificador]" />' type="text/css" rel="stylesheet" media="screen, projection" />
    <title>I Simpósio de Medicina Molecular da Paraíba - Local do Evento</title>
    <style type="text/css">
      .divSelect{
      }
      .divSelect select{
        width: auto;     
      }
      body{
        background: #1E3856 url("${resource(dir: 'images', file: 'bg.png')}") repeat;
      }
      #content{
        background: url("${resource(dir: 'images', file: 'bg.png')}") repeat;
      }
    </style>
  </head>
  <body>
    <div id="wrapper">
      <div id="content" style="width: 960px;">
        <!-- formee-->
        <jq:jquery>
          $("form").validationEngine();
          $("#nacionalidade").change(function() {
            if(this.value != 'Brasileiro'){
              $("#pais").val('');
              $("#divPais").show();
            }else{
              $("#pais").val('BRASIL');
              $("#divPais").hide();
            }
          });
        </jq:jquery>
        <form id="form" class="formee" method="post" action="#" enctype="multipart/form-data" name="formCadastro" >
          <fieldset>
            <legend>Preencha os dados corretamente</legend>
            <div style="padding-bottom: 20px; border-bottom: #e2e2e2 solid 1px">
              <div class="grid-5-12" style="margin-right: 90px;">
                <label>Nome Completo <em class="formee-req">*</em></label>
                <g:textField name="nome" required="" class="validate[required] text-input" value="${participanteInstance?.nome}" />
              </div>
              <div class="grid-5-12">
                <label>CPF <em class="formee-req">*</em></label>
                <g:textField name="cpf" required="" class="validate[required] text-input" value="${participanteInstance?.cpf}" />
              </div>
              <div class="grid-5-12" style="margin-right: 90px;">
                <label>Sexo <em class="formee-req">*</em></label>
                <g:select name="sexo" from="${participanteInstance.constraints.sexo.inList}" required="" value="${participanteInstance?.sexo}" valueMessagePrefix="participante.sexo"/>
              </div>
              <div class="grid-5-12 divSelect">
                <label>Data de Nascimento <em class="formee-req">*</em></label>
                <g:datePicker name="dataNascimento" precision="day"  value="${participanteInstance?.dataNascimento}"  />
              </div>
              <div class="grid-5-12">
                <label>Estado Civil <em class="formee-req">*</em></label>
                <g:select name="estadoCivil" from="${participanteInstance.constraints.estadoCivil.inList}" required="" value="${participanteInstance?.estadoCivil}" valueMessagePrefix="participante.estadoCivil"/>
              </div>
            </div>
            <div style="margin-top: 40px;">
              <div class="grid-5-12" style="margin-right: 90px;">
                <label>Identidade <em class="formee-req">*</em></label>
                <g:textField name="rg" value="${participanteInstance?.rg}"/>
              </div>
              <div class="grid-5-12" style="width: 200px">
                <label>Orgão Emissor <em class="formee-req">*</em></label>
                <g:textField name="orgaoEmissor" required="" value="${participanteInstance?.orgaoEmissor}"/>
              </div>
              <div class="grid-5-12" style="width: 140px">
                <label>UF / RG <em class="formee-req">*</em></label>
                <g:select name="estadoRG" from="${participanteInstance.constraints.estadoRG.inList}" required="" value="${participanteInstance?.estadoRG}" valueMessagePrefix="participante.estadoRG"/>
              </div>
              <div class="grid-5-12" style="margin-right: 90px;">
                <label>Cidade Naturalidade <em class="formee-req">*</em></label>
                <g:textField name="cidadeNaturalidade" value="${participanteInstance?.cidadeNaturalidade}"/>
              </div>
              <div class="grid-5-12" style="margin-bottom: 5px;">
                <label>Estado Naturalidade <em class="formee-req">*</em></label>
                <g:select name="estadoNaturalidade" from="${participanteInstance.constraints.estadoNaturalidade.inList}" required="" value="${participanteInstance?.estadoNaturalidade}" valueMessagePrefix="participante.estadoNaturalidade"/>
              </div>
              <div class="grid-5-12" style="margin-right: 90px;">
                <label>Nacionalidade <em class="formee-req">*</em></label>
                <g:select name="nacionalidade" from="${participanteInstance.constraints.nacionalidade.inList}" required="" value="${participanteInstance?.nacionalidade}" valueMessagePrefix="participante.nacionalidade"/>
              </div>
              <div id="divPais" class="grid-5-12" style="display: none">
                <label>Paìs <em class="formee-req">*</em></label>
                <g:textField name="pais" required="" value="BRASIL"/>
              </div>
            </div>
            <div style="margin-top: 40px;">
              <div class="grid-5-12" style="margin-right: 90px;">
                <label>CEP <em class="formee-req">*</em></label>
                <g:textField name="cep" required="" value="${participanteInstance?.cep}"/>
              </div>
              <div class="grid-5-12">
                <label>Endereço <em class="formee-req">*</em></label>
                <g:textField name="rua" required="" value="${participanteInstance?.endereco}"/>
              </div>
              <div class="grid-5-12" style="margin-right: 90px;">
                <label>Número <em class="formee-req">*</em></label>
                <g:textField name="numero" required="" value="${participanteInstance?.numero}"/>
              </div>
              <div class="grid-5-12">
                <label>Complemento</label>
                <g:textField name="complemento" required="" value="${participanteInstance?.complemento}"/>
              </div>
              <div class="grid-5-12" style="margin-right: 90px;">
                <label>Bairro</label>
                <g:textField name="bairro" required="" value="${participanteInstance?.bairro}"/>
              </div>
              <div class="grid-5-12">
                <label>Cidade</label>
                <g:textField name="cidade" required="" value="${participanteInstance?.cidade}"/>
              </div>
              <div class="grid-5-12" style="margin-right: 90px;">
                <label>Estado</label>
                <g:textField name="bairro" required="" value="${participanteInstance?.bairro}"/>
              </div>
              <div class="grid-5-12">
                <label>Currículo (formato .pdf) <em class="formee-req">*</em></label>
                <input type="file" name="file" class="" value="Fill up the field" />
              </div>
              <div class="grid-5-12" style="margin-right: 90px;">
                <label>Atualmente no Mercado de Trabalho?</label>
                <ul class="formee-list">
                  <li style="margin-right: 70px;"><input name="trabalho" value="sim" type="radio" /><label>Sim</label></li>
                  <li><input name="trabalho" value="não" type="radio" /><label>Não</label></li>
                </ul>
              </div>
              <div class="grid-5-12">
                <label>Vínculo</label>
                <select class="" name="vinculo">
                  <option value="Sócio">Sócio</option>
                  <option value="Funcionário">Funcionário</option>
                  <option value="Voluntário">Voluntário</option>
                  <option value="Outro">Outro</option>
                </select>
              </div>
            </div>
            <div class="grid-11-12">
              <label>Resumo Profissional</label>
              <textarea rows="5" cols="" name="resumo"></textarea>
            </div>
            <div class="grid-2-12" style="padding-top: 33px;">
              <input type="button" onclick="envia()" title="send" value="Enviar" />
            </div>
          </fieldset>
        </form>
        <!-- formee-->	
      </div>
    </div>
  </body>
</html>
