package eventos

class MiniCurso {
  int identificador
  String titulo
  String professor
  int vagas
  int totalDeVagas
  double valor
  
  String curso
  int cargaHoraria
  String local
  Date data
  String horario
  
  def getParticipantes() {
    Participante.findAllByMiniCurso(this)
  }
  
  def getParticipantesConfirmados() {
    def pList = [] as Set
    def that  = this
    
    Participante.list().each { participante -> 
      participante.miniCursos.each { miniCurso ->
        if (miniCurso.id == that.id && participante.estadoAtual.estado == 'CONFIRMADO') {
            pList << participante
        }
      }
    }
    
    pList.asList().sort { it.nome }
  }
  
  def getQuantidadeParticipantesConfirmados() {
    getParticipantesConfirmados().size()
  }
  
  static constraints = {
    identificador(blank: false, unique: true)
    titulo(blank: false)
    professor(blank: false)
    vagas(min: 0)
    valor(min: 0.0d)
    curso(blank: false)
    cargaHoraria(min: (int)0)
    local(blank: false)
    data(blank: false)
    horario(blank: false)
  }
}