package eventos

class Pergunta {

    String titulo
    String tipo
    int ordem
    
    static belongsTo = [questionario: Questionario]
    static hasMany = [opcoes : OpcaoResposta]    
    
    static constraints = {
        titulo(blank: false)
        tipo(blank: false, inList: ["Objetiva", "Discursiva"])
        ordem(blank: false)
    }
    
    String toString(){
        "${titulo} - ${tipo} - ${ordem}"
    }
}
