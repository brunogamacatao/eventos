package eventos

class Participante extends Pessoa {

    String socio
    String tipoParticipante
    Imagem comprovante
    Imagem comprovanteSocio
    Imagem artigo
    
    boolean socioSbg
    boolean socioSbmcta
    MiniCurso miniCurso
    
    static hasMany = [estados : EstadoInscricao, miniCursos : MiniCurso]
    
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
