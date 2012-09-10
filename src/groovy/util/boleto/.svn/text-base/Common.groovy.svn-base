package util.boleto

class Common {
  static int calculaModulo10(String valor) {
    def total = 0
    def fator = (valor.length() % 2) == 0 ? 1 : 2
    
    for (def i in (0..valor.length() - 1)) {
      def resultado = (valor[i] as int) * fator++
      if (resultado >= 10)
        resultado = (("" + resultado)[0] as int) + (("" + resultado)[1] as int)
      total += resultado
      if (fator > 2) fator = 1
    }
    
    def mod = 10 - (total % 10)
    if (mod >= 10) mod = 0
    
    return mod
  }
  
  static int calculaModulo11(valor, base = 9, r = 0) {
    def soma  = 0
    def fator = 2
    
    for (def i : (valor.length() - 1 .. 0)) {
      def numero  = valor[i] as int
      def parcial = numero * fator
      soma += parcial
      if (fator == base) 
        fator = 1
      fator++
    }
    
    if (r == 0) {
      soma *= 10
      def digito = soma % 11
      if (digito == 10)
        digito = 0
      return digito
    }
    
    return soma % 11
  }
  
  static String truncate(def value, def size) {
    def str = String.format("%0${size}d", value)
    if (str.length() > size)
      str = str[-size .. str.length() - 1]
    return str
  }

}
