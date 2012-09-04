package eventos

class Titulo {

    double valor
    Date dataVencimento
    String nossoNumero
    String linhaDigitavel
    Date dateCreated
    Date lastUpdated
    
    static belongsTo = [baixa: Baixa]
    
    static constraints = {
        valor(blank: false)
        dataVencimento(blank: false)
        nossoNumero(blank: false)
        linhaDigitavel(blank: false)
    }
}
