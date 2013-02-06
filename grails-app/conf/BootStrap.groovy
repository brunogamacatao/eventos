import groovy.sql.Sql
import org.codehaus.groovy.grails.commons.ConfigurationHolder
import static java.util.Calendar.*

import eventos.Grupo
import eventos.Usuario
import eventos.UsuarioGrupo
import eventos.MiniCurso
import eventos.EstadoInscricao
import eventos.Participante

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
    
    // Criação dos minicursos do ENPAC
    MiniCurso.findByIdentificador(5) ?: new MiniCurso(identificador: 5, curso: 'arquitetura', titulo: 'Conforto Ambiental: Iluminação Natural e Artificial', cargaHoraria: 5, vagas: 30, professor: 'José Tadeu de Almeida', local: 'Laboratório de Conforto', data: new GregorianCalendar(2013, APRIL, 18).time, horario: 'Tarde 14h às 18h', valor: 10.0).save(failOnError: true)
    MiniCurso.findByIdentificador(6) ?: new MiniCurso(identificador: 6, curso: 'arquitetura', titulo: 'Acústica no Ambiente Construído', cargaHoraria: 5, vagas: 30, professor: 'Jean Fechine', local: 'Laboratório de Arquitetura', data: new GregorianCalendar(2013, APRIL, 18).time, horario: 'Manhã 8h às 12h', valor: 10.0).save(failOnError: true)
    MiniCurso.findByIdentificador(7) ?: new MiniCurso(identificador: 7, curso: 'administracao', titulo: 'Prática Empreendedora', cargaHoraria: 5, vagas: 40, professor: 'Vera Barreto Motta', local: 'Sala', data: new GregorianCalendar(2013, APRIL, 18).time, horario: 'Noite 18h às 22h', valor: 10.0).save(failOnError: true)
    MiniCurso.findByIdentificador(8) ?: new MiniCurso(identificador: 8, curso: 'direito', titulo: 'Júri Simulado - Tema: Os surdos e o judiciário. A possibilidade de atuação de profissionais surdos no direito', cargaHoraria: 5, vagas: 300, professor: 'Dr. Breno Wanderley Segundo', local: 'Auditório do CESED', data: new GregorianCalendar(2013, APRIL, 18).time, horario: 'Noite 18h às 22h', valor: 10.0).save(failOnError: true)
    MiniCurso.findByIdentificador(9) ?: new MiniCurso(identificador: 9, curso: 'enfermagem', titulo: 'Oficina - Primeiros Socorros Atendimento Básico', cargaHoraria: 5, vagas: 40, professor: 'Andreia Barros', local: 'Sala', data: new GregorianCalendar(2013, APRIL, 18).time, horario: 'Manhã 8h às 12h', valor: 10.0).save(failOnError: true)
    MiniCurso.findByIdentificador(10) ?: new MiniCurso(identificador: 10, curso: 'esac', titulo: 'A dinâmica dos fluídos e a sustentação da asa', cargaHoraria: 5, vagas: 50, professor: 'Dr. Marcos Antônio Barros', local: 'ESAC', data: new GregorianCalendar(2013, APRIL, 18).time, horario: 'Tarde 14h às 18h', valor: 10.0).save(failOnError: true)
    MiniCurso.findByIdentificador(11) ?: new MiniCurso(identificador: 11, curso: 'fisioterapia', titulo: 'A utilização da lipodistrofia como potencializador no tratamento de redução de medidas', cargaHoraria: 5, vagas: 30, professor: 'Sheila Carla Agra de Farias', local: 'Laboratório de Eletrotermofototerapia', data: new GregorianCalendar(2013, APRIL, 18).time, horario: 'Manhã 8h às 12h', valor: 10.0).save(failOnError: true)
    MiniCurso.findByIdentificador(12) ?: new MiniCurso(identificador: 12, curso: 'fisioterapia', titulo: 'Fisioterapia Neurofuncional e sua atuação na Paralisia Facial', cargaHoraria: 5, vagas: 25, professor: 'Adriana Lima de Holanda', local: 'Laboratório de Terapia Manual', data: new GregorianCalendar(2013, APRIL, 18).time, horario: 'Tarde 14h às 18h', valor: 10.0).save(failOnError: true)
    MiniCurso.findByIdentificador(13) ?: new MiniCurso(identificador: 13, curso: 'medicina', titulo: 'Abordagem Inicial do Paciente Crítico', cargaHoraria: 5, vagas: 20, professor: 'Dr. André Teixeira', local: 'Hospital Simulado FCM', data: new GregorianCalendar(2013, APRIL, 18).time, horario: 'Tarde 14h às 18h', valor: 10.0).save(failOnError: true)
    MiniCurso.findByIdentificador(14) ?: new MiniCurso(identificador: 14, curso: 'medicina', titulo: 'Realização de experimento a partir de DNA extraído de amostra biológica humana', cargaHoraria: 5, vagas: 10, professor: 'Dr. Bruno Luiz Reis e Dra. Juliana Garcia Carneiro', local: 'Laboratório - NUGEM', data: new GregorianCalendar(2013, APRIL, 18).time, horario: 'Manhã 8h às 12h', valor: 10.0).save(failOnError: true)
    MiniCurso.findByIdentificador(15) ?: new MiniCurso(identificador: 15, curso: 'sistemas', titulo: 'Planejamento de Software', cargaHoraria: 5, vagas: 50, professor: 'Isabel Dillmann', local: 'FACISA', data: new GregorianCalendar(2013, APRIL, 18).time, horario: 'Noite 18h às 22h', valor: 10.0).save(failOnError: true)
    MiniCurso.findByIdentificador(16) ?: new MiniCurso(identificador: 16, curso: 'jogos', titulo: 'Porte de Jogos para o Sony Playstation Vita', cargaHoraria: 5, vagas: 40, professor: 'José Antônio Leal Farias (JALF)', local: 'FACISA', data: new GregorianCalendar(2013, APRIL, 18).time, horario: 'Tarde 14h às 18h', valor: 10.0).save(failOnError: true)
    MiniCurso.findByIdentificador(17) ?: new MiniCurso(identificador: 17, curso: 'construcao', titulo: 'Da compra do terreno à construção: procedimentos legais', cargaHoraria: 5, vagas: 50, professor: 'Débora Barbosa - Gerente de Contas do Grupo Rocha Cavalcanti', local: 'FACISA', data: new GregorianCalendar(2013, APRIL, 20).time, horario: 'Tarde 14h às 18h', valor: 10.0).save(failOnError: true)
    
    /*
     * Todos os participantes devem ter um estado associado, definido em sua
     * criação, o código abaixo adapta os registros legados para que estes 
     * também tenham um estado.
     */
     Participante.list().each { participante -> 
       if (!participante.estadoAtual) {
         participante.addToEstados(new EstadoInscricao(estado: 'PENDENTE')).save(flush: true, failOnError: true)
       }
     }
     
     // Executando scripts de migracao do banco de dados
/*     def sql = Sql.newInstance(ConfigurationHolder.config.dataSource.url, ConfigurationHolder.config.dataSource.username, ConfigurationHolder.config.dataSource.password, ConfigurationHolder.config.dataSource.driverClassName)
     sql.execute("ALTER TABLE mini_curso ADD curso VARCHAR(50) NOT NULL")
     sql.execute("ALTER TABLE mini_curso ADD carga_horaria INT(11) NOT NULL")
     sql.execute("ALTER TABLE mini_curso ADD local VARCHAR(50) NOT NULL")
     sql.execute("ALTER TABLE mini_curso ADD data DATETIME NOT NULL")
     sql.execute("ALTER TABLE mini_curso ADD horario VARCHAR(50) NOT NULL")
     sql.execute("COMMIT")
*/     
  }
  
  def destroy = {
  }
}
