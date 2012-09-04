package eventos

class Pessoa {

    String nome
    String sexo
    String cpf
    Date dataNascimento
    String rg
    String orgaoEmissor
    String estadoRG = "Paraíba"
    String estadoCivil
    String nacionalidade = "Brasileiro"
    String pais
    String estadoNaturalidade = "Paraíba"
    String cidadeNaturalidade = "Campina Grande"
    String cep
    String endereco
    String numero
    String complemento
    String bairro
    String cidade
    String estado
    String telefone1
    String telefone2
    String email

    static constraints = {
        nome(blank: false)
        sexo(blank: false, inList: Constantes.SEXO)
        dataNascimento(blank: false)
        cpf(blank: false)
        rg(nullable: true)
        orgaoEmissor(blank: false)
        estadoRG(blank: false, inList: Constantes.ESTADO)
        estadoCivil(blank: false, inList: Constantes.ESTADO_CIVIL)
        nacionalidade(blank: false, inList: Constantes.NACIONALIDADE)
        pais(nullable: true)
        estadoNaturalidade(blank: false, inList: Constantes.ESTADO)
        cidadeNaturalidade(nullable: true)
        cep(blank: false)
        endereco(blank: false)
        numero(blank: false)
        bairro(blank: false)
        cidade(blank: false)
        telefone1(blank: false)
        email(blank: false)
        complemento(nullable: true)
        estado(blank: false, inList: Constantes.ESTADO)
    }
}
