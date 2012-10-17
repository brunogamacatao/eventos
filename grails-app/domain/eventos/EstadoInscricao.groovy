package eventos

class EstadoInscricao {
  String estado
  Date dateCreated
  Date lastUpdated
  
  static belongsTo = [participante : Participante]
  
  static constraints = {
    estado(blank: false, inList: ['PENDENTE', 'CONFIRMADO', 'CANCELADO'])
  }
  
  String toString() {
    estado
  }
}