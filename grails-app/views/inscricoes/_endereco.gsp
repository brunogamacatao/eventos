<%@ page import="eventos.Constantes" %>
<div class="span5">
  <g:field label="Endereço"/>
  <g:field label="Número"/>
  <g:field label="Complemento" required="false"/>
  <g:field label="Bairro"/>
  <g:field label="CEP" id="cep"/>
  <g:field label="Estado"><g:fieldEstado nome="estado"/></g:field>
  <g:field label="Cidade"/>
</div>
<div class="span4">
  <g:field label="Telefone" style="telefone"/>
  <g:field label="Celular" required="false" style="telefone"/>
  <g:field label="E-mail" id="email" email="true"/>
</div>