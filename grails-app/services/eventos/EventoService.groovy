package eventos

import eventos.*

class EventoService {

    static final MAX_UPLOAD_SIZE = 1048576 // 1mb
    static transactional = true
    def burningImageService


    def criarEvento(EventoCommand cmd) {
        def evento = new Evento(cmd.properties)
        
        evento.configuracao = cmd.configuracao
        evento.logomarca    = salvarImagem(cmd.imgFile)
        
        println evento.configuracao.class
        println evento.configuracao.banco
        
        if (evento.save(failOnError: true))
          return evento

        throw new EventoException("Não foi possível atualizar as informações do Evento")
    }

    def salvarImagem(def imgFile) {
        if (imgFile.bytes.length > MAX_UPLOAD_SIZE) {
            throw new EventoException("O arquivo informado (${imgFile.getOriginalFilename()}) é muito grande !<br/>As imagens não devem ter mais de 1mb.")
        }

        def imagem  = new Imagem(imagem: imgFile.bytes)
        def tempDir = System.getProperty("java.io.tmpdir")

        // Atribui o nome do arquivo
        imagem.nomeArquivo = imgFile.getOriginalFilename()
        // Obtém as dimensões da imagem (largura e altura)
        try {
            burningImageService.doWith(imgFile, tempDir).execute {
                def img = it.loadedImage.getAsJaiStream()
                imagem.largura = img.width
                imagem.altura  = img.height
            }
        } catch (Exception ex) {
            throw new EventoException("O arquivo informado (${imgFile.getOriginalFilename()}) não é uma imagem válida")
        }

        if (imagem.save()){
            return imagem
            throw new EventoException("Não foi possível gravar a logomarca do Evento")
        }

    }
    
}

class EventoException extends RuntimeException {
    EventoException(String message) {
        super(message)
    }
}

