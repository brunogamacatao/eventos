package eventos



import org.junit.*
import grails.test.mixin.*

@TestFor(PerguntaController)
@Mock(Pergunta)
class PerguntaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/pergunta/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.perguntaInstanceList.size() == 0
        assert model.perguntaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.perguntaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.perguntaInstance != null
        assert view == '/pergunta/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/pergunta/show/1'
        assert controller.flash.message != null
        assert Pergunta.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/pergunta/list'

        populateValidParams(params)
        def pergunta = new Pergunta(params)

        assert pergunta.save() != null

        params.id = pergunta.id

        def model = controller.show()

        assert model.perguntaInstance == pergunta
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/pergunta/list'

        populateValidParams(params)
        def pergunta = new Pergunta(params)

        assert pergunta.save() != null

        params.id = pergunta.id

        def model = controller.edit()

        assert model.perguntaInstance == pergunta
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/pergunta/list'

        response.reset()

        populateValidParams(params)
        def pergunta = new Pergunta(params)

        assert pergunta.save() != null

        // test invalid parameters in update
        params.id = pergunta.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/pergunta/edit"
        assert model.perguntaInstance != null

        pergunta.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/pergunta/show/$pergunta.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        pergunta.clearErrors()

        populateValidParams(params)
        params.id = pergunta.id
        params.version = -1
        controller.update()

        assert view == "/pergunta/edit"
        assert model.perguntaInstance != null
        assert model.perguntaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/pergunta/list'

        response.reset()

        populateValidParams(params)
        def pergunta = new Pergunta(params)

        assert pergunta.save() != null
        assert Pergunta.count() == 1

        params.id = pergunta.id

        controller.delete()

        assert Pergunta.count() == 0
        assert Pergunta.get(pergunta.id) == null
        assert response.redirectedUrl == '/pergunta/list'
    }
}
