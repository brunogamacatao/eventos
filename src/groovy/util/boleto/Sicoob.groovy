package util.boleto

import java.text.SimpleDateFormat
import static util.boleto.Common.calculaModulo10
import static util.boleto.Common.truncate

class Sicoob implements Banco {
  final def DATA_BASE_INICIAL = new SimpleDateFormat("dd/MM/yyyy").parse("03/07/2000")
  final def NUMERO_BANCO      = 756
  final def TEMPLATE_NAME     = "/boleto/sicoob"
  
  def boleto
  
  String getTemplateName() {
    return TEMPLATE_NAME
  }
  
  int getNumero() {
    return NUMERO_BANCO
  }
  
  void setBoleto(Boleto boleto) {
    this.boleto = boleto
    this.boleto.cedente.nossoNumero = getNossoNumero() + getNossoNumeroDV()
  }
  
  String getNossoNumero() {
    /*
     * O nosso número deverá ser construído da seguinte forma:
     * O 1º algarismo é o último dígito do ano atual, ex 2011 => 1
     * Os 6 algarismos restantes devem ser o número do documento.
     */
    return (new Date()[Calendar.YEAR] as String)[-1] + truncate(boleto.documento.numero, 6)
  }
  
  int getNossoNumeroDV() {
    def numeroCooperativa = String.format("%04d",  boleto.cedente.agencia)
    def numeroCliente     = String.format("%010d", boleto.cedente.conta)
    def nossoNumero       = getNossoNumero()
    def constante         = "319731973197319731973"
    
    def sequencia = numeroCooperativa + numeroCliente + nossoNumero
    def total     = 0
    
    for (def i in (0..sequencia.length() - 1)) {
      total += (sequencia[i] as int) * (constante[i] as int)
    }
    
    def dv = 11 - (total % 11)
    dv = dv in [0, 1, 10, 11] ? 0 : dv
    
    return dv
  }
  
  long getFatorVencimento() {
    return boleto.datas.vencimento - DATA_BASE_INICIAL + 1000
  }
  
  private String getCampoLivre() {
    return String.format("%02d", boleto.cedente.operacao) +
      String.format("%07d", boleto.cedente.conta) +
      boleto.cedente.nossoNumero +
      String.format("%03d", boleto.documento.parcela ?: 1)
  }
  
  String getCodigoDeBarras() {
    def linha = String.format("%03d", NUMERO_BANCO) + 
      boleto.moeda + 
      String.format("%04d", getFatorVencimento()) + 
      String.format("%010d", (int)(boleto.valor * 100)) + 
      boleto.cedente.carteira + 
      String.format("%04d", boleto.cedente.agencia) +
      getCampoLivre()
      
    def total = 0
    def fator = 2
    
    for (def i in (linha.length() - 1 .. 0)) {
      total += (linha[i] as int) * fator++
      if (fator > 9) fator = 2
    }
    
    def dv = 11 - total % 11
    dv = dv in [0, 1, 10, 11] ? 1 : dv
    
    return linha[0..3] + dv + linha[4..linha.length() - 1]
  }
  
  List<String> getLinhaDigitavel() {
    def linhaDigitavel = []
    
    // 1º campo: Composto pelo código do banco, código da moeda, código da carteira e código da cooperativa;
    def campoA = String.format("%03d", NUMERO_BANCO) + 
      boleto.moeda + 
      boleto.cedente.carteira + 
      String.format("%04d", boleto.cedente.agencia)
    campoA += calculaModulo10(campoA)

    // 2º campo: Composto pelas posições 1ª a 10ª  do campo livre e o dígito verificador deste campo;
    def campoB = getCampoLivre()[0..9]
    campoB += calculaModulo10(campoB)
    
    // 3º campo: Composto pelas posições 11ª a 20ª do campo livre e o dígito verificador deste campo;
    def campoC = getCampoLivre()[10..19]
    campoC += calculaModulo10(campoC)
    
    // 4º campo: Dígito do código de barras (de acordo com o ANEXO I);
    def campoD = getCodigoDeBarras()[4]
    /*
     * 5º campo: Composto pelo valor nominal do documento com supressão de 
     *           zeros e sem edição. Quando se tratar de valor zerado, a 
     *           representação deverá ser 000 (três zeros).
     */
    def campoE = String.format("%04d", getFatorVencimento()) + String.format("%010d", (int)(boleto.valor * 100))
    
    linhaDigitavel << campoA[0..4] + '.' + campoA[5..campoA.length() - 1]
    linhaDigitavel << campoB[0..4] + '.' + campoB[5..campoB.length() - 1]
    linhaDigitavel << campoC[0..4] + '.' + campoC[5..campoC.length() - 1]
    linhaDigitavel << campoD
    linhaDigitavel << campoE
        
    return linhaDigitavel
  }
}
