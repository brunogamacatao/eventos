<div id="modal_resumo" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="myModalLabel">Confirme as informações abaixo</h3>
    <address>
      Nome Completo<br/>
      Sexo<br/>
      Data de Nascimento<br/>
      CPF<br/>
      RG - Órgão Expedidor - Estado Emissor<br/>
      Estado Civil<br/>
      Cidade Naturalidade - Estado Naturalidade<br/>
      Endereço - Número - Complemento<br/>
      Bairro - CEP<br/>
      Estado - Cidade<br/>
      Telefone - Celular<br/>
      E-mail<br/>
      Tipo de Profissional<br/>
      Sócio<br/>
      Mini-curso
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
    <p style="text-align:center"><input type="button" class="btn btn-success" value="Finalizar Inscrição"/></p>
  </div>
</div>