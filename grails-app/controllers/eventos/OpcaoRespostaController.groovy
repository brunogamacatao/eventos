package eventos

import org.springframework.dao.DataIntegrityViolationException

class OpcaoRespostaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [opcaoRespostaInstanceList: OpcaoResposta.list(params), opcaoRespostaInstanceTotal: OpcaoResposta.count()]
    }

    def create() {
        def perguntaInstance = Pergunta.get(params.pergunta.id)
        [opcaoRespostaInstance: new OpcaoResposta(params), perguntaInstance: perguntaInstance]
    }

    def save() {
        def opcaoRespostaInstance = new OpcaoResposta(params)
        if (!opcaoRespostaInstance.save(flush: true)) {
            render(view: "create", model: [opcaoRespostaInstance: opcaoRespostaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'opcaoResposta.label', default: 'OpcaoResposta'), opcaoRespostaInstance.id])
        redirect(action: "show", id: opcaoRespostaInstance.id)
    }

    def show(Long id) {
        def opcaoRespostaInstance = OpcaoResposta.get(id)
        if (!opcaoRespostaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'opcaoResposta.label', default: 'OpcaoResposta'), id])
            redirect(controller: "evento", action: "list")
            return
        }

        [opcaoRespostaInstance: opcaoRespostaInstance]
    }

    def edit(Long id) {
        def opcaoRespostaInstance = OpcaoResposta.get(id)
        if (!opcaoRespostaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'opcaoResposta.label', default: 'OpcaoResposta'), id])
            redirect(controller: "evento", action: "list")
            return
        }

        [opcaoRespostaInstance: opcaoRespostaInstance]
    }

    def update(Long id, Long version) {
        def opcaoRespostaInstance = OpcaoResposta.get(id)
        if (!opcaoRespostaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'opcaoResposta.label', default: 'OpcaoResposta'), id])
            redirect(controller: "evento", action: "list")
            return
        }

        if (version != null) {
            if (opcaoRespostaInstance.version > version) {
                opcaoRespostaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                    [message(code: 'opcaoResposta.label', default: 'OpcaoResposta')] as Object[],
                          "Another user has updated this OpcaoResposta while you were editing")
                render(view: "edit", model: [opcaoRespostaInstance: opcaoRespostaInstance])
                return
            }
        }

        opcaoRespostaInstance.properties = params

        if (!opcaoRespostaInstance.save(flush: true)) {
            render(view: "edit", model: [opcaoRespostaInstance: opcaoRespostaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'opcaoResposta.label', default: 'OpcaoResposta'), opcaoRespostaInstance.id])
        redirect(action: "show", id: opcaoRespostaInstance.id)
    }

    def delete(Long id) {
        def opcaoRespostaInstance = OpcaoResposta.get(id)
        if (!opcaoRespostaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'opcaoResposta.label', default: 'OpcaoResposta'), id])
            redirect(controller: "evento", action: "list")
            return
        }

        try {
            def perguntaInstance = opcaoRespostaInstance.pergunta
            opcaoRespostaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'opcaoResposta.label', default: 'OpcaoResposta'), id])
            redirect(controller: "pergunta", action: "show", id: perguntaInstance.id)
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'opcaoResposta.label', default: 'OpcaoResposta'), id])
            redirect(action: "show", id: id)
        }
    }
}
