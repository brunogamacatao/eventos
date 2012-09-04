package eventos

class Participante extends Pessoa {

    String socio
    Imagem comprovante
    
    static constraints = {
        socio(blank: false, inList: ["NÃO", "SIM"])
        comprovante(blank: false)
    }
}
