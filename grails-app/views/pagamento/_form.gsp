<%@ page import="eventos.Pagamento" %>
<r:script disposition="defer">
  $(document).ready(function(){
    $('#nossoNumero').blur(function() {
      var numero = $('#nossoNumero').val();
      $.ajax({
        url: "${createLink(controller: 'titulo', action: 'recupera')}/" + numero,
        dataType: 'json',
        success: function(resposta) {
          if (resposta.resultado === 'ok') {
            $('#titulo').val(resposta.titulo);
          } else {
            alert('Não foi possível encontrar um boleto com este número');
            $('#nossoNumero').focus();
          }
        }
      });
    });
  });
</r:script>

<div class="fieldcontain ${hasErrors(bean: pagamentoInstance, field: 'nossoNumero', 'error')} required">
	<label for="nossoNumero">
		<g:message code="pagamento.nossoNumero.label" default="Nosso Numero" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nossoNumero" required="" value="${pagamentoInstance?.nossoNumero}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pagamentoInstance, field: 'dataPagamento', 'error')} required">
	<label for="dataPagamento">
		<g:message code="pagamento.dataPagamento.label" default="Data Pagamento" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dataPagamento" precision="day"  value="${pagamentoInstance?.dataPagamento}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: pagamentoInstance, field: 'valor', 'error')} required">
	<label for="valor">
		<g:message code="pagamento.valor.label" default="Valor" />
		<span class="required-indicator">*</span>
	</label>
  <g:textField name="valor" value="${fieldValue(bean: pagamentoInstance, field: 'valor')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pagamentoInstance, field: 'observacao', 'error')} ">
	<label for="observacao">
		<g:message code="pagamento.observacao.label" default="Observacao" />
		
	</label>
	<g:textField name="observacao" value="${pagamentoInstance?.observacao}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pagamentoInstance, field: 'titulo', 'error')} required">
	<label for="titulo">
		<g:message code="pagamento.titulo.label" default="Titulo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select 
	  id="titulo" 
	  name="titulo.id" 
	  from="${eventos.Titulo.list()}" 
	  optionKey="id" 
	  required="" 
	  value="${pagamentoInstance?.titulo?.id}" 
	  noSelection="['':'- Nenhum Título Selecionado -']"
	  class="many-to-one"/>
</div>