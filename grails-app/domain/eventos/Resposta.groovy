package eventos

class Resposta {

    Participante participante
    Pergunta pergunta
    String resposta
    
    static constraints = {
        participante(blank: false)
        pergunta(blank: false)
        resposta(blank: false)
    }
}
