package eventos

import org.springframework.dao.DataIntegrityViolationException

class RespostaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [respostaInstanceList: Resposta.list(params), respostaInstanceTotal: Resposta.count()]
    }

    def create() {
        [respostaInstance: new Resposta(params)]
    }

    def save() {
        def respostaInstance = new Resposta(params)
        if (!respostaInstance.save(flush: true)) {
            render(view: "create", model: [respostaInstance: respostaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'resposta.label', default: 'Resposta'), respostaInstance.id])
        redirect(action: "show", id: respostaInstance.id)
    }

    def show(Long id) {
        def respostaInstance = Resposta.get(id)
        if (!respostaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'resposta.label', default: 'Resposta'), id])
            redirect(action: "list")
            return
        }

        [respostaInstance: respostaInstance]
    }

    def edit(Long id) {
        def respostaInstance = Resposta.get(id)
        if (!respostaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'resposta.label', default: 'Resposta'), id])
            redirect(action: "list")
            return
        }

        [respostaInstance: respostaInstance]
    }

    def update(Long id, Long version) {
        def respostaInstance = Resposta.get(id)
        if (!respostaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'resposta.label', default: 'Resposta'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (respostaInstance.version > version) {
                respostaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'resposta.label', default: 'Resposta')] as Object[],
                          "Another user has updated this Resposta while you were editing")
                render(view: "edit", model: [respostaInstance: respostaInstance])
                return
            }
        }

        respostaInstance.properties = params

        if (!respostaInstance.save(flush: true)) {
            render(view: "edit", model: [respostaInstance: respostaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'resposta.label', default: 'Resposta'), respostaInstance.id])
        redirect(action: "show", id: respostaInstance.id)
    }

    def delete(Long id) {
        def respostaInstance = Resposta.get(id)
        if (!respostaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'resposta.label', default: 'Resposta'), id])
            redirect(action: "list")
            return
        }

        try {
            respostaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'resposta.label', default: 'Resposta'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'resposta.label', default: 'Resposta'), id])
            redirect(action: "show", id: id)
        }
    }
}
