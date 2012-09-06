<div id="modal_${tipoSocio}" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="myModalLabel">Envie seu comprovante de anuidade</h3>
  </div>
  <div class="modal-body">
    <p>
      <h4>Clique no botão abaixo para enviar o seu comprovante de anuidade da ${tipoSocio.toUpperCase()}</h4>
      <uploader:uploader id="${tipoSocio}_upload" allowedExtensions="${"['png', 'jpg', 'jpeg']"}">
        <uploader:onProgress>console.log(loaded + ' of ' + total + ' done so far') </uploader:onProgress>
        <uploader:onComplete>
          fezUpload${tipoSocio.capitalize()} = true;
          $("#modal_${tipoSocio}").modal('hide');
          $('#div_socio').html(criarAlerta("Sucesso!", "Seu arquivo foi enviado com sucesso !"));
          exibirTotal();
        </uploader:onComplete>
        <uploader:onCancel>alert('Você cancelou o envio do arquivo'); </uploader:onCancel>
        <uploader:noScript>
          <p>O seu navegador não suporta a execução de scripts</p>
        </uploader:noScript>
      </uploader:uploader>
    </p>
  </div>
</div>  
