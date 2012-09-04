package eventos

import org.springframework.dao.DataIntegrityViolationException

class ConfiguracaoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [configuracaoInstanceList: Configuracao.list(params), configuracaoInstanceTotal: Configuracao.count()]
    }

    def create() {
        [configuracaoInstance: new Configuracao(params)]
    }

    def save() {
        def configuracaoInstance = new Configuracao(params)
        if (!configuracaoInstance.save(flush: true)) {
            render(view: "create", model: [configuracaoInstance: configuracaoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'configuracao.label', default: 'Configuracao'), configuracaoInstance.id])
        redirect(action: "show", id: configuracaoInstance.id)
    }

    def show(Long id) {
        def configuracaoInstance = Configuracao.get(id)
        if (!configuracaoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'configuracao.label', default: 'Configuracao'), id])
            redirect(action: "list")
            return
        }

        [configuracaoInstance: configuracaoInstance]
    }

    def edit(Long id) {
        def configuracaoInstance = Configuracao.get(id)
        if (!configuracaoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'configuracao.label', default: 'Configuracao'), id])
            redirect(action: "list")
            return
        }

        [configuracaoInstance: configuracaoInstance]
    }

    def update(Long id, Long version) {
        def configuracaoInstance = Configuracao.get(id)
        if (!configuracaoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'configuracao.label', default: 'Configuracao'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (configuracaoInstance.version > version) {
                configuracaoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'configuracao.label', default: 'Configuracao')] as Object[],
                          "Another user has updated this Configuracao while you were editing")
                render(view: "edit", model: [configuracaoInstance: configuracaoInstance])
                return
            }
        }

        configuracaoInstance.properties = params

        if (!configuracaoInstance.save(flush: true)) {
            render(view: "edit", model: [configuracaoInstance: configuracaoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'configuracao.label', default: 'Configuracao'), configuracaoInstance.id])
        redirect(action: "show", id: configuracaoInstance.id)
    }

    def delete(Long id) {
        def configuracaoInstance = Configuracao.get(id)
        if (!configuracaoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'configuracao.label', default: 'Configuracao'), id])
            redirect(action: "list")
            return
        }

        try {
            configuracaoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'configuracao.label', default: 'Configuracao'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'configuracao.label', default: 'Configuracao'), id])
            redirect(action: "show", id: id)
        }
    }
}
