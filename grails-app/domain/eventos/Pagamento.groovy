package eventos

class Pagamento {
  String nossoNumero
  Date dataPagamento = new Date()
  BigDecimal valor = 0.0
  String observacao
  Usuario usuario
  Date dateCreated
  Date lastUpdated
  
  static belongsTo = [titulo : Titulo]
  
  static constraints = {
    nossoNumero(blank: false)
    dataPagamento(blank: false)
    valor(blank: false)
  }
}