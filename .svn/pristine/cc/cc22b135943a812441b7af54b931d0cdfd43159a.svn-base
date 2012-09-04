package eventos

class ImagemController {

    def imagemService

    def showImagem = {
        def id      = Long.parseLong(params.id as String)
        def largura = Integer.parseInt(params.largura as String)
        def altura  = Integer.parseInt(params.altura as String)

        response.outputStream << imagemService.getImagem(id, largura, altura).imagem
        response.outputStream.flush()
    }
}
