package eventos

class Participante extends Pessoa {

    String socio
    String tipoParticipante
    String codTipoParticipante
    Imagem comprovante
    Imagem comprovanteSocio
    Imagem artigo
    
    boolean socioSbg
    boolean socioSbmcta
    MiniCurso miniCurso

    static belongsTo  = [MiniCurso]
    static hasMany    = [estados : EstadoInscricao, miniCursos : MiniCurso, titulos: Titulo]
    static transients = ['codTipoParticipante']
    
    static constraints = {
        socio(blank: false, inList: ["NÃO", "SIM"])
        comprovante(nullable: true)
        comprovanteSocio(nullable: true)
        artigo(nullable: true)
        miniCurso(nullable: true)
    }
    
    def getEstadoAtual() {
      def estados = EstadoInscricao.findAllByParticipante(this, [sort: 'dateCreated', order: 'desc'])
      if (estados && estados.size() > 0) {
        return estados[0]
      }
      return null
    }
}
