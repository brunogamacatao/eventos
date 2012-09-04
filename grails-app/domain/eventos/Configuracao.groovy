package eventos

class Configuracao {

    int banco
    int agencia
    int conta
    int carteira
    int convenio
    int operacao

    static constraints = {
        banco(blank: false)
        agencia(blank: false)
        conta(blank: false)
        carteira(blank: false)
        convenio(blank: false)
        operacao(blank: false)
    }

    String toString(){
        return banco+" - "+agencia+" - "+conta
    }
}
