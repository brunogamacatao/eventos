var fezUpload        = false;
var fezUploadSbg     = false;
var fezUploadSbmcta  = false;
var total            = 0.0;
var tipoProfissional = '';
var minicurso        = '';

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
      
      exibirTotal();
      
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
  
  function onFinishCallback() {
   if ($("#form_inscricao").validationEngine('validate')) {
     montaResumo();
     $('#modal_resumo').modal('show');
   }
  }
  
  //Aplicando mascaras aos campos
  $('#data_de_nascimento').mask("99/99/9999");
  $('#cpf').mask('999.999.999-99');
  $('#cep').mask('99999-999');
  $('.telefone').mask('(99)9999-9999');
  
  $('#botao_aluno_grad').click(function() {
    $('#tipo_participante').val("Inscrição Comum");
    fezUpload = true;
    total    += 15;
    $('#div_caixas').html(criarAlerta("Sucesso!", "Sua opção foi registrada !"));
    exibirTotal();
  });
  $('#botao_aluno_pos_grad').click(function() {
    $('#tipo_participante').val("Apresentação de Trabalho Interno");
    fezUpload = true;
    total    += 15;
    $('#div_caixas').html(criarAlerta("Sucesso!", "Sua opção foi registrada !"));
    exibirTotal();
  });
  $('#botao_aluno_pos_doc').click(function() {
    $('#tipo_participante').val("Apresentação de Trabalho Externo");
    fezUpload = true;
    total    += 10;
    $('#div_caixas').html(criarAlerta("Sucesso!", "Sua opção foi registrada !"));
    exibirTotal();
  });
  $('#botao_profissional').click(function() {
    $('#tipo_participante').val("Seção EXPO");
    fezUpload = true;
    total    += 30;
    $("#div_socio").show();
    $('#div_caixas').html(criarAlerta("Sucesso!", "Sua opção foi registrada !"));
    exibirTotal();
  });
  
  $('.btn_marcar').click(function(){
    // Desmarcar tudo
    // $(document).find(".btn_desmarcar").each(function() {desmarcar($(this));});
    // Marcar apenas esse elemento
    marcar($(this));
  });

  $('.btn_desmarcar').click(function(){
    desmarcar($(this));
  });
  
  $('#finalizar_btn').click(function(){
    $('#form_inscricao').submit();
  });
  
  $('#curso_minicurso').change(function(){
    escondeCursos();
    var cursoSelecionado = $("#curso_minicurso option:selected").val();
    $('#caixas_' + cursoSelecionado).show();
  });
  
  escondeCursos();
});

var escondeCursos = function() {
  var cursos = ["arquitetura","administracao","direito","enfermagem","esac","fisioterapia","medicina","sistemas","jogos","construcao"];
  for (var i = 0; i < cursos.length; i++) {
    $('#caixas_' + cursos[i]).hide();
  }
}

var acaoFezUpload = function(idModal, valor) {
  fezUpload = true;
  total    += valor;
  
  if (idModal) {
    $(idModal).modal('hide');
  }
  
  $("#div_socio").show();
  $('#div_caixas').html(criarAlerta("Sucesso!", "Seu arquivo foi enviado com sucesso !"));
  exibirTotal();
};

var criarAlerta = function(titulo, mensagem) {
  return "<div class='alert alert-success alert-block'>" +
    "<button type='button' class='close' data-dismiss='alert'>×</button>" +
    "<strong>" + titulo + "</strong>&nbsp;" + mensagem +
    "</div>";
};

var exibirAlerta = function(indiceWizard, titulo, mensagem) {
  $('#step-' + indiceWizard).prepend(criarAlerta(titulo, mensagem));
};

var marcar = function(element) {
  element.hide();
  element.parent().children(".btn_desmarcar").show();
  element.parent().css('background-color', '#8CC63F');
  element.parent().children('p,h3').css('color', '#FFF');
  
  var minicursosSelecionados = $('#id_minicurso').val().split(",");
  console.log("pre: " + $('#id_minicurso').val());
  
  element.parent().children('.id_minicurso').each(function(){
    minicursosSelecionados[minicursosSelecionados.length] = $(this).val();
    
    for (var i = minicursosSelecionados.length - 1; i >= 0; i--) {
      if (minicursosSelecionados[i] == '' || minicursosSelecionados[i] == ' ') {
        minicursosSelecionados.splice(i, 1);
      }
    }
  });
  
  $('#id_minicurso').val(minicursosSelecionados.join(","));
  console.log("pos: " + $('#id_minicurso').val());
  
  total += 10;
  exibirTotal();
};

var desmarcar = function(element) {
  if (element.is(':visible')) {
    minicurso = '';
    element.hide();
    element.parent().children(".btn_marcar").show();
    element.parent().css('background-color', '#FFF');
    element.parent().children('p,h3').css('color', '#555555');
    
    var minicursosSelecionados = $('#id_minicurso').val().split(",");
    console.log("pre: " + $('#id_minicurso').val());
    
    element.parent().children('.id_minicurso').each(function(){
      for (var i = minicursosSelecionados.length - 1; i >= 0; i--) {
        if (minicursosSelecionados[i] == $(this).val()) {
          minicursosSelecionados.splice(i, 1);
        }
      }
    });
    
    $('#id_minicurso').val(minicursosSelecionados.join(","));
    console.log("pos: " + $('#id_minicurso').val());
    
    total -= 10;
    exibirTotal();
    $('#id_minicurso').val('');
  }
};

var exibirTotal = function() {
  var totalFinal = total;
  
  if (fezUploadSbg || fezUploadSbmcta) {
    totalFinal *= 0.8;
  }
  
  $('#wizard').smartWizard('showMessage','Total: R$ ' + totalFinal);
};

var montaResumo = function() {
  console.log('montando resumo dos dados pessoais ...');
  $('#resumo_nome').text($('#nome_completo').val());
  $('#resumo_sexo').text($('#sexo').val());
  $('#resumo_data_nascimento').text($('#data_de_nascimento').val());
  $('#resumo_cpf').text($('#cpf').val());
  $('#resumo_rg').text($('#rg').val());
  $('#resumo_orgao_expedidor').text($('#orgao_emissor').val());
  $('#resumo_estado_emissor').text($('#estado_emissor').val());
  $('#resumo_estado_civil').text($('#estado_civil').val());
  
  console.log('montado resumo da naturalidade ...');
  $('#resumo_cidade_naturalidade').text($('#cidade_naturalidade').val());
  $('#resumo_estado_naturalidade').text($('#estado_naturalidade').val());
  
  console.log('montando resumo do endereço ...');
  $('#resumo_endereco').text($('#endereco').val());
  $('#resumo_numero').text($('#numero').val());
  $('#resumo_complemento').text($('#complemento').val());
  $('#resumo_bairro').text($('#bairro').val());
  $('#resumo_cep').text($('#cep').val());
  $('#resumo_estado').text($('#estado').val());
  $('#resumo_cidade').text($('#cidade').val());
  
  console.log('montando resumo do contato ...');
  $('#resumo_telefone').text($('#telefone').val());
  $('#resumo_celular').text($('#celular').val());
  $('#resumo_email').text($('#email').val());
  
  console.log('montando resumo dos dados profissionais ...');
  $('#resumo_tipo_profissional').text($('#tipo_participante').val());
};