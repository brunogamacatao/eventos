<div id="modal_resumo" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="myModalLabel">Confirme as informações abaixo</h3>
    <address>
      <span id='resumo_nome'>Nome Completo</span><br/>
      <span id='resumo_sexo'>Sexo</span><br/>
      <span id='resumo_data_nascimento'>Data de Nascimento</span><br/>
      <span id='resumo_cpf'>CPF</span><br/>
      <span id='resumo_rg'>RG</span> - 
      <span id='resumo_orgao_expedidor'>Órgão Expedidor</span> - 
      <span id='resumo_estado_emissor'>Estado Emissor</span><br/>
      <span id='resumo_estado_civil'>Estado Civil</span><br/>
      <span id='resumo_cidade_naturalidade'>Cidade Naturalidade</span> - 
      <span id='resumo_estado_naturalidade'>Estado Naturalidade</span><br/>
      <span id='resumo_endereco'>Endereço</span> - 
      <span id='resumo_numero'>Número</span> - 
      <span id='resumo_complemento'>Complemento</span><br/>
      <span id='resumo_bairro'>Bairro</span> - 
      <span id='resumo_cep'>CEP</span><br/>
      <span id='resumo_estado'>Estado</span> - 
      <span id='resumo_cidade'>Cidade</span><br/>
      <span id='resumo_telefone'>Telefone</span> - 
      <span id='resumo_celular'>Celular</span><br/>
      <span id='resumo_email'>E-mail</span><br/>
      <span id='resumo_tipo_profissional'>Tipo de Profissional</span><br/>
      <span id='resumo_socio'>Sócio</span><br/>
      <span id='resumo_minicurso'>Mini-curso</span>
    </address>
  </div>
  <div class="modal-body">
    <p>
      <h5>Caso você queira submeter um artigo para publicação, clique no botão abaixo para enviá-lo</h5>
      <uploader:uploader id="artigo_upload" allowedExtensions="${"['png', 'jpg', 'jpeg']"}">
        <uploader:onProgress>console.log(loaded + ' of ' + total + ' done so far') </uploader:onProgress>
        <uploader:onComplete>
          alert('O arquivo foi enviado com sucesso !');
        </uploader:onComplete>
        <uploader:onCancel>alert('Você cancelou o envio do arquivo'); </uploader:onCancel>
        <uploader:noScript>
          <p>O seu navegador não suporta a execução de scripts</p>
        </uploader:noScript>
      </uploader:uploader>
    </p>
    <p style="text-align:center"><input id="finalizar_btn" type="button" class="btn btn-success" value="Finalizar Inscrição"/></p>
  </div>
</div>