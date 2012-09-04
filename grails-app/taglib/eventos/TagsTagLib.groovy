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
    
    private def toUnderscoredString(string) {
      def semAcentos   = Normalizer.normalize(string, Normalizer.Form.NFD).replaceAll("\\p{InCombiningDiacriticalMarks}+", "")
      def semEspacos   = semAcentos.replaceAll(/\s/) { '_' }
      def semCamelCase = semEspacos.replaceAll(/\B[A-Z]/) { '_' + it }.toLowerCase() 
      semCamelCase.replaceAll(/_{2,}/) { '_' }
    }
}
