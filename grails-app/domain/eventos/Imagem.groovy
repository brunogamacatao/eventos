package eventos

class Imagem {

    byte[] imagem
    String nomeArquivo
    int largura
    int altura
    Imagem imagemOriginal

    static constraints = {
        imagem(blank: false)
        nomeArquivo(blank: false)
        largura(blank: false)
        altura(blank: false)
        imagemOriginal(nullable: true)
    }

    static hasMany  = [thumbnails: Imagem]
    static mappedBy = [thumbnails: 'imagemOriginal']

    static mapping = {
        imagem sqlType: 'longblob'
    }
}
