<%@ page import="eventos.Constantes" %>
<div class="span5">
  <g:field label="Nome Completo"/>
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
<div class="span4">
  <g:field label="Nacionalidade">
    <g:select name="nacionalidade" from="${Constantes.NACIONALIDADE}" noSelection="['':'Selecione o nacionalidade']" class="validate[required]"/>
  </g:field>
  <g:field label="País"/>
  <g:field label="Estado Naturalidade"><g:fieldEstado nome="estado_naturalidade"/></g:field>
  <g:field label="Cidade Naturalidade"/>
</div>