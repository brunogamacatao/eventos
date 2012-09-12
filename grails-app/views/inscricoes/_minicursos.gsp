<%@ page import="eventos.MiniCurso" %>
<g:caixas>
  <g:each var="minicurso" in="${MiniCurso.list(sort:"identificador")}">
    <g:caixa titulo="${minicurso.titulo}" span="3" class="minicurso">
      <p>${minicurso.vagas} vagas restantes</p>
      <p class="professor_minicurso"><strong>Professor:</strong> ${minicurso.professor}</p>
      <p><span class="label label-success"><g:formatNumber number="${minicurso.valor}" type="currency" locale="pt_BR"/></span></p>
      <input type="hidden" class="id_minicurso" value="${minicurso.identificador}"/>
      <g:if test="${minicurso.vagas > 0}">
        <p class="btn_marcar"><a href="#" class="btn btn-large btn-block btn-primary">Escolher</a></p>
        <p class="btn_desmarcar" style="display:none"><a href="#" class="btn btn-large btn-block btn-warning">Desmarcar</a></p>
      </g:if>
      <g:else>
        <h4>Vagas Esgotadas</h4>
      </g:else>
    </g:caixa>
  </g:each>
</g:caixas>