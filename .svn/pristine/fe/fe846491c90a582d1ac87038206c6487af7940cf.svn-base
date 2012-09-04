package eventos

import org.springframework.dao.DataIntegrityViolationException

class QuestionarioController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [questionarioInstanceList: Questionario.list(params), questionarioInstanceTotal: Questionario.count()]
    }

    def create() {
        [questionarioInstance: new Questionario(params)]
    }

    def save() {
        def questionarioInstance = new Questionario(params)
        if (!questionarioInstance.save(flush: true)) {
            render(view: "create", model: [questionarioInstance: questionarioInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'questionario.label', default: 'Questionario'), questionarioInstance.id])
        redirect(action: "show", id: questionarioInstance.id)
    }

    def show(Long id) {
        def eventoInstance = Evento.get(id)
        def questionarioInstance = Questionario.findByEvento(eventoInstance)
        if (!questionarioInstance) {
            def questionario = new Questionario(evento: eventoInstance)
            if (!questionario.save(flush: true)) {
                redirect(controller: "evento", action: "show", id: eventoInstance.id)
            }
        }

        [questionarioInstance: questionarioInstance]
    }

    def edit(Long id) {
        def questionarioInstance = Questionario.get(id)
        if (!questionarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'questionario.label', default: 'Questionario'), id])
            redirect(action: "list")
            return
        }

        [questionarioInstance: questionarioInstance]
    }

    def update(Long id, Long version) {
        def questionarioInstance = Questionario.get(id)
        if (!questionarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'questionario.label', default: 'Questionario'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (questionarioInstance.version > version) {
                questionarioInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                    [message(code: 'questionario.label', default: 'Questionario')] as Object[],
                          "Another user has updated this Questionario while you were editing")
                render(view: "edit", model: [questionarioInstance: questionarioInstance])
                return
            }
        }

        questionarioInstance.properties = params

        if (!questionarioInstance.save(flush: true)) {
            render(view: "edit", model: [questionarioInstance: questionarioInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'questionario.label', default: 'Questionario'), questionarioInstance.id])
        redirect(action: "show", id: questionarioInstance.id)
    }

    def delete(Long id) {
        def questionarioInstance = Questionario.get(id)
        if (!questionarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'questionario.label', default: 'Questionario'), id])
            redirect(action: "list")
            return
        }

        try {
            questionarioInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'questionario.label', default: 'Questionario'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'questionario.label', default: 'Questionario'), id])
            redirect(action: "show", id: id)
        }
    }
}
