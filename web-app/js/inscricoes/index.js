var fezUpload = false;
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
      var valid = $("#form_inscricao").validationEngine('validate');
      
      if (!valid) {
        $('#wizard').smartWizard('showMessage', 'Por favor, corrija os erros e clique no botão Próximo');
      }
      
      $('#wizard').smartWizard('setError', {stepnum: step_num, iserror: !valid});
      
      return valid;
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
  // Desmarcar tudo
  $(document).find(".btn_desmarcar").each(function() {desmarcar($(this));});
  // Marcar apenas esse elemento
  marcar($(this));
});

$('.btn_desmarcar').click(function(){
  desmarcar($(this));
});

var marcar = function(element) {
  element.hide();
  element.parent().children(".btn_desmarcar").show();
  element.parent().css('background-color', '#8CC63F');
  element.parent().children('p,h3').css('color', '#FFF');
  
  total += 20;
  
  $('#wizard').smartWizard('showMessage','Total: R$ ' + total);
}

var desmarcar = function(element) {
  if (element.is(':visible')) {
    element.hide();
    element.parent().children(".btn_marcar").show();
    element.parent().css('background-color', '#FFF');
    element.parent().children('p,h3').css('color', '#555555');
  
    total -= 20;
    
    $('#wizard').smartWizard('showMessage','Total: R$ ' + total);
  }
}