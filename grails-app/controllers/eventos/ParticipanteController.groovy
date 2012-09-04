package eventos

import org.springframework.dao.DataIntegrityViolationException

class ParticipanteController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def inscricao = {
        if(params.evento){
            def eventoInstance = Evento.findByIdentificador(params.evento)
            if(eventoInstance){
                [participanteInstance: new Participante(params), eventoInstance: eventoInstance]
            }else{
                redirect(url: "http://www.google.com.br")
            }
        }else{
            redirect(url: "http://www.google.com.br")
        }
    }
    
    
    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [participanteInstanceList: Participante.list(params), participanteInstanceTotal: Participante.count()]
    }

    def create() {
        [participanteInstance: new Participante(params)]
    }

    def save() {
        def participanteInstance = new Participante(params)
        if (!participanteInstance.save(flush: true)) {
            render(view: "create", model: [participanteInstance: participanteInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'participante.label', default: 'Participante'), participanteInstance.id])
        redirect(action: "show", id: participanteInstance.id)
    }

    def show(Long id) {
        def participanteInstance = Participante.get(id)
        if (!participanteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'participante.label', default: 'Participante'), id])
            redirect(action: "list")
            return
        }

        [participanteInstance: participanteInstance]
    }

    def edit(Long id) {
        def participanteInstance = Participante.get(id)
        if (!participanteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'participante.label', default: 'Participante'), id])
            redirect(action: "list")
            return
        }

        [participanteInstance: participanteInstance]
    }

    def update(Long id, Long version) {
        def participanteInstance = Participante.get(id)
        if (!participanteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'participante.label', default: 'Participante'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (participanteInstance.version > version) {
                participanteInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                    [message(code: 'participante.label', default: 'Participante')] as Object[],
                          "Another user has updated this Participante while you were editing")
                render(view: "edit", model: [participanteInstance: participanteInstance])
                return
            }
        }

        participanteInstance.properties = params

        if (!participanteInstance.save(flush: true)) {
            render(view: "edit", model: [participanteInstance: participanteInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'participante.label', default: 'Participante'), participanteInstance.id])
        redirect(action: "show", id: participanteInstance.id)
    }

    def delete(Long id) {
        def participanteInstance = Participante.get(id)
        if (!participanteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'participante.label', default: 'Participante'), id])
            redirect(action: "list")
            return
        }

        try {
            participanteInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'participante.label', default: 'Participante'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'participante.label', default: 'Participante'), id])
            redirect(action: "show", id: id)
        }
    }
}
