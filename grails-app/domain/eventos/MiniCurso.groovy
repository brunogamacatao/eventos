package eventos

class MiniCurso {
  int identificador
  String titulo
  String professor
  int vagas
  double valor
  
  static constraints = {
    identificador(blank: false, unique: true)
    titulo(blank: false)
    professor(blank: false)
    vagas(min: 0)
    valor(min: 0.0d)
  }
}