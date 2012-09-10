package eventos

class Participante extends Pessoa {

    String socio
    String tipoParticipante
    Imagem comprovante
    Imagem comprovanteSocio
    Imagem artigo
    
    boolean socioSbg
    boolean socioSbmcta
    MiniCurso miniCurso;
    
    static constraints = {
        socio(blank: false, inList: ["NÃO", "SIM"])
        comprovante(nullable: true)
        comprovanteSocio(nullable: true)
        artigo(nullable: true)
        miniCurso(nullable: true)
    }
}
