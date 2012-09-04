package eventos

import org.springframework.dao.DataIntegrityViolationException

class TituloController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [tituloInstanceList: Titulo.list(params), tituloInstanceTotal: Titulo.count()]
    }

    def create() {
        [tituloInstance: new Titulo(params)]
    }

    def save() {
        def tituloInstance = new Titulo(params)
        if (!tituloInstance.save(flush: true)) {
            render(view: "create", model: [tituloInstance: tituloInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'titulo.label', default: 'Titulo'), tituloInstance.id])
        redirect(action: "show", id: tituloInstance.id)
    }

    def show(Long id) {
        def tituloInstance = Titulo.get(id)
        if (!tituloInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'titulo.label', default: 'Titulo'), id])
            redirect(action: "list")
            return
        }

        [tituloInstance: tituloInstance]
    }

    def edit(Long id) {
        def tituloInstance = Titulo.get(id)
        if (!tituloInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'titulo.label', default: 'Titulo'), id])
            redirect(action: "list")
            return
        }

        [tituloInstance: tituloInstance]
    }

    def update(Long id, Long version) {
        def tituloInstance = Titulo.get(id)
        if (!tituloInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'titulo.label', default: 'Titulo'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (tituloInstance.version > version) {
                tituloInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'titulo.label', default: 'Titulo')] as Object[],
                          "Another user has updated this Titulo while you were editing")
                render(view: "edit", model: [tituloInstance: tituloInstance])
                return
            }
        }

        tituloInstance.properties = params

        if (!tituloInstance.save(flush: true)) {
            render(view: "edit", model: [tituloInstance: tituloInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'titulo.label', default: 'Titulo'), tituloInstance.id])
        redirect(action: "show", id: tituloInstance.id)
    }

    def delete(Long id) {
        def tituloInstance = Titulo.get(id)
        if (!tituloInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'titulo.label', default: 'Titulo'), id])
            redirect(action: "list")
            return
        }

        try {
            tituloInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'titulo.label', default: 'Titulo'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'titulo.label', default: 'Titulo'), id])
            redirect(action: "show", id: id)
        }
    }
}
