package eventos

class MiniCurso {
  int identificador
  String titulo
  String professor
  int vagas
  double valor
  
  String curso
  int cargaHoraria
  String local
  Date data
  String horario
  
  def getParticipantesConfirmados() {
    def participantes = Participante.findAllByMiniCurso(this, [sort: "nome"])
    participantes.findAll { it.estadoAtual.estado == 'CONFIRMADO'}
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