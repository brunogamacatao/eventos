package eventos

class Titulo {

    double valor          = 0.0
    Date dataVencimento   = new Date()
    String nossoNumero    = "5555"
    String linhaDigitavel = "5555"
    Date dateCreated
    Date lastUpdated
    Participante participante
    
    static constraints = {
        valor(blank: false)
        dataVencimento(blank: false)
        nossoNumero(blank: false)
        linhaDigitavel(blank: false)
        participante(blank: false)
    }
}
