package eventos

import org.springframework.dao.DataIntegrityViolationException

class CursoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        def eventoInstance = Evento.get(params.evento.id)
        [cursoInstanceList: Curso.findAllByEvento(eventoInstance), eventoInstance: eventoInstance]
    }

    def create(Long id) {
        def eventoInstance = Evento.get(params.evento.id)
        [cursoInstance: new Curso(params), eventoInstance: eventoInstance]
    }

    def save() {
        def cursoInstance = new Curso(params)
        if (!cursoInstance.save(flush: true)) {
            render(view: "create", model: [cursoInstance: cursoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'curso.label', default: 'Curso'), cursoInstance.id])
        redirect(action: "show", id: cursoInstance.id)
    }

    def show(Long id) {
        def cursoInstance = Curso.get(id)
        if (!cursoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'curso.label', default: 'Curso'), id])
            redirect(controller: "evento", action: "list")
            return
        }

        [cursoInstance: cursoInstance]
    }

    def edit(Long id) {
        def cursoInstance = Curso.get(id)
        if (!cursoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'curso.label', default: 'Curso'), id])
            redirect(controller: "evento", action: "list")
            return
        }

        [cursoInstance: cursoInstance]
    }

    def update(Long id, Long version) {
        def cursoInstance = Curso.get(id)
        if (!cursoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'curso.label', default: 'Curso'), id])
            redirect(controller: "evento", action: "list")
            return
        }

        if (version != null) {
            if (cursoInstance.version > version) {
                cursoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'curso.label', default: 'Curso')] as Object[],
                          "Another user has updated this Curso while you were editing")
                render(view: "edit", model: [cursoInstance: cursoInstance])
                return
            }
        }

        cursoInstance.properties = params

        if (!cursoInstance.save(flush: true)) {
            render(view: "edit", model: [cursoInstance: cursoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'curso.label', default: 'Curso'), cursoInstance.id])
        redirect(action: "show", id: cursoInstance.id)
    }

    def delete(Long id) {
        def cursoInstance = Curso.get(id)
        if (!cursoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'curso.label', default: 'Curso'), id])
            redirect(controller: "evento", action: "list")
            return
        }

        try {
            def eventoInstance = cursoInstance.evento
            cursoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'curso.label', default: 'Curso'), id])
            redirect(controller: "evento", action: "show", id: eventoInstance.id)
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'curso.label', default: 'Curso'), id])
            redirect(action: "show", id: id)
        }
    }
}
