package eventos

class MiniCurso {
  int identificador
  String titulo
  String professor
  int vagas
  double valor
  
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
  }
}