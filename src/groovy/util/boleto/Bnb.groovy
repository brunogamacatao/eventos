package util.boleto

import java.text.SimpleDateFormat
import static util.boleto.Common.calculaModulo10
import static util.boleto.Common.truncate

class Bnb implements Banco {
  final def DATA_BASE_INICIAL = new SimpleDateFormat("dd/MM/yyyy").parse("03/07/2000")
  final def NUMERO_BANCO      = 4
  final def TEMPLATE_NAME     = "/boleto/bnb"
  
  def boleto
  
  String getTemplateName() {
    return TEMPLATE_NAME
  }
  
  int getNumero() {
    return NUMERO_BANCO
  }
  
  void setBoleto(Boleto boleto, dataAtual = new Date()) {
    this.boleto = boleto
    this.boleto.cedente.nossoNumero = getNossoNumero(dataAtual) + getNossoNumeroDV(dataAtual)
  }
  
  String getNossoNumero(dataAtual = new Date()) {
    /*
     * O nosso número deverá ser construído da seguinte forma:
     * O 1º algarismo é o último dígito do ano atual, ex 2011 => 1
     * Os 6 algarismos restantes devem ser o número do documento.
     */
    return (dataAtual[Calendar.YEAR] as String)[-1] + truncate(boleto.documento.numero, 6)
  }
  
  int getNossoNumeroDV(dataAtual = new Date()) {
    return Common.calculaModulo11(getNossoNumero(dataAtual))
  }
  
  long getFatorVencimento() {
    return boleto.datas.vencimento - DATA_BASE_INICIAL + 1000
  }
  
  def getCampoLivre() {
    return String.format("%02d", boleto.cedente.operacao) +
      String.format("%07d", boleto.cedente.conta) +
      boleto.cedente.nossoNumero +
      String.format("%03d", boleto.documento.parcela ?: 1)
  }
  
  def getValorFormatado() {
    return String.format("%010d", (int)(boleto.valor * 100))
  }
  
  String getCodigoDeBarrasSemDV() {
    return String.format("%03d", NUMERO_BANCO) + 
            boleto.moeda + 
            "0" +
            String.format("%04d", getFatorVencimento()) + 
            getValorFormatado() + 
            String.format("%04d", boleto.cedente.agencia) +
            String.format("%07d", boleto.cedente.conta) +
            "1" +
            getNossoNumero() + getNossoNumeroDV() +
            String.format("%02d", boleto.cedente.carteira) +
            "000"
  }
  
  String getCodigoDeBarras() {
    def linha = getCodigoDeBarrasSemDV()
    return linha[0..3] + calculaDigitoVerificadorCodigoDeBarras(linha) + linha[5..linha.length() - 1]
  }
  
  static String calculaDigitoVerificadorCodigoDeBarras(String numero) {
    def pesos = '43290876543298765432987654329876543298765432'
    def soma  = 0
    for (i in 0..<numero.length())
      soma += (numero[i] as int) * (pesos[i] as int)
    def digito = 11 - (soma % 11)
    if (digito >= 10)
      digito = 1
    return digito
  }

  List<String> getLinhaDigitavel() {
    def linha = getCodigoDeBarras()
    def linhaDigitavel = []
    
    def p1 = linha[0..<4]
    def p2 = linha[19..<24]
    def p3 = Common.calculaModulo10("${p1}${p2}")
    def p4 = "${p1}${p2}${p3}"
    def p5 = p4[0..<5]
    def p6 = p4[5..<p4.length()]
    def campoA = "${p5}.${p6}"

    p1 = linha[24..<34]
    p2 = Common.calculaModulo10(p1)
    p3 = "${p1}${p2}"
    p4 = p3[0..<5]
    p5 = p3[5..<p3.length()]
    def campoB = "${p4}.${p5}"

    p1 = linha[34..<44]
    p2 = Common.calculaModulo10(p1)
    p3 = "${p1}${p2}"
    p4 = p3[0..<5]
    p5 = p3[5..<p3.length()]
    def campoC = "${p4}.${p5}"
    def campoD = linha[4]
    def campoE = linha[5..<19]
    
    linhaDigitavel << campoA
    linhaDigitavel << campoB
    linhaDigitavel << campoC
    linhaDigitavel << campoD
    linhaDigitavel << campoE
        
    return linhaDigitavel
  }
}
