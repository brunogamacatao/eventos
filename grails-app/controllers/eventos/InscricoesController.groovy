package eventos

import java.text.SimpleDateFormat

import util.boleto.*

class InscricoesController {

    def index() {
/*      def evento = Evento.findByIdentificador(params.id)
      
      if (evento) {
        [evento: evento]
      } else {
        redirect(action: 'eventoNaoEncontrado')
      }
*/    }
    
    def eventoNaoEncontrado() {
      
    }
    
    def gerarBoleto = {
      def df              = new SimpleDateFormat("dd/MM/yyyy")
      def dataVencimento  = new Date() + 1
      def valorTotal      = 160.0

/*      def titulo = new Titulo(valor: valorTotal, vencimento: dataVencimento, candidato: candidato)
      titulo.save(flush: true)
*/
      def numeroDocumento = 1//titulo.id

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
          nome     "Nome Completo"
          cpf      "042.209.704-79"
          endereco "Endereço, 611 Complemento"
          bairro   "Bairro"
          cep      "58402-030"
          cidade   "Campina Grande", "PB"
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

/*      titulo.nossoNumero = "${banco.getNossoNumero()}${banco.getNossoNumeroDV()}"
      titulo.linhaDigitavel = banco.getLinhaDigitavel().join(' ')
      titulo.save(flush: true)
*/
      render(view: banco.getTemplateName(), model: [boleto: boleto, banco: banco, vestibular: vestibular, candidato: candidato])
    }
}
