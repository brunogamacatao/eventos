package eventos

class Opcao {

    Evento evento
    String descricao
    double preco
    Date dataTermino
    
    static belongsTo = [curso: Curso]
    
    static constraints = {
        evento(blank: false)
        descricao(blank: false)
        preco(blank: false)
        dataTermino(blank: false)
        curso(nullable: true)
    }
    
    String toString(){
        "${descricao} - ${String.format('R$ %(,6.2f', preco)} - ${dataTermino.format('dd/MM/yyyy')}"
    }
}
