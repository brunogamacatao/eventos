package eventos



import org.junit.*
import grails.test.mixin.*

@TestFor(PagamentoController)
@Mock(Pagamento)
class PagamentoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/pagamento/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.pagamentoInstanceList.size() == 0
        assert model.pagamentoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.pagamentoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.pagamentoInstance != null
        assert view == '/pagamento/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/pagamento/show/1'
        assert controller.flash.message != null
        assert Pagamento.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/pagamento/list'

        populateValidParams(params)
        def pagamento = new Pagamento(params)

        assert pagamento.save() != null

        params.id = pagamento.id

        def model = controller.show()

        assert model.pagamentoInstance == pagamento
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/pagamento/list'

        populateValidParams(params)
        def pagamento = new Pagamento(params)

        assert pagamento.save() != null

        params.id = pagamento.id

        def model = controller.edit()

        assert model.pagamentoInstance == pagamento
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/pagamento/list'

        response.reset()

        populateValidParams(params)
        def pagamento = new Pagamento(params)

        assert pagamento.save() != null

        // test invalid parameters in update
        params.id = pagamento.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/pagamento/edit"
        assert model.pagamentoInstance != null

        pagamento.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/pagamento/show/$pagamento.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        pagamento.clearErrors()

        populateValidParams(params)
        params.id = pagamento.id
        params.version = -1
        controller.update()

        assert view == "/pagamento/edit"
        assert model.pagamentoInstance != null
        assert model.pagamentoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/pagamento/list'

        response.reset()

        populateValidParams(params)
        def pagamento = new Pagamento(params)

        assert pagamento.save() != null
        assert Pagamento.count() == 1

        params.id = pagamento.id

        controller.delete()

        assert Pagamento.count() == 0
        assert Pagamento.get(pagamento.id) == null
        assert response.redirectedUrl == '/pagamento/list'
    }
}
