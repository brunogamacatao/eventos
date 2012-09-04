package eventos

class OpcaoResposta {

    String descricao
    
    static belongsTo = [pergunta: Pergunta]
    
    static constraints = {
        descricao(blank: false)
    }
    
    String toString(){
        "${descricao}"
    }
}
