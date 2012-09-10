package eventos

class Baixa {

    Date dataPagamento
    double valorPago
    String observacao
    Usuario usuario
    Date dateCreated
    Date lastUpdated
    
    static belongsTo = [titulo : Titulo]
    
    static constraints = {
        dataPagamento(blank: false)
        valorPago(blank: false)
        observacao(blank: false)
        usuario(blank: false)
    }
}
