<div id="${id}" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="myModalLabel">${titulo}</h3>
  </div>
  <div class="modal-body">
    <p>
      <h4>Clique no botão abaixo para enviar o seu comprovante de matrícula</h4>
      <uploader:uploader id="${id}_upload" allowedExtensions="${"['png', 'jpg', 'jpeg']"}">
        <uploader:onProgress>console.log(loaded + ' of ' + total + ' done so far') </uploader:onProgress>
        <uploader:onComplete>
          fezUpload = true;
          total    += ${valor};
          $("#${id}").modal('hide');
          $('#div_caixas').html(criarAlerta("Sucesso!", "Seu arquivo foi enviado com sucesso !"));
          $('#wizard').smartWizard('showMessage','Total: R$ ' + total);
        </uploader:onComplete>
        <uploader:onCancel>alert('Você cancelou o envio do arquivo'); </uploader:onCancel>
        <uploader:noScript>
          <p>O seu navegador não suporta a execução de scripts</p>
        </uploader:noScript>
      </uploader:uploader>
    </p>
  </div>
</div>