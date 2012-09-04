package eventos



import org.junit.*
import grails.test.mixin.*

@TestFor(OpcaoRespostaController)
@Mock(OpcaoResposta)
class OpcaoRespostaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/opcaoResposta/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.opcaoRespostaInstanceList.size() == 0
        assert model.opcaoRespostaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.opcaoRespostaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.opcaoRespostaInstance != null
        assert view == '/opcaoResposta/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/opcaoResposta/show/1'
        assert controller.flash.message != null
        assert OpcaoResposta.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/opcaoResposta/list'

        populateValidParams(params)
        def opcaoResposta = new OpcaoResposta(params)

        assert opcaoResposta.save() != null

        params.id = opcaoResposta.id

        def model = controller.show()

        assert model.opcaoRespostaInstance == opcaoResposta
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/opcaoResposta/list'

        populateValidParams(params)
        def opcaoResposta = new OpcaoResposta(params)

        assert opcaoResposta.save() != null

        params.id = opcaoResposta.id

        def model = controller.edit()

        assert model.opcaoRespostaInstance == opcaoResposta
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/opcaoResposta/list'

        response.reset()

        populateValidParams(params)
        def opcaoResposta = new OpcaoResposta(params)

        assert opcaoResposta.save() != null

        // test invalid parameters in update
        params.id = opcaoResposta.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/opcaoResposta/edit"
        assert model.opcaoRespostaInstance != null

        opcaoResposta.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/opcaoResposta/show/$opcaoResposta.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        opcaoResposta.clearErrors()

        populateValidParams(params)
        params.id = opcaoResposta.id
        params.version = -1
        controller.update()

        assert view == "/opcaoResposta/edit"
        assert model.opcaoRespostaInstance != null
        assert model.opcaoRespostaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/opcaoResposta/list'

        response.reset()

        populateValidParams(params)
        def opcaoResposta = new OpcaoResposta(params)

        assert opcaoResposta.save() != null
        assert OpcaoResposta.count() == 1

        params.id = opcaoResposta.id

        controller.delete()

        assert OpcaoResposta.count() == 0
        assert OpcaoResposta.get(opcaoResposta.id) == null
        assert response.redirectedUrl == '/opcaoResposta/list'
    }
}
