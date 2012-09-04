package eventos

class Curso {

    Evento evento
    String nome
    int vagas
    String tipo

    static belongsTo = [evento: Evento]
    static hasMany = [opcoes : Opcao]
    
    static constraints = {
        evento(blank: false)
        nome(blank: false)
        vagas(blank: false)
        tipo(blank: false, inList: ["Principal", "Secundario"])
    }
}
