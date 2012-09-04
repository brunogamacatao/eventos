/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package eventos

/**
 *
 * @author desenvolvimento01
 */
import eventos.*

import grails.validation.Validateable
@Validateable

class EventoCommand {

    String nome
    String data
    String local
    String css
    Imagem logomarca
    Configuracao configuracao = new Configuracao()
    String status
    Date dataTermino
    byte[] imagem
    def imgFile

    static constraints = {
        nome(blank: false)
        data(blank: false)
        local(blank: false)
        configuracao(nullable: false)
        status(blank: false, inList: ['Inscricao', 'Finalizado'])
        dataTermino(blank: false)
        imagem(blank: false, validator: { value, obj ->
            if (!value || value.length == 0)
            return ['evento.logomarca.blank']
        })
    }
}



