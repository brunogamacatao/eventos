var fezUpload = true;
var total     = 0.0;

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
      
      $('#wizard').smartWizard('showMessage','Total: R$ ' + total);
      
      return fezUpload;
    } else {
      // var valid = $("#form_inscricao").validationEngine('validate');
      // 
      // if (!valid) {
      //   $('#wizard').smartWizard('showMessage', 'Por favor, corrija os erros e clique no botão Próximo');
      // }
      // 
      // $('#wizard').smartWizard('setError', {stepnum: step_num, iserror: !valid});
      // 
      // return valid;
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

$('.btn_marcar').click(function(){
  $(this).hide();
  $(this).parent().children(".btn_desmarcar").show();
  $(this).parent().css('background-color', '#8CC63F');
  $(this).parent().children('p,h3').css('color', '#FFF');
  
  total += parseFloat($(this).parent().children('.valor').val());
  $('#wizard').smartWizard('showMessage','Total: R$ ' + total);
});

$('.btn_desmarcar').click(function(){
  $(this).hide();
  $(this).parent().children(".btn_marcar").show();
  $(this).parent().css('background-color', '#FFF');
  $(this).parent().children('p,h3').css('color', '#555555');
  
  total -= parseFloat($(this).parent().children('.valor').val());
  $('#wizard').smartWizard('showMessage','Total: R$ ' + total);
});