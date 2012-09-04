package eventos



import org.junit.*
import grails.test.mixin.*

@TestFor(RespostaController)
@Mock(Resposta)
class RespostaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/resposta/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.respostaInstanceList.size() == 0
        assert model.respostaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.respostaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.respostaInstance != null
        assert view == '/resposta/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/resposta/show/1'
        assert controller.flash.message != null
        assert Resposta.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/resposta/list'

        populateValidParams(params)
        def resposta = new Resposta(params)

        assert resposta.save() != null

        params.id = resposta.id

        def model = controller.show()

        assert model.respostaInstance == resposta
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/resposta/list'

        populateValidParams(params)
        def resposta = new Resposta(params)

        assert resposta.save() != null

        params.id = resposta.id

        def model = controller.edit()

        assert model.respostaInstance == resposta
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/resposta/list'

        response.reset()

        populateValidParams(params)
        def resposta = new Resposta(params)

        assert resposta.save() != null

        // test invalid parameters in update
        params.id = resposta.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/resposta/edit"
        assert model.respostaInstance != null

        resposta.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/resposta/show/$resposta.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        resposta.clearErrors()

        populateValidParams(params)
        params.id = resposta.id
        params.version = -1
        controller.update()

        assert view == "/resposta/edit"
        assert model.respostaInstance != null
        assert model.respostaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/resposta/list'

        response.reset()

        populateValidParams(params)
        def resposta = new Resposta(params)

        assert resposta.save() != null
        assert Resposta.count() == 1

        params.id = resposta.id

        controller.delete()

        assert Resposta.count() == 0
        assert Resposta.get(resposta.id) == null
        assert response.redirectedUrl == '/resposta/list'
    }
}
