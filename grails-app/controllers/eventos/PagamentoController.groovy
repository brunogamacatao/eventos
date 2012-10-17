package eventos

import org.springframework.dao.DataIntegrityViolationException

class PagamentoController {
    def springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [pagamentoInstanceList: Pagamento.list(params), pagamentoInstanceTotal: Pagamento.count()]
    }

    def create() {
        [pagamentoInstance: new Pagamento(params)]
    }

    def save() {
        def usuario = Usuario.get(springSecurityService.principal.id)
      
        def pagamentoInstance = new Pagamento(params)
        pagamentoInstance.usuario = usuario
        
        if (!pagamentoInstance.save(flush: true)) {
            render(view: "create", model: [pagamentoInstance: pagamentoInstance])
            return
        }

        def titulo = pagamentoInstance.titulo
        
        if (titulo.pago) {
          titulo.participante.addToEstados(new EstadoInscricao(estado: 'CONFIRMADO')).save(flush: true, failOnError: true)
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'pagamento.label', default: 'Pagamento'), pagamentoInstance.id])
        redirect(action: "show", id: pagamentoInstance.id)
    }

    def show() {
        def pagamentoInstance = Pagamento.get(params.id)
        if (!pagamentoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pagamento.label', default: 'Pagamento'), params.id])
            redirect(action: "list")
            return
        }

        [pagamentoInstance: pagamentoInstance]
    }

    def edit() {
        def pagamentoInstance = Pagamento.get(params.id)
        if (!pagamentoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pagamento.label', default: 'Pagamento'), params.id])
            redirect(action: "list")
            return
        }

        [pagamentoInstance: pagamentoInstance]
    }

    def update() {
        def pagamentoInstance = Pagamento.get(params.id)
        if (!pagamentoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pagamento.label', default: 'Pagamento'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (pagamentoInstance.version > version) {
                pagamentoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'pagamento.label', default: 'Pagamento')] as Object[],
                          "Another user has updated this Pagamento while you were editing")
                render(view: "edit", model: [pagamentoInstance: pagamentoInstance])
                return
            }
        }

        def thumbnailFields = []
        
        def toExclude = []
        
        thumbnailFields.each { if (!request.getFile(it) || request.getFile(it).size <= 0) toExclude << it }
        bindData(pagamentoInstance, params, [exclude: toExclude])

        if (!pagamentoInstance.save(flush: true)) {
            render(view: "edit", model: [pagamentoInstance: pagamentoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'pagamento.label', default: 'Pagamento'), pagamentoInstance.id])
        redirect(action: "show", id: pagamentoInstance.id)
    }

    def delete() {
        def pagamentoInstance = Pagamento.get(params.id)
        if (!pagamentoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pagamento.label', default: 'Pagamento'), params.id])
            redirect(action: "list")
            return
        }

        try {
            pagamentoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'pagamento.label', default: 'Pagamento'), params.id])
            redirect(action: "list")
        } catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'pagamento.label', default: 'Pagamento'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}