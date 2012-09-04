package eventos

import org.springframework.dao.DataIntegrityViolationException

class BaixaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [baixaInstanceList: Baixa.list(params), baixaInstanceTotal: Baixa.count()]
    }

    def create() {
        [baixaInstance: new Baixa(params)]
    }

    def save() {
        def baixaInstance = new Baixa(params)
        if (!baixaInstance.save(flush: true)) {
            render(view: "create", model: [baixaInstance: baixaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'baixa.label', default: 'Baixa'), baixaInstance.id])
        redirect(action: "show", id: baixaInstance.id)
    }

    def show(Long id) {
        def baixaInstance = Baixa.get(id)
        if (!baixaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'baixa.label', default: 'Baixa'), id])
            redirect(action: "list")
            return
        }

        [baixaInstance: baixaInstance]
    }

    def edit(Long id) {
        def baixaInstance = Baixa.get(id)
        if (!baixaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'baixa.label', default: 'Baixa'), id])
            redirect(action: "list")
            return
        }

        [baixaInstance: baixaInstance]
    }

    def update(Long id, Long version) {
        def baixaInstance = Baixa.get(id)
        if (!baixaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'baixa.label', default: 'Baixa'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (baixaInstance.version > version) {
                baixaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'baixa.label', default: 'Baixa')] as Object[],
                          "Another user has updated this Baixa while you were editing")
                render(view: "edit", model: [baixaInstance: baixaInstance])
                return
            }
        }

        baixaInstance.properties = params

        if (!baixaInstance.save(flush: true)) {
            render(view: "edit", model: [baixaInstance: baixaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'baixa.label', default: 'Baixa'), baixaInstance.id])
        redirect(action: "show", id: baixaInstance.id)
    }

    def delete(Long id) {
        def baixaInstance = Baixa.get(id)
        if (!baixaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'baixa.label', default: 'Baixa'), id])
            redirect(action: "list")
            return
        }

        try {
            baixaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'baixa.label', default: 'Baixa'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'baixa.label', default: 'Baixa'), id])
            redirect(action: "show", id: id)
        }
    }
}
