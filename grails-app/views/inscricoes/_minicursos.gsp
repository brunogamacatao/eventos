<%@ page import="eventos.MiniCurso" %>
<h5>Curso:
<select id="curso_minicurso">
  <option>Selecione o Workshop</option>
  <option value="arquitetura">Arquitetura e Urbanismo</option>
  <option value="administracao">Administração</option>
  <option value="direito">Direito</option>
  <option value="enfermagem">Enfermagem</option>
  <option value="esac">Esac</option>
  <option value="fisioterapia">Fisioterapia</option>
  <option value="medicina">Medicina</option>
  <option value="sistemas">Sistemas de Informação</option>
  <option value="jogos">Jogos Digitais</option>
  <option value="construcao">Construção de Edifícios</option>
</select>
</h5>
<hr/>
<g:minicursosPorCurso curso="arquitetura"/>
<g:minicursosPorCurso curso="administracao"/>
<g:minicursosPorCurso curso="direito"/>
<g:minicursosPorCurso curso="enfermagem"/>
<g:minicursosPorCurso curso="esac"/>
<g:minicursosPorCurso curso="fisioterapia"/>
<g:minicursosPorCurso curso="medicina"/>
<g:minicursosPorCurso curso="sistemas"/>
<g:minicursosPorCurso curso="jogos"/>
<g:minicursosPorCurso curso="construcao"/>
