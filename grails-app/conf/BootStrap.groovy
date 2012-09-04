import eventos.Grupo
import eventos.Usuario
import eventos.UsuarioGrupo

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
  }
  
  def destroy = {
  }
}
