import eventos.Grupo
import eventos.Usuario
import eventos.UsuarioGrupo
import eventos.MiniCurso

class BootStrap {
  def springSecurityService
  
  def init = { servletContext ->
    // Criação dos grupos padrão
    def usuarioRole = Grupo.findByAuthority('ROLE_USUARIO') ?: new Grupo(authority: 'ROLE_USUARIO').save(failOnError: true)
    def adminRole   = Grupo.findByAuthority('ROLE_ADMIN')   ?: new Grupo(authority: 'ROLE_ADMIN').save(failOnError: true)

    // Criação do usuário administrador   
    def adminUser = Usuario.findByUsername('ADMIN') ?: new Usuario(
      username: 'admin',
      password: 'admin',
      enabled: true).save(failOnError: true)

    if (!adminUser.authorities.contains(adminRole)) {
      UsuarioGrupo.create(adminUser, adminRole)
    }
    
    // Criação dos minicursos
    def miniCurso1 = MiniCurso.findByIdentificador(1) ?: new MiniCurso(identificador: 1, titulo: 'Medicina forense', professor: 'Nayra Soares do Amaral - (UFMG)', vagas: 70, valor: 20.0).save(failOnError: true)
    def miniCurso2 = MiniCurso.findByIdentificador(2) ?: new MiniCurso(identificador: 2, titulo: 'A citogenética molecular aplicada ao diagnóstico pré-natal e às perdas fetais', professor: 'Elen Rose Carvalho - (Códon Biotecnologia - BH)', vagas: 70, valor: 20.0).save(failOnError: true)
    def miniCurso3 = MiniCurso.findByIdentificador(3) ?: new MiniCurso(identificador: 3, titulo: 'Conceitos e aplicações da medicina nuclear no diagnóstico em oncologia', professor: 'Marcelo César Garcia Carneiro - (Hospital Pró-Cardíaco RJ)', vagas: 70, valor: 20.0).save(failOnError: true)
    def miniCurso4 = MiniCurso.findByIdentificador(4) ?: new MiniCurso(identificador: 4, titulo: 'Teste de paternidade: técnicas básicas e cálculos estatísticos', professor: 'Juliana Ramos Pimenta - (Síntese Biotecnologia-BH)', vagas: 70, valor: 20.0).save(failOnError: true)
    
    miniCurso3.titulo = 'Medicina Nuclear - princípios e aplicações'
    miniCurso3.save(flush: true, failOnError: true)
  }
  
  def destroy = {
  }
}
