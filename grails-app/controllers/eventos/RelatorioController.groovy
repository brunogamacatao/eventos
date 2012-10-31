package eventos

class RelatorioController {

  def index() { }
    
  def resumo() {
    def participantes = Participante.list(sort: "nome")
    [participantes: participantes.findAll { it.estadoAtual.estado == 'CONFIRMADO'}]
  }
}
