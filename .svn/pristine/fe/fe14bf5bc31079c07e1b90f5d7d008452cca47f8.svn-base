package eventos

import org.springframework.dao.DataIntegrityViolationException

class PerguntaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [perguntaInstanceList: Pergunta.list(params), perguntaInstanceTotal: Pergunta.count()]
    }

    def create() {
        def questionarioInstance = Questionario.get(params.questionario.id)
        [perguntaInstance: new Pergunta(params), questionarioInstance: questionarioInstance]
    }

    def save() {
        def perguntaInstance = new Pergunta(params)
        if (!perguntaInstance.save(flush: true)) {
            render(view: "create", model: [perguntaInstance: perguntaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'pergunta.label', default: 'Pergunta'), perguntaInstance.id])
        redirect(action: "show", id: perguntaInstance.id)
    }

    def show(Long id) {
        def perguntaInstance = Pergunta.get(id)
        if (!perguntaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pergunta.label', default: 'Pergunta'), id])
            redirect(controller: "evento", action: "list")
            return
        }

        [perguntaInstance: perguntaInstance]
    }

    def edit(Long id) {
        def perguntaInstance = Pergunta.get(id)
        if (!perguntaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pergunta.label', default: 'Pergunta'), id])
            redirect(controller: "evento", action: "list")
            return
        }

        [perguntaInstance: perguntaInstance]
    }

    def update(Long id, Long version) {
        def perguntaInstance = Pergunta.get(id)
        if (!perguntaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pergunta.label', default: 'Pergunta'), id])
            redirect(controller: "evento", action: "list")
            return
        }

        if (version != null) {
            if (perguntaInstance.version > version) {
                perguntaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'pergunta.label', default: 'Pergunta')] as Object[],
                          "Another user has updated this Pergunta while you were editing")
                render(view: "edit", model: [perguntaInstance: perguntaInstance])
                return
            }
        }

        perguntaInstance.properties = params

        if (!perguntaInstance.save(flush: true)) {
            render(view: "edit", model: [perguntaInstance: perguntaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'pergunta.label', default: 'Pergunta'), perguntaInstance.id])
        redirect(action: "show", id: perguntaInstance.id)
    }

    def delete(Long id) {
        def perguntaInstance = Pergunta.get(id)
        if (!perguntaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pergunta.label', default: 'Pergunta'), id])
            redirect(controller: "evento", action: "list")
            return
        }

        try {
            def questionarioInstance = perguntaInstance.questionario
            perguntaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'pergunta.label', default: 'Pergunta'), id])
            redirect(controller: "questionario", action: "show", id: questionarioInstance.evento.id)
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'pergunta.label', default: 'Pergunta'), id])
            redirect(action: "show", id: id)
        }
    }
}
