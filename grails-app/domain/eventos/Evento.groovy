package eventos

import bgc.thumbnail.Thumbnail

class Evento {

    String identificador
    String nome
    String data
    String local
    Thumbnail logomarca
    Configuracao configuracao
    String status
    Date dataTermino
    int desconto
    String css

    static hasMany = [cursos : Curso]

    static constraints = {
        nome(blank: false)
        data(blank: false)
        local(blank: false)
        identificador(nullable: true)
        logomarca(blank: false)
        configuracao(blank: false)
        status(blank: false, inList: ['Inscricao', 'Finalizado'])
        dataTermino(blank: false)
        desconto(blank: false, max: 100)
        css(nullable: true, widget: 'textarea')
    }

    transient beforeInsert = {
        identificador = java.util.UUID.randomUUID().toString()
    }

    static mapping = {
        css type: 'text'
    }
    
    String toString(){
        return nome
    }

}
