package eventos

import java.text.SimpleDateFormat

import util.boleto.*

class InscricoesController {
    private static final def DATE_FORMAT = new SimpleDateFormat("dd/MM/yyyy")

    def index() { }
    
    def eventoNaoEncontrado() { }
    
    def gerarBoleto = {
      def participante    = criarParticipante(params)
      def (boleto, banco) = criarBoleto(participante)

      render(view: banco.getTemplateName(), model: [boleto: boleto, banco: banco, participante: participante])
    }
    
    private def criarParticipante(params) {
      def participante = new Participante()
      
      participante.nome               = params.nome_completo
      participante.sexo               = params.sexo
      participante.cpf                = params.cpf
      participante.dataNascimento     = DATE_FORMAT.parse(params.data_de_nascimento)
      participante.rg                 = params.rg
      participante.orgaoEmissor       = params.orgao_emissor
      participante.estadoRG           = params.estado_emissor
      participante.estadoCivil        = params.estadoCivil
      participante.nacionalidade      = "Brasileiro"
      participante.pais               = "Brasil"
      participante.estadoNaturalidade = params.estado_naturalidade
      participante.cidadeNaturalidade = params.cidade_naturalidade
      participante.cep                = params.cep
      participante.endereco           = params.endereco
      participante.numero             = params.numero
      participante.complemento        = params.complemento
      participante.bairro             = params.bairro
      participante.cidade             = params.cidade
      participante.estado             = params.estado
      participante.telefone1          = params.telefone
      participante.telefone2          = params.celular
      participante.email              = params.email
      participante.tipoParticipante   = params.tipo_participante
      participante.socioSbg           = "true" == params.socio_sbg
      participante.socioSbmcta        = "true" == params.socio_sbmcta
      participante.socio              = (participante.socioSbg || participante.socioSbmcta) ? "SIM" : "NÃO"
      
      carregarArquivos(participante, params)
      
      if (params.id_minicurso && params.id_minicurso != '') {
        participante.miniCurso = MiniCurso.findByIdentificador(params.id_minicurso)
      }
      
      participante.save(flush: true, failOnError: true)
      
      return participante
    }
    
    private def carregarArquivos(participante, params) {
      if (params.arquivo_comprovante && params.arquivo_comprovante != '') {
        File imgFile = new File(session.arquivos['comprovante'])
        participante.comprovante = new Imagem(imagem: imgFile.bytes, nomeArquivo: imgFile.name, largura: 0, altura: 0).save(flush: true, failOnError: true)
      }
      
      if (params.arquivo_socio && params.arquivo_socio != '') {
        File imgFile = new File(session.arquivos['socio'])
        participante.comprovanteSocio = new Imagem(imagem: imgFile.bytes, nomeArquivo: imgFile.name, largura: 0, altura: 0).save(flush: true, failOnError: true)
      }

      if (params.arquivo_artigo && params.arquivo_artigo != '') {
        File imgFile = new File(session.arquivos['artigo'])
        participante.artigo = new Imagem(imagem: imgFile.bytes, nomeArquivo: imgFile.name, largura: 0, altura: 0).save(flush: true, failOnError: true)
      }
    }
    
    private def calculaValorTotal(participante) {
      def valorPorParticipante = ['aluno_graduacao'     : 100.0, 
                                  'aluno_pos_graduacao' : 120.0, 
                                  'aluno_pos_doc'       : 140.0, 
                                  'profissional'        : 160.0]
      
      def valorTotal = valorPorParticipante[participante.tipoParticipante]

      if (participante.socioSbmcta || participante.socioSbg) {
        valorTotal *= 0.8
      }
      
      return valorTotal
    }
    
    private def criarBoleto(participante) {
      def dataVencimento = new Date() + 3
      def valorTotal = calculaValorTotal(participante)
      def titulo = new Titulo(valor: valorTotal, vencimento: dataVencimento, participante: participante).save(flush: true, failOnError: true)
      def numeroDocumento = titulo.id

      def boleto = Boleto.getInstance {
        datas {
          vencimento    dataVencimento
          documento     new Date()
          processamento new Date()
        }
        cedente {
          cedente  "Centro de Ensino Superior e Desenvolvimento"
          cnpj     "02.108.023.0001/40"
          agencia  123
          conta    321
          convenio 13
          carteira 57
          operacao 12
        }
        sacado {
          nome     participante.nome
          cpf      participante.cpf
          endereco "${participante.endereco}, ${participante.numero} ${participante.complemento}"
          bairro   participante.bairro
          cep      participante.cep
          cidade   participante.cidade, participante.estado
        }
        aceite "S"
        documento {
          numero numeroDocumento
          especie "DM"
        }
        moeda 9
        valor valorTotal
        pagamento "Pagar até o vencimento",
                  "Não receber após a data de vencimento"
        instrucoes "Não receber após a data de vencimento",
                   "&nbsp;",
                   "CESED - CNPJ: 02.108.023.0001/40",
                   "Av. Senador Argemiro de Figueiredo, 1901 - Itararé",
                   "CEP: 58411-020, Campina Grande/PB"
      }

      def banco = new Bnb()
      banco.setBoleto(boleto)

      titulo.nossoNumero = "${banco.getNossoNumero()}${banco.getNossoNumeroDV()}"
      titulo.linhaDigitavel = banco.getLinhaDigitavel().join(' ')
      titulo.save(flush: true)
      
      return [boleto, banco]
    }
}
