package eventos

class RelatorioController {

  def index() { }
    
  def resumo() {
    def participantes = Participante.list(sort: "nome")
    [participantes: participantes.findAll { it.estadoAtual.estado == 'CONFIRMADO'}]
  }
  
  def downloadResumo() {
    def participante = Participante.get(params.id)
    response.setContentType("application/pdf")
    response.setHeader("Content-disposition", "filename=${participante.artigo.nomeArquivo}")
    response.outputStream << participante.artigo.imagem
    response.outputStream.flush()
  }
  
  def minicursos() {
    [minicursos:  MiniCurso.list(sort: "titulo")]
  }
  
  def participantesMinicurso() {
    def minicurso = MiniCurso.get(params.id)
    [participantes: minicurso.participantesConfirmados]
  }
}
