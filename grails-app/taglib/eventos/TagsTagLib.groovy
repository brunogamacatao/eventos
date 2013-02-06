package eventos

import java.text.Normalizer

class TagsTagLib {
    static final WIZARD_TITLE_CONTEXT = "wizardTitle"
  
    def imagem = { attrs ->
      out << "<img src='"
      out << g.createLink(
        action: "showImagem",
        controller: "imagem",
        id: attrs.id,
        params: [largura: attrs.largura, altura: attrs.altura])
      out << "'"

      if (attrs['class'])
        out << " class='${attrs['class']}'"

      out << "/>"
    }
    
    def wizard = { attrs, body -> 
      out << '<table align="center" border="0" cellpadding="0" cellspacing="0">'
      out << '<tr>'
      out << '<td>'
      out << '<div id="wizard" class="swMain">'
      out << body.call()
      out << '</div>'
      out << '</td>'
      out << '</tr>'
      out << '</table>'
    }
    
    def wizardTitle = { attrs, body ->
      request.setAttribute(WIZARD_TITLE_CONTEXT, [index: 1])
      out << "<ul>"
      out << body.call()
      out << "</ul>"
      request.removeAttribute(WIZARD_TITLE_CONTEXT)
    }
    
    def wizardStep = { attrs -> 
      def index = request.getAttribute(WIZARD_TITLE_CONTEXT).index
      
      out << "<li>"
      out << "<a href='#step-${index}'>"
      out << "<label class='stepNumber'>${index}</label>"
      out << "<span class='stepDesc'>Etapa ${index}<br/><small>${attrs.titulo}</small></span>"
      out << "</a>"
      out << "</li>"
      
      request.setAttribute(WIZARD_TITLE_CONTEXT, [index: index + 1])
    }
    
    def wizardContent = { attrs, body -> 
      def index = request.getAttribute(WIZARD_TITLE_CONTEXT)?.contentIndex ?: 1
      
      out << "<div id='step-${index}'>"
      out << "<h2 class='StepTitle'>${attrs.titulo}</h2>"
      out << "<br/>"
      out << body.call()
      out << "</div>"
      
      request.setAttribute(WIZARD_TITLE_CONTEXT, [contentIndex: index + 1])
    }
    
    def field = { attrs, body -> 
      def label    = attrs.label
      def id       = attrs.id ?: toUnderscoredString(attrs.label)
      def required = attrs.required ? attrs.required.equals("true") : true

      def style = ""
      if (required) style += "validate[required${attrs.email ? ',custom[email]' : ''}]"
      if (attrs.style) style += " " + attrs.style
      
      out << "<div class='control-group'>"
      out << "<label class='control-label' for='${id}'>${label}</label>"
      out << "<div class='controls'>"
      
      if (!body) {
        out << "<input type='text' id='${id}' name='${id}' placeholder='${label}' class='${style}'/>"
      } else {
        out << body.call()
      }
      
      out << "</div>"
      out << "</div>"
    }
    
    def fieldEstado = { attrs ->
      def required = attrs.required ? attrs.required.equals("true") : true

      def style = ""
      if (required) style += "validate[required]"
      if (attrs.style) style += " " + attrs.style
      
      out << g.select(name: attrs.nome, from: Constantes.ESTADO, noSelection: ['':'Selecione o estado'], 'class': style)
    }
    
    def caixas = { attrs, body ->
      out << "<div class='row-fluid' id='${attrs.id ?: "div_caixas"}'>"
      out << "<ul class='thumbnails'>"
      out << body.call()
      out << "</ul>"
      out << "</div>"
    }
    
    def caixa = { attrs, body ->
      def span = attrs.span ?: 4
      
      out << "<li class='span${span} ${attrs.'class' ?: ''}'>"
      out << "<div class='thumbnail'>"
      out << "<div class='caption'>"
      out << "<h5 class='titulo_${attrs.'class' ?: ''}'>${attrs.titulo}</h5>"
      out << body.call()
      out << "</div>"
      out << "</div>"
      out << "</li>"
    }

    def caixaMinicursos = { attrs, body -> 
      MiniCurso.findAllByCurso(attrs.curso).each { minicurso -> 
        out << caixa([titulo: "${minicurso.titulo} (${minicurso.cargaHoraria} horas)", span: '6', class: 'minicurso']) {
          out << "<p>${minicurso.vagas} vagas restantes</p>"
          out << "<p><strong>Professor:</strong> ${minicurso.professor}<br/>"
          out << "<strong>Local:</strong> ${minicurso.local}<br/>"
          out << "<strong>Hora e data:</strong> ${minicurso.horario} - ${minicurso.data.format("dd 'de' MMMM 'de' yyyy")}</p>"
          out << "<p><span class='label label-success'>"
          out << g.formatNumber(number: minicurso.valor, type: 'currency', locale: 'pt_BR')
          out << "</span></p>"
          out << "<input type='hidden' class='id_minicurso' value='${minicurso.identificador}'/>"
          if (minicurso.vagas > 0) {
            out << "<p class='btn_marcar'><a href='#' class='btn btn-large btn-block btn-primary'>Escolher</a></p>"
            out << "<p class='btn_desmarcar' style='display:none'><a href='#' class='btn btn-large btn-block btn-warning'>Desmarcar</a></p>"
          } else {
            out << "<h4>Vagas Esgotadas</h4>"
          }
        }
      }
    }
    
    def minicursosPorCurso = { attrs, body -> 
      def curso = attrs.curso
      out << caixas([id: "caixas_${curso}"]) {
        out << caixaMinicursos([curso: curso])
      }
    }
    
    def botaoModal = { attrs -> 
      out << "<a href='#${attrs.idModal}' role='button' class='btn btn-large btn-block btn-primary botao_modal' data-toggle='modal'>"
      out << attrs.label
      out << "</a>"
    }
    
    private def toUnderscoredString(string) {
      def semAcentos   = Normalizer.normalize(string, Normalizer.Form.NFD).replaceAll("\\p{InCombiningDiacriticalMarks}+", "")
      def semEspacos   = semAcentos.replaceAll(/\s/) { '_' }
      def semCamelCase = semEspacos.replaceAll(/\B[A-Z]/) { '_' + it }.toLowerCase() 
      semCamelCase.replaceAll(/_{2,}/) { '_' }
    }
}
