package eventos

import org.springframework.dao.DataIntegrityViolationException

class OpcaoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [opcaoInstanceList: Opcao.list(params), opcaoInstanceTotal: Opcao.count()]
    }

    def create() {
        def cursoInstance = Curso.get(params.curso.id)
        [opcaoInstance: new Opcao(params), cursoInstance: cursoInstance]
    }

    def save() {
        def opcaoInstance = new Opcao(params)
        if (!opcaoInstance.save(flush: true)) {
            render(view: "create", model: [opcaoInstance: opcaoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'opcao.label', default: 'Opcao'), opcaoInstance.id])
        redirect(action: "show", id: opcaoInstance.id)
    }

    def show(Long id) {
        def opcaoInstance = Opcao.get(id)
        if (!opcaoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'opcao.label', default: 'Opcao'), id])
            redirect(controller: "evento", action: "list")
            return
        }

        [opcaoInstance: opcaoInstance]
    }

    def edit(Long id) {
        def opcaoInstance = Opcao.get(id)
        if (!opcaoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'opcao.label', default: 'Opcao'), id])
            redirect(controller: "evento", action: "list")
            return
        }

        [opcaoInstance: opcaoInstance]
    }

    def update(Long id, Long version) {
        def opcaoInstance = Opcao.get(id)
        if (!opcaoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'opcao.label', default: 'Opcao'), id])
            redirect(controller: "evento", action: "list")
            return
        }

        if (version != null) {
            if (opcaoInstance.version > version) {
                opcaoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'opcao.label', default: 'Opcao')] as Object[],
                          "Another user has updated this Opcao while you were editing")
                render(view: "edit", model: [opcaoInstance: opcaoInstance])
                return
            }
        }

        opcaoInstance.properties = params

        if (!opcaoInstance.save(flush: true)) {
            render(view: "edit", model: [opcaoInstance: opcaoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'opcao.label', default: 'Opcao'), opcaoInstance.id])
        redirect(action: "show", id: opcaoInstance.id)
    }

    def delete(Long id) {
        def opcaoInstance = Opcao.get(id)
        if (!opcaoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'opcao.label', default: 'Opcao'), id])
            redirect(controller: "evento", action: "list")
            return
        }

        try {
            def cursoInstance = opcaoInstance.curso 
            opcaoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'opcao.label', default: 'Opcao'), id])
            redirect(controller: "curso", action: "show", id: cursoInstance.id)
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'opcao.label', default: 'Opcao'), id])
            redirect(action: "show", id: id)
        }
    }
}
