package eventos

class Titulo {

    double valor          = 0.0
    Date dataVencimento   = new Date()
    String nossoNumero    = "5555"
    String linhaDigitavel = "5555"
    Date dateCreated
    Date lastUpdated
    
    static belongsTo = [participante : Participante]
    static hasMany   = [pagamentos : Pagamento]
    
    static constraints = {
        valor(blank: false)
        dataVencimento(blank: false)
        nossoNumero(blank: false)
        linhaDigitavel(blank: false)
        participante(blank: false)
    }
    
    def getPago() {
      def total = 0.0
      pagamentos.each { total += it.valor }
      total >= 0.0
    }
}
